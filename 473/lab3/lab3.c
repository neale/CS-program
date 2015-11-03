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

#define REST    0xFF

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

uint8_t count_one = FALSE;
uint8_t count_two = FALSE;
uint8_t multiplier = 1;
uint8_t buffer;

uint8_t debounce_switch(button) {

    static uint16_t state[8] = {0}; //holds present state
    state[button] = (state[button] << 1) | (! bit_is_clear(PINA, button)) | 0xE000;
    if (state[button] == 0xF000) {
        return 1;
    }
    return 0;
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
void scan(void) {
    //******************************************************************************
    uint8_t i = 0;
    /* tri state the LED display */
    PORTB |= 0x70;
    
    for (i = 0; i < 8; i++) {
        if (debounce_switch(i)) {    
            switch(i) {
                case (6):
                    if (count_one) {
                        count_one = FALSE;
                    } else {
                        count_one = TRUE;
                    }
                    break;
                case (7):
                    if (count_two) {
                        count_two = FALSE;
                    } else {
                        count_two = TRUE;
                    }
                    break;
                default:
                    break;
            }
        }
    }
    PORTB = 0x00;
    DDRA = 0xFF;
    if (count_one) { //mode1    
        buffer = 0x80;
        SPDR = buffer;   
        while(!(SPSR & (1 << SPIF))) { }
        multiplier = 2;
        PORTB |= (1 << PB0);
    }
    else if (count_two) { //mode2
        buffer = 0x40;
        multiplier = 4;
        SPDR = buffer;   
        while(!(SPSR & (1 << SPIF))) { }
        PORTB |= (1 << PB0);
    }
    if ((count_one) && (count_two)) {  //mode3
        buffer = 0x70; 
        SPDR = buffer;   
        while(!(SPSR & (1 << SPIF))) { }
        multiplier = 0;
        PORTB |= (1 << PB0);
    } 
    if (!count_one && !count_two) {
        multiplier = 1;
        buffer = 0x00;
        SPDR = buffer;   
        while(!(SPSR & (1 << SPIF))) { }
        PORTB |= (1 << PB0);
    }
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
/* 
 *  void loop() { 
 * n = digitalRead(encoder0PinA);
 * if ((encoder0PinALast == LOW) && (n == HIGH)) {
 * if (digitalRead(encoder0PinB) == LOW) {
 *  encoder0Pos--;
 * } else {
 *  encoder0Pos++;
   }
 *  } 
 *  encoder0PinALast = n;
 * } 
 */
int encoder(int count) {
 
    static uint8_t reverse, forward;
    static uint8_t last_state = REST;
    PORTE |=  (1 << PE6); 
    SPDR = 0xFF;
    while(!(SPSR & (1 << SPIF))) { }
    uint8_t data = SPDR;
    PORTE &= ~(1 << PE6); 
    static uint8_t old_encoder1A = 0;
    static uint8_t old_encoder2A = 0;
    static uint8_t old_encoder1B = 0;
    static uint8_t old_encoder2B = 0;
    static uint8_t encoder1A = 1;
    static uint8_t encoder1B = 1;
    static uint8_t encoder2A = 1;   
    static uint8_t encoder2B = 1;
    static uint8_t inc1, inc2, dec1, dec2, cnt;
    static uint8_t encoder1_shift, encoder2_shift;
    encoder1A = (data & 0x01); //first bit 1
    encoder2A = (data & 0x04); //first bit 2
    encoder1B = (data & 0x02); //second bit 1
    encoder2B = (data & 0x08); //second bit 2
    //if the first bit is set in sequence
    //encoderA is set
    //else its not set, and hasn't been changed. 
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
    if ((encoder1A) && (!old_encoder1A)) {
        if (!encoder1B) {
            inc1 = TRUE;
        } 
        else {
            dec1 = TRUE;
        }
    }
    if ((encoder2A) && (!old_encoder2A)) {
        if (!encoder2B) {
            inc2 = TRUE;
        } 
        else {
            dec2 = TRUE;
        }
    }
    old_encoder1A = encoder1A;
    old_encoder2A = encoder2A;

    if (encoder1A && encoder1B) {
        if(!encoder1_shift) {
            if(dec1) {
                cnt = -multiplier;
            } else {
                cnt = multiplier;
            }
        }
        encoder1_shift = 1;
    }
    if (encoder2A && encoder2B) {
        if(!encoder2_shift) {
            if(dec2) {
                cnt = -multiplier;
            } else {
                cnt = multiplier;
            }
        }
        encoder2_shift = 1;
    }
    count += cnt;
    return count;
}
//***********************************************************************************
//                                   segment_sum                                    
//takes a 16-bit binary input value and places the appropriate equivalent 4 digit 
//BCD segment code in the array segment_data for display.                       
//array is loaded at exit as:  |digit3|digit2|colon|digit1|digit0|
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

ISR(TIMER0_COMP_vect) {
    static int count = 0; 
    static int digit = 1;
    DDRB = 0xF7;
    CLEAR(DDRA);
    SET(PORTA);
    PORTB |= (1 << PB0);

    scan();
    count = encoder(count);
    digits = segsum(count, seg_count);
    DDRA = 0xFF;
    if (count > 1023) {
        count -= 1023;
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
}

/* initialize timer */
void init_clk0(){
    ASSR  |=  (1<<AS0);                //run off external 32khz osc (TOSC)
    TIMSK |=  (1 << OCIE0);            //enable interrupts for output compare match 0
    TCCR0 |=  (1 << CS00) | (1 << WGM01);  //CTC mode, no prescale
    OCR0   =  0x24;
}
//***********************************************************************************
void spi_init(void){

    SPCR  |= (1 << SPE) | (1 << MSTR) | (1 << SPR0);  // Set up SPI mode
    SPSR  |= (1 << SPI2X);  
}
//***********************************************************************************
void main() {
    /* button counter */ 
    /* set port bits 4-7 B as outputs */
    DDRB = 0xF7; 
    PORTB = 0x07;
    DDRE = (1 << PE6);
    CLEAR(DDRA);
    SET(PORTA);
    spi_init();
    init_clk0();
    sei();
    while(1){}//while
    cli();
}//main

