// lab2_skel.c 
// Neale Ratzlaff
// 9.12.08
// 7986
// am798

#define F_CPU 16000000 // cpu speed in hertz 

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <string.h>

#define DIG_ONE   0x01
#define DIG_TWO   0x11
#define DIG_THREE 0x31
#define DIG_FOUR  0x41
#define COLON     0x21 

#define LCD_DATA(d) {           \
    SPDR = 0x01;                \
    while (!(SPSR & 0xSPIF)) {}   \
    SPDR = (d);                 \
    while (!(SPSR & 0xSPIF0)) {}   \
    PORTF |= 0x08;              \
    PORTF &= ~0x08;             \
}

// RS bit = 0
#define LCD_CMD(c) {            \
    SPDR = 0x00;                \
    while (!(SPSR & SPIF)) {}   \
    SPDR = (c);                 \
    while (!(SPSR & SPIF)) {}   \
    PORTF |= 0x08;              \
    PORTF &= ~0x08;             \
}

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

enum enc_dir {REST, DEC, INC};
typedef enum enc_dir dir;

typedef struct {

    int  hoursH;
    int  hoursL;
    int  minutesH;
    int  minutesL;
    uint16_t  seconds;
    int  mode;
    int  hoursH_old;
    int  hoursL_old;
    int  minutesH_old;
    int  minutesL_old;
    int  set_hours;
    int  set_minutes;
    int  alarm_hourH;
    int  alarm_hourL;
    int  alarm_minuteH;
    int  alarm_minuteL;

} Clock;

Clock clock = {0};

volatile uint8_t song;
volatile uint16_t beat;
volatile uint16_t max_beat;
volatile uint8_t  notes;

//Mute is on PORTD
//set the hex values to set and unset the mute pin
//I used PORTD-PIN2
#define mute 0x04
#define unmute 0xFB
//Alarm is also on PORTD
//set the hex value for the alarm pin
//I used PORTD-PIN7
#define ALARM_PIN 0x80
#define NUM_SONGS 4
//set this variable to select the song
//(0-3, unless you add more)


// arming string for alarm
char armed[6] = "ARMED\0";
int digit_mode = 1;
int alarm_now = FALSE;
int snooze_mode = FALSE;
//should only count to 6, counts down the chars to send
int alarm_armed = FALSE;
int arm_count = 6;
uint8_t pos = 0;
int count = 0;
/* holds the seperated digits of count */
unsigned int seg_count[4] = {0};
/* keeps track of which digit is being updated */
uint8_t digit = 1;
/* buttons that correspond to bar graph modes */
uint8_t three     = FALSE;
uint8_t four      = FALSE;
uint8_t five      = FALSE;
uint8_t five_old  = FALSE;
uint8_t six       = FALSE;
uint8_t seven     = FALSE;

