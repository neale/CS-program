// lab2_skel.c 
// Neale Ratzlaff
// 9.12.08
// 7986
// am798
//  HARDWARE SETUP:
//  PORTA is connected to the segments of the LED display. and to the pushbuttons.
//  PORTA.0 corresponds to segment a, PORTA.1 corresponds to segement b, etc.
//  PORTB bits 4-6 go to a,b,c inputs of the 74HC138.
//  PORTB bit 7 goes to the PWM transistor base.

#define F_CPU 16000000 // cpu speed in hertz 

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

#define DIG_ONE 0x01
#define DIG_TWO 0x11
#define DIG_THREE 0x31
#define DIG_FOUR 0x41

#define LENC_FWD_1 SPDR & 0xFE
#define LENC_FWD_2 SPDR & 0xFC
#define LENC_FWD_3 SPDR & 0xFD


#define LENC_REV_1 SPDR & 0xFD
#define LENC_REV_2 SPDR & 0xFC
#define LENC_REV_3 SPDR & 0xFE

#define RESTL 0xFF

#define LSTATE1  0xFE
#define LSTATE2  0xFC
#define LSTATE3  0xFD

#define RSTATE1  0xFB
#define RSTATE2  0xF3
#define RSTATE3  0xF7


#define RENC_FWD_1 SPDR & 0xFB
#define RENC_FWD_2 SPDR & 0xF3
#define RENC_FWD_3 SPDR & 0xF7

#define RENC_REV_1 SPDR & 0xF7
#define RENC_REV_2 SPDR & 0xF3
#define RENC_REV_3 SPDR & 0xFB



#define ONE   0b11111001
#define TWO   0b10100100
#define THREE 0b10110000
#define FOUR  0b10011001
#define FIVE  0b10010010
#define SIX   0b10000010
#define SEVEN 0b11111000
#define EIGHT 0b10000000
#define NINE  0b10010000
#define ZERO  0b11000000

#define TRUE 1
#define FALSE 0
#define CLEAR(x) (x = 0x00)
#define SET(x) (x = 0xFF)
#define BAR_EN PORTB &=~(1<<PB0);PORTD &=~(1<<PD4);PORTE |=(1 << PE6)
#define BAR_N PORTB |= (1<<PB0);PORTD |=(1<<PD4)
#define ENC_EN PORTB |=(1<<PB0);PORTE &=~(1<<PE6)
#define ENC_N PORTE |= (1 << PE6)

/* holds the seperated digits of count */
unsigned int seg_count[4] = {0};
/* keeps track of which digit is being updated */
uint8_t digit = 1;
/* how many digits make up count */
uint8_t digits = 0;
/* buttons that correspond to bar graph modes */
uint8_t count_two = FALSE;
uint8_t count_four = FALSE;
/* current number to count up by: bar graph modes */
uint8_t multiplier = 1;
/* holds the value to send to bar graph */
uint8_t buffer = 0;

uint8_t debounce_switch(button) {

    static uint16_t state[8] = {0}; //holds present state
    state[button] = (state[button] << 1) | (! bit_is_clear(PINA, button)) | 0xE000;
    if (state[button] == 0xF000) {
        return 1;
    }
    return 0;
}