int hour_change = 0;
int min_change  = 0;
int music = 0;
int snooze_count = 0;
int button_pressed = FALSE;

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
                //snooze
                case(3):
                    if(alarm_now) {
                        LCD_Clr();
                        LCD_PutStr("Snoozed");
                        snooze_mode = TRUE;
                        alarm_now = FALSE;
                        alarm_armed = FALSE;
                        clock.mode = 0;
                        OCR3A = 0x1000;
                        ICR3  = 0xFFFF;
                        music_off();
                        music = FALSE;

                    }
                    break;
                //display alarm
                case(4):
                    clock.mode = 2;
                    break;
                //state is for setting alarm
                case (5):

                    if(five_old == TRUE) {
                        clock.alarm_hourH   = clock.hoursH;
                        clock.alarm_hourL   = clock.hoursL;
                        clock.alarm_minuteH = clock.minutesH;
                        clock.alarm_minuteL = clock.minutesL;

                        clock.hoursH        = clock.hoursH_old;
                        clock.hoursL        = clock.hoursL_old;
                        clock.minutesH      = clock.minutesH_old;
                        clock.minutesL      = clock.minutesL_old;
                        alarm_armed = TRUE;
                        clock.mode = 0;
                    }
                    else {
                        clock.hoursH_old   = clock.hoursH; 
                        clock.hoursL_old   = clock.hoursL; 
                        clock.minutesH_old = clock.minutesH; 
                        clock.minutesL_old = clock.minutesL;      
                        five_old = TRUE;           
                        clock.mode = 1;
                    }
                    button_pressed = TRUE;
                    break;
                
                //returns to normal
                case (6):
                    
                    if(five_old == TRUE) {
                        clock.alarm_hourH   = clock.hoursH;
                        clock.alarm_hourL   = clock.hoursL;
                        clock.alarm_minuteH = clock.minutesH;
                        clock.alarm_minuteL = clock.minutesL;
                        clock.hoursH        = clock.hoursH_old;
                        clock.hoursL        = clock.hoursL_old;
                        clock.minutesH      = clock.minutesH_old;
                        clock.minutesL      = clock.minutesL_old;
                        alarm_armed = TRUE;
                        five_old = FALSE;
                    } else {
                        clock.alarm_hourH   = 0;
                        clock.alarm_hourL   = 0;
                        clock.alarm_minuteH = 0;
                        clock.alarm_minuteL = 0;
                        alarm_armed = FALSE;
                    }
                    if (!alarm_armed) {
                        LCD_Clr();
                    }
                    if (snooze_mode) {
                        LCD_Clr();
                    }
                    snooze_mode = FALSE;
                    alarm_now = FALSE;
                    music = FALSE;
                    music_off();
                    clock.mode = 0;
                    five_old = FALSE;
                    OCR3A = 0x1000;
                    ICR3  = 0xFFFF;
                    snooze_count = 0;
                    button_pressed = TRUE;
                    break;
                //state is for setting clock
                case (7):
                    if(five_old == TRUE) {
                        clock.alarm_hourH   = clock.hoursH;
                        clock.alarm_hourL   = clock.hoursL;
                        clock.alarm_minuteH = clock.minutesH;
                        clock.alarm_minuteL = clock.minutesL; 
                        clock.hoursH        = clock.hoursH_old;
                        clock.hoursL        = clock.hoursL_old;
                        clock.minutesH      = clock.minutesH_old;
                        clock.minutesL      = clock.minutesL_old;
                        alarm_armed = TRUE;
                        five_old = FALSE;
                    }
                    music = FALSE;
                    music_off();
                    clock.mode = 1;
                    five_old = FALSE;
                    OCR3A = 0x1000;
                    ICR3  = 0xFFFF;
                    snooze_count = 0;
                    button_pressed = TRUE;
                    break;
                default:
                    clock.mode = 0;
                    break;
            }
        }
    
    DDRA = 0xFF; 
    }
}
void scan_encoders(void) {

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
    static uint8_t encoder1_shift = TRUE;
    static uint8_t encoder2_shift = TRUE;
    /* encoders are initialized high, decoders are active low*/
    /* data will hold the current value of SPDR */
    static uint8_t data = 0;
    static dir d1  = REST;
    static dir d2  = REST;
    /* strobe to MISO data */
    DDRE |= (1 << PE1);
    if (clock.mode == 1) { 
        SPDR = 0x01;
    } else if (clock.mode == 2) {
        SPDR = 0x02;
    } else { 
        SPDR = 0x00;
    }
    PORTB |=  (1 << PB0); 
    PORTB &= ~(1 << PB0); 
    d1 = REST;
    d2 = REST;
    while(!(SPSR & (1 << SPIF))) { }
    PORTE &= ~(1 << PE1);
    PORTE |= (1 << PE1);
    data = SPDR;
    /* wait for data */
    /* extract state bits of encoders */
    encoder1A = !((data & (1 << 0))>>0); //first bit 1
    encoder2A = !((data & (1 << 2))>>2); //first bit 2
    encoder1B = !((data & (1 << 1))>>1); //second bit 1
    encoder2B = !((data & (1 << 3))>>3); //second bit 2
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
    /* if its back in the notch position 
     * read the direction and increment as needed
     */
    if ((!old_encoder1A) && (encoder1A)) {
        if (!encoder1B) {
            d1 = INC;
        } else {
            d1 = DEC;
        }
    }
    if ((!old_encoder2A) && (encoder2A)) {
        if (!encoder2B) {
            d2 = INC;
        } else {
            d2 = DEC;
        }
    }
    old_encoder1A = encoder1A;
    old_encoder2A = encoder2A;
    if (!button_pressed) {
        if (encoder1A && encoder1B) {
            if (!encoder1_shift) {
                if (d1 == DEC) {
                    clock.hoursL--;
                } else {
                    clock.hoursL++;
                       //account for overflow
                }
                encoder1_shift = TRUE;
            }
        }
        if (encoder2A && encoder2B) {
            if (!encoder2_shift) {
                if (d2 == DEC) {
                    clock.minutesL--;
               } else {
                    clock.minutesL++;
                }
                encoder2_shift = TRUE;
            }
        }
    }
    button_pressed = FALSE;    
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
    static int colon = 0;
    static int colon_mode = 0;
    static int snooze_now = 0;
    static int lcd_displayed = FALSE;
    static int display = 0;
    static uint8_t digit = 1;
    static int val1, val2, val3, val4;
    static int alarm_disp = FALSE;
    DDRA = 0x00;
    PORTA = 0xFF;
    scan();
    if (alarm_now && !alarm_disp) {

        LCD_Clr();
        LCD_PutStr("ALARM!!");
        alarm_disp = TRUE;
    }
    clock.seconds++;
    switch (clock.mode) {
        case(0):

            if (clock.seconds == 60000) {
                clock.seconds = 0;
                clock.minutesL++;
            }
            colon_mode = 0;
            digit_mode = 1;
            PORTB &= ~(1 << PB0); 
            PORTB |=  (1 << PB0);
            SPDR = 0x00;
            while(!(SPSR & (1 << SPIF))) { }

            if (snooze_mode && !music) {
                music = FALSE;
                if (snooze_count < 10){
                    if (clock.seconds % 1000 == 0) {
                        snooze_count++;
                        if (snooze_count == 10) {
                            snooze_now = TRUE;
                            music_on();
                            music = TRUE;
                        } else { snooze_now = FALSE; }
                    }
                }
            }
            else if (snooze_now && music) {
                alarm_now = TRUE;
                val1 = clock.hoursH;
                val2 = clock.hoursL;
                val3 = clock.minutesH;
                val4 = clock.minutesL;
                colon_mode = 0;
                digit_mode = 0;
                alarm_armed = FALSE;
                music = TRUE;
            }
            else if (((clock.alarm_hourH == clock.hoursH)&&(clock.alarm_hourL == clock.hoursL)&&(clock.alarm_minuteH == clock.minutesH)&&(clock.alarm_minuteL == clock.minutesL))) { 
                if ((alarm_armed == TRUE) && (!music)) {
                    alarm_now = TRUE;
                    val1 = clock.alarm_hourH;
                    val2 = clock.alarm_hourL;
                    val3 = clock.alarm_minuteH;
                    val4 = clock.alarm_minuteL;
                    colon_mode = 0;
                    digit_mode = 0;
                    music_on();
                    music = TRUE;
                    OCR3A = 0x1000;
                    ICR3  = 0xFFFF;
                    snooze_count = 0;

                } else if (((alarm_armed == TRUE) && music)) {
                    alarm_now = TRUE;
                    val1 = clock.alarm_hourH;
                    val2 = clock.alarm_hourL;
                    val3 = clock.alarm_minuteH;
                    val4 = clock.alarm_minuteL;
                    colon_mode = 0;
                    digit_mode = 0;
                }
            } else {
                colon_mode = 0;
                digit_mode = 1;
                music = FALSE;
                music_off();
                OCR3A = 0x1000;
                ICR3  = 0xFFFF;
                snooze_now = FALSE;
            }
            if (clock.minutesL == 10) {
                clock.minutesL = 0;
                clock.minutesH++;
            }
            if (clock.minutesH == 6) {
                clock.minutesH = 0;
                clock.minutesL = 0;
                clock.hoursL++;
            }
            if (clock.hoursH == 2 && clock.hoursL == 4) {
                clock.hoursH = 0;
                clock.hoursL = 0;
            }
            else if (clock.hoursL == 10) {
                clock.hoursL = 0;
                clock.hoursH++;
            } 
            val1 = clock.hoursH;
            val2 = clock.hoursL;
            val3 = clock.minutesH;
            val4 = clock.minutesL;
            
            break;

        case(1):   
         
            colon_mode = 1;
            digit_mode = 1;
            scan_encoders();
            if (clock.hoursL > 9) {
                clock.hoursL = 0;
                clock.hoursH++;
            } else if (clock.hoursH == 2 && clock.hoursL == 5) {
                clock.hoursH = 0;
                clock.hoursL = 0;
            } else if (clock.hoursH <= 0 && clock.hoursL < 0) {
                clock.hoursH = 2;
                clock.hoursL = 3;
            } else if (clock.hoursL < 0) {
                clock.hoursH--;
                clock.hoursL = 9;
            }
            if (clock.minutesL > 9) {
                clock.minutesL = 0;
                clock.minutesH++;
            } else if (clock.minutesH == 6 && clock.minutesL == 0) {
                clock.minutesH = 0;
                clock.minutesL = 0;
            } 
            else if(clock.minutesH == 0 && clock.minutesL < 0) {
                clock.minutesL = 9; 
                clock.minutesH = 5;
            } else if(clock.minutesL < 0) {
                clock.minutesL = 9;
                clock.minutesH--;
            }
            val1  = clock.hoursH;
            val2  = clock.hoursL;
            val3  = clock.minutesH;
            val4  = clock.minutesL;
            break;

        case(2):
            colon_mode = 1;
            digit_mode = 1;
            val1 = clock.alarm_hourH;
            val2 = clock.alarm_hourL;
            val3 = clock.alarm_minuteH;
            val4 = clock.alarm_minuteL;
            break;

        default :
            break;
    }
    switch (colon_mode) {
        case(0):
            if (clock.seconds % 500 == 0) {
                colon = TRUE;
            }
            if (clock.seconds % 1000 == 0) {
               colon = FALSE;
            }
            break;
        case(1):
            colon = TRUE; 
            break;
        case(2):
            colon = FALSE;
            break;
        default:
            break;
    }
    switch (digit_mode) {
        case(0):
            if (clock.seconds % 500 == 0) {
                display = TRUE;
            }
            if (clock.seconds % 1000 == 0) {
                display = FALSE;
            }
            break;
        case(1):
            display = TRUE; 
            break;
        case(2):
            display = FALSE;
            break;
        default:
            break;
    }
    ADCSRA |= (1 << ADSC);
    while (!ADCSRA & (1 << ADIF)) { }
    ADCSRA |=  (1 << ADIF);
    DDRA = 0xFF;
    count = ADCH; 
    if (count > 225) {
        OCR2 = 250;
    } else if (count > 200) {
        OCR2 = 215;
    } else if (count > 175) {
        OCR2 = 180;
    } else if (count > 150) {
        OCR2 = 160;
    } else if (count > 125) {
        OCR2 = 135;
    } else if (count > 100) {
        OCR2 = 115;
    } else if (count > 75) {
        OCR2 = 80;
    } else if (count > 50) {
        OCR2 = 55;
    } else {
        OCR2 = 10;
    }
    if (digit > 5) {
        digit = 1;
    }
    if (digit == 1 && display && val1 > 0) {
        PORTB = DIG_FOUR;
        PORTA = get_segment(val1);  
    }
    else if (digit == 2 && display) {
        PORTB = DIG_THREE; 
        PORTA = get_segment(val2);  

    }
    else if (digit == 3 && display) {
        PORTB = DIG_TWO; 
        PORTA = get_segment(val3);  

    }
    else if (digit == 4 && display) {
        PORTB = DIG_ONE;
        PORTA = get_segment(val4);
    }
    else if (digit == 5 && colon) {    
        PORTB = COLON;
        PORTA = 0x04;
    }
    digit++; 
    if (alarm_armed && (lcd_displayed == FALSE)) {
        LCD_Clr();
        LCD_PutStr("ARMED!!");
        lcd_displayed = TRUE;
    }
    if(clock.seconds % 48 == 0) {
    //for note duration (64th notes) 
        beat++;
    }

    //update digit to display
}

ISR(TIMER1_COMPA_vect) {
  PORTD ^= ALARM_PIN;      //flips the bit, creating a tone
  if(beat >= max_beat) {   //if we've played the note long enough
    notes++;               //move on to the next note
    play_song(song, notes);//and play it
  }
}


//Initialize Timer/Counter 0
void init_clk() {

    ASSR   |= (1<<AS0); //use ext oscillator
    TCCR0  |= (1<<CS00) | (1<<WGM01); //start clock no prescale with CTC mode
    TIMSK  |= (1<<OCIE0); //enable output compare match interrupt
    OCR0    = 32;

    TCCR2  |= (1 << WGM20) | (1 << WGM21) | (1 << CS20);
    TCCR2  |= (1 << COM20) | (1 << COM21);
    OCR2    = 1;   

    TCCR3A |= (1 << COM3A1) | (1 << WGM31) | (1 << CS30); 
    TCCR3B |= (1 << WGM33) | (1 << CS30) | (1 << WGM32);
    OCR3A   = 0x3000;
    ICR3    = 0x4000;
}
/* initialize to 125 kHz (datasheet), using VCC for reference,
 * 8 bit resolution, and then do the first conversion (init) 
 */
void init_adc() {

    DDRF   &= ~(1 << PF0);
    ADCSRA |=  (1 << ADPS0) | (1 << ADPS1) | (1 << ADPS2);
    ADMUX  |=  (1 << REFS0) | (1 << ADLAR);  
    ADCSRA |=  (1 << ADEN); // do the first conversion
}

void init_spi() {
    SPCR |= (1<<SPE) | (1<<MSTR); //Enable SPI and set as master
    SPSR |= (1<<SPI2X); //Enable double SPI speed for master mode

}

uint8_t main() {

    DDRB   = 0xF7;
    DDRE  |= (1 << PE3);
    PORTB  = 0x07; 
    DDRD  |= 0x80;
    DDRF  |= 0x08 | 0x80;
    PORTD  = (1 << PD5) | (1 << PD7);
    CLEAR(DDRA);
    SET(PORTA); 
    init_spi();
    init_clk();
    init_adc();
    music_init();
    //music_on();
    LCD_Init();
    sei();
    while(1){}
    cli();
    return 0;

}//main