void scan(void) {

    int i = 0;
    /* use dec7 to tristate the LEDs */
    /* keep SS high */
    PORTB |= 0x71; 
    for (i = 0; i < 8; i++) {
        if (debounce_switch(i)) {    
            switch(i) {
                case (6):
                    count_two = !count_two;
                    break;
                case (7):
                    count_four = !count_four;
                    break;
                default:
                    break;
            }
        }
    }
    DDRA = 0xFF; 
    /* Enters the modes for the count */
    if (!count_two && !count_four) {
        multiplier = 1;
        buffer = 0x80;
    }
    else if (count_two && count_four) {
        multiplier = 0;
        buffer = 0x00;
   }
    else if (count_two) {
        multiplier = 2;
        buffer = 0xC0;
   }
    else if (count_four) {
        multiplier = 4;
        buffer = 0xF0;

    }
    /* send out to bar graph display */
    SPDR = buffer;
    while (!(SPSR & (1 << SPIF))) { }
    /* strobe */
    PORTB &= ~(1 << PB0);
    PORTB |=  (1 << PB0);

}
int scan_encoders(int count) {
    
    /* encoder state machine 
     * old values are listed along with new ones
       if the state of the old value increments to new value 
       then the direction is updated and count is incremented
       if reverse, count is decremented
     */
    static uint8_t old_encoder1A = 0;
    static uint8_t old_encoder2A = 0;
    static uint8_t encoder1A = 1;
    static uint8_t encoder1B = 1;
    static uint8_t encoder2A = 1;   
    static uint8_t encoder2B = 1;
    static uint8_t clkwise1 = 0;
    static uint8_t clkwise2 = 0;
    clkwise1 = 0;
    clkwise2 = 0;
    static int cnt = 0;
    cnt = 0;
    static uint8_t encoder1_shift = TRUE;
    static uint8_t encoder2_shift = TRUE;
    /* encoders are initialized high, decoders are active low*/
    encoder1A = 1;
    encoder1B = 1;
    encoder2A = 1;
    encoder2B = 1;
    /* data will hold the current value of SPDR */
    static uint8_t data = 0;
    /* strobe to MISO data */
    /* write junk */
    DDRE |= (1 << PE1);
    PORTE &= ~(1 << PE1);
    PORTE |= (1 << PE1);
    SPDR = 0x00;
    while(!(SPSR & (1 << SPIF))) { }
    data = SPDR;
    /* wait for data */
    /* extract state bits of encoders */
    encoder1A = (data & (1 << 0))>>0; //first bit 1
    encoder2A = (data & (1 << 2))>>2; //first bit 2
    encoder1B = (data & (1 << 1))>>1; //second bit 1
    encoder2B = (data & (1 << 3))>>3; //second bit 2
    /* if the bit is not set, then its changing */
    /* encoders are active low, so is level is low
     * then its still active and it hasn't counted yet 
     */
    if (!encoder1A) {
        encoder1_shift = FALSE;
    }
    if (!encoder1B) { 
        encoder1_shift = FALSE;
    }
    if (!encoder2A) {
        encoder2_shift = FALSE;
    }
    if (!encoder2B) {
        encoder2_shift = FALSE;
    }
    /* if the cycle has been completed register a count
     * if the second bit was clear its clockwise
     * otherwise its ccw
     */
    if ((encoder1A) && (!old_encoder1A)) {
        if (!encoder1B) {
            clkwise1 = TRUE;
        } 
        else {
            clkwise1 = FALSE;
        }
    }
    if ((encoder2A) && (!old_encoder2A)) {
        if (!encoder2B) {
            clkwise2 = TRUE;
        } 
        else {
            clkwise2 = FALSE;
        }
    }
    /* set old states to new states */
    old_encoder1A = encoder1A;
    old_encoder2A = encoder2A;
    
    /* if its back in the notch position 
     * read the direction and increment as needed
     */
    if (encoder1A && encoder1B) {
        if (!encoder1_shift) {
            if (!clkwise1) {
                cnt -= multiplier; 
            } else {
                cnt += multiplier;
            }
            encoder1_shift = TRUE;
        }
    }
    if (encoder2A && encoder2B) {
        if (!encoder2_shift) {
            if (!clkwise2) {
                cnt -= multiplier;
            } else {
                cnt += multiplier;
            }
            encoder2_shift = TRUE;
        }
    } //else { cnt += 10; } 
    /* return the count variable */  

    return cnt;
}
uint8_t get_segment(uint8_t bcd) {

    switch (bcd) {

        case(1) :
            return ONE;
            break;
        case(2) :
            return TWO;
            break;
        case(3) :
            return THREE;
            break;
        case(4) :
            return FOUR;
            break;
        case(5) :
            return FIVE;
            break;
        case(6) :
            return SIX;
            break;
        case(7) :
            return SEVEN;
            break;
        case(8) :
            return EIGHT;
            break;
        case(9) :
            return NINE;
            break;
        case(0) :
            return ZERO;
            break;
        default:
            return 0;
            break;
    }   
}

//******************************************************************************
//                            chk_buttons                                      
//Checks the state of the button number passed to it. It shifts in ones till   
//the button is pushed. Function returns a 1 only once per debounced button    
//push so a debounce and toggle function can be implemented at the same time.  
//Adapted to check all buttons from Ganssel's "Guide to Debouncing"            
//Expects active low pushbuttons on PINA port.  Debounce time is determined by 
//external loop delay times 12. 
//
//******************************************************************************

//***********************************************************************************
//                                   segment_sum                                    
//takes a 16-bit binary input value and places the appropriate equivalent 4 digit 
//BCD segment code in the array segment_data for display.                       
int segsum(uint16_t count, unsigned int digit_array[]) { 

    uint8_t i = 0;
    uint8_t digits = 0;
    uint8_t sum = count;
    /* get the number of digits from count */
    while (sum != 0) {
        sum /= 10;
        digits++;
    }
    for (i = 0; i < 4; i++) {
        digit_array[i] = 0;
    }
    //break up decimal sum into 4 digit-segments
    digit_array[0] = count % 10;
    digit_array[1] = count/10 % 10;
    digit_array[2] = count/100 % 10; 
    digit_array[3] = count/1000 % 10;


    return digits;
    //blank out leading zero digits 
    //now move data to right place for misplaced colon position
}//segment_sum

//***********************************************************************************
//
ISR(TIMER0_COMP_vect) {
    //set port bits 4-7 B as outputs
    DDRB = 0xF7;
    //Set SS high
    PORTB = 0xF7;
    static uint8_t digits = 0;
    static uint8_t digit = 1;
    static int count = 0;
    static int diff = 0;
    //states for bar graph
    DDRA = 0x00;
    PORTA = 0xFF;
    scan();
    digits = segsum(count, seg_count);
    diff = 0;
    diff = scan_encoders(count);
    count += diff;
    DDRA = 0xFF;
    if (count > 1023) {
        count -= 1023;
    }
    else if (count < 0) {
        count += 1023;
    }
    if (digit > 4) {
        digit = 1;
    }
    if (digit == 1) {
        PORTB = DIG_ONE;
        PORTA = get_segment(seg_count[0]);  
    }
    else if (digit == 2 && count >= 10) {
        PORTB = DIG_TWO; 
        PORTA = get_segment(seg_count[1]);  

    }
    else if (digit == 3 && count >= 100) {
        PORTB = DIG_THREE; 
        PORTA = get_segment(seg_count[2]);  

    }
    else if (digit == 4 && count >= 1000) {
        PORTB = DIG_FOUR;
        PORTA = get_segment(seg_count[3]);
    }
    digit++; 
    //update digit to display
}

//Initialize Timer/Counter 0
void init_clk0() {
    ASSR |= (1<<AS0); //use ext oscillator
    TCCR0 |= (1<<CS00) | (1<<WGM01); //start clock no prescale with CTC mode
    TIMSK |= (1<<OCIE0); //enable output compare match interrupt
    OCR0 = 128;
}

void init_spi() {
    SPCR |= (1<<SPE) | (1<<MSTR); //Enable SPI and set as master

    SPSR |= (1<<SPI2X); //Enable double SPI speed for master mode

}


uint8_t main() {

    DDRB = 0xF7;
    PORTB = 0x07; 
    CLEAR(DDRA);
    SET(PORTA); 
    
    init_spi();
    init_clk0();
    sei();
    while(1){}
    cli();
    return 0;
}//main
