// lab4_skel.c 
// Neale Ratzlaff
// 11.12.08

#define F_CPU 16000000 // cpu speed in hertz 

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <string.h>
#include <stdio.h>
#include "lm73_functions_skel.h"
#include "twi_master.h"
#include "si4734.h"

#define DIG_ONE   0x01
#define DIG_TWO   0x11
#define DIG_THREE 0x31
#define DIG_FOUR  0x41
#define COLON     0x21 

#define BAUD 9600 		
#define UBRR F_CPU/16/BAUD-1

/* These are the routines for sending data to the LCD
 * the first byte is to put the LCD into command mode, 
 * and the second byte is to store data into SRAM
 */
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

volatile uint16_t radio_presets[8] = {8870, 9990, 10630, 9130, 9190, 9230, 9350, 9470};
/* state machine for the encoders, 
 * they're either at rest, or moving 
 */
enum enc_dir {REST, REV, FW};
enum station {AM, FM, SW};
volatile enum station current_station;
typedef enum enc_dir dir;

/* struct to hold all clock data
 * Keeps track of :
       clock time,
       total seconds passed, 
       stores time while setting alarm,
       alarm time
 */
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

/* song variables (to be played by alarm */
/* thank you Roger, 
 * http://web.engr.oregonstate.edu/~traylor/ece473/example_code/kellen_music.c
 * It took my own work to integrate the timing into my system
 */

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


char armed[6] = "ALARM ARMED\0";   // arming string for alarm
int dot = FALSE;                   // alarm indicator on 7seg
int digit_mode = 1;                // mode tells if digits will blink or not
int alarm_now = FALSE;             // state of alarm currently going off
int snooze_mode = FALSE;           // snooze state variable
int alarm_armed = FALSE;           // alarm arming state
int count = 0;                     // holds ADC value
unsigned int seg_count[4] = {0};   // seperates number into digits
uint8_t digit = 1;                 // keeps track of current number displayed to 7seg
int music = 0;                     // if music is currently being changed              
int snooze_count = 0;              // keeps track of seconds in snooze mode, counts to 10
int button_pressed = FALSE;        // True for first loop in new state

int temp_mode = FALSE;
int first_temp = FALSE;

/* buttons that correspond to bar graph modes */
uint8_t three     = FALSE;
uint8_t four      = FALSE;
uint8_t five      = FALSE;
uint8_t five_old  = FALSE;
uint8_t six       = FALSE;
uint8_t seven     = FALSE;

enum radio_band{FM, AM, SW};

extern volatile enum radio_band current_radio_band;

extern uint16_t eeprom_fm_freq;
extern uint16_t eeprom_am_freq;
extern uint16_t eeprom_sw_freq;
extern uint8_t  eeprom_volume;

extern volatile uint16_t current_fm_freq;
extern uint16_t current_am_freq;
extern uint16_t current_sw_freq;
extern uint8_t  current_volume;

int16_t fm_preset_eeprom;
uint16_t am_preset_eeprom;
uint16_t sw_preset_eeprom;
uint8_t  vol_preset_eeprom;

uint16_t volume  = 0;
uint16_t am_freq = 0;
uint16_t sw_freq = 0;
volatile uint16_t fm_freq = 0;
volatile uint16_t fm_freq_temp = 9990;

extern char lcd_local_data[15]  = "Local Temp: ";
extern char lcd_remote_data[16] = "Remote Temp: ";
extern char lcd_radio_data[32]  = {0};
extern uint8_t si4734_status[8]; 

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
                case(2):
                    temp_mode = TRUE;
                    first_temp = TRUE;
                    break;
                case(3):
                    /* display snooze on LCD, adjust volume to off, and set snooze mode */
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
                    temp_mode = FALSE;
                    break;
                //display alarm
                case(4):
                    temp_mode = FALSE;
                    clock.mode = 2;
                    break;
                //state is for setting alarm
                case (5):
                    /* if we just came from alarm mode,
                     * set the alarm time to the displayed time
                     * grab the old clock time and send to display
                     */
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
                        dot = TRUE;              
                        clock.mode = 0;
                    }
                    else {
                    /* otherwise enter alarm mode and store clock time */
                        clock.hoursH_old   = clock.hoursH; 
                        clock.hoursL_old   = clock.hoursL; 
                        clock.minutesH_old = clock.minutesH; 
                        clock.minutesL_old = clock.minutesL;      
                        five_old = TRUE;          
                        dot = FALSE; 
                        clock.mode = 1;
                    }
                    button_pressed = TRUE;
                    temp_mode = FALSE;
                    break;
                
                /* Mode to return to normal */
                case (6):
                    if (temp_mode == TRUE) {
                        temp_mode = FALSE;
                    }
                    /* first set alarm if we came from alarm mode */
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
                        dot = TRUE;
                    /* otherwise reset alarm to 0 */
                    } else {
                        clock.alarm_hourH   = 0;
                        clock.alarm_hourL   = 0;
                        clock.alarm_minuteH = 0;
                        clock.alarm_minuteL = 0;
                        alarm_armed = FALSE;
                    }
                    /* clear LCD if the alarm is not armed or if in snooze */
                    if (!alarm_armed) {
                        LCD_Clr();
                    }
                    if (snooze_mode) {
                        LCD_Clr();
                    }
                    /* basically reset everything back to a nominal way */
                    /* there needs to be a method for the user to get back to 0 */
                    snooze_mode = FALSE;
                    alarm_now = FALSE;
                    music = FALSE;
                    music_off();
                    clock.mode = 0;
                    five_old = FALSE;
                    OCR3A = 0x1000;
                    ICR3  = 0xFFFF;
                    snooze_count = 0;
                    break;
                //state is for setting clock
                case (7):
                    temp_mode = FALSE;
                    /* store the alarm */
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
                        dot = TRUE;
                    }
                    /* go to clock set mode */
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
    static uint8_t old_encoder1_1 = 0;
    static uint8_t old_encoder2_1 = 0;
    static uint8_t encoder1_1 = 1;
    static uint8_t encoder1_2 = 1;
    static uint8_t encoder2_1 = 1;   
    static uint8_t encoder2_2 = 1;
    static uint8_t encoder1_shift = TRUE;
    static uint8_t encoder2_shift = TRUE;
    /* encoders are initialized high, decoders are active low*/
    /* data will hold the current value of SPDR */
    static uint8_t data = 0;
    static dir enc1  = REST;
    static dir enc2  = REST;
    /* strobe to MISO data */
    DDRE |= (1 << PE6);
    if (clock.mode == 1) { 
        SPDR = 0x01;
    } else if (clock.mode == 2) {
        SPDR = 0x02;
    } else { 
        SPDR = 0x00;
    }
    PORTB |=  (1 << PB0); 
    PORTB &= ~(1 << PB0); 
    enc1 = REST;
    enc2 = REST;
    while(!(SPSR & (1 << SPIF))) { }
    PORTE &= ~(1 << PE6);
    PORTE |= (1 << PE6);
    data = SPDR;
    /* wait for data */
    /* extract state bits of encoders */
    encoder1_1 = !((data & (1 << 0))>>0); //first bit 1
    encoder2_1 = !((data & (1 << 2))>>2); //first bit 2
    encoder1_2 = !((data & (1 << 1))>>1); //second bit 1
    encoder2_2 = !((data & (1 << 3))>>3); //second bit 2
    /* if the bit is not set, then its changing */
    /* encoders are active low, so is level is low
     * then its still active and it hasn't counted yet 
     */

    if (!encoder1_1) {
        encoder1_shift = FALSE;
    }
    if (!encoder1_2) { 
        encoder1_shift = FALSE;
    }
    if (!encoder2_1) {
        encoder2_shift = FALSE;
    }
    if (!encoder2_2) {
        encoder2_shift = FALSE;
    } 
    /* if its back in the notch position 
     * read the direction and increment as needed
     */
    if ((!old_encoder1_1) && (encoder1_1)) {
        if (!encoder1_2) {
            enc1 = FW;
        } else {
            enc1 = REV;
        }
    }
    if ((!old_encoder2_1) && (encoder2_1)) {
        if (!encoder2_2) {
            enc2 = FW;
        } else {
            enc2 = REV;
        }
    }
    old_encoder1_1 = encoder1_1;
    old_encoder2_1 = encoder2_1;
    if (!button_pressed) {
        if (encoder1_1 && encoder1_2) {
            if (!encoder1_shift) {
                if (enc1 == REV) {
                    clock.hoursL--;
                } else {
                    clock.hoursL++;
                       //account for overflow
                }
                encoder1_shift = TRUE;
            }
        }
        if (encoder2_1 && encoder2_2) {
            if (!encoder2_shift) {
                if (enc2 == REV) {
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
    static int colon = 0;               // holds if the colon is on or off
    static int colon_mode = 0;          // sets the colon mode: (0: blinking, 1: solid)
    static int snooze_now = 0;          // if the snooze is currenly alarming
    static int lcd_displayed = FALSE;   // if the LCD is currently displaying
    static int display = 0;             // if the leading 0 should be displayed
    static uint8_t digit = 1;           // holds what digit is being displayed
    static int val1, val2, val3, val4;  // values to be sent to the display
    static int alarm_disp = FALSE;      // if the LCD is displaying alarm data
    static unsigned char c = NULL;      // if the LCD is displaying alarm data
    static int uart_displayed = FALSE;      // if the LCD is displaying alarm data
    static unsigned char uart_r[16] = {0};      // if the LCextern uint8_t lm73_wr_buf[2];
	extern uint8_t lm73_rd_buf[2];
	static uint16_t lm73_temp;
	static uint16_t celsius;
    DDRA = 0x00;                
    PORTA = 0xFF;
    scan();
    
    /* prints alarm data to the LCD once */
    if (alarm_now && !alarm_disp) {

        LCD_Clr();
        LCD_PutStr("ALARM!!");
        alarm_disp = TRUE;
    }
    clock.seconds++;  //ms really
    /* clock mode
     * timer counts up by milliseconds for each interrupt
     * checks for equality for the alarm and triggers if equal
     * in snooze mode, times for 10 seconds and triggers alarm at 10s
     * handles the enge cases of incrementing time through 24:00 and xx:60
     */
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
            /* send to display */
            val1 = clock.hoursH;
            val2 = clock.hoursL;
            val3 = clock.minutesH;
            val4 = clock.minutesL;
            
            break;
        /* set clock mode
         * used for both setting alarm and clock
         * gets data from the encoders and increments the min/hours accordingly
         * then it proceeds to handle the overflow/underflow cases:
               25:00 becomes 00:00,
               x9:00,
               00:00 becomes 23:59,
               and so on
         */
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
        /* simply displays alarm time on the LCD
         * displays 0:00 if nothing is set
         */
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
    /* mode controller for the colon, 
     * blinks in one-second intervals if in clock mode or alarm is triggered
     * is static if in setting mode
     */
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
    /* mode controller for digits
     * blinks in one second intervals when alarm is going off
     * always static otherwise
     */
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
    /* get data from the ADC:
           start conversion
           wait until interrupt flag goes (more reliable than ADSC)
           get data from ADCH
    */
    ADCSRA |= (1 << ADSC);
    while (!ADCSRA & (1 << ADIF)) { }
    ADCSRA |=  (1 << ADIF);
    DDRA = 0xFF;
    count = ADCH; 

    /* brightness levels for dimming display (pwm) */
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
    /* only displays one number to the 7seg at a time (speedy) */
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
        if (dot) {
            PORTA &= ~(1 << 7);
        }
    }
    else if (digit == 5 && colon) {    
        PORTB = COLON;
        PORTA = 0x04;
    }
    digit++; 

    if (temp_mode) {// && (uart_displayed == FALSE)) {
        if (first_temp) {
            LCD_Clr();
        }
        first_temp = FALSE;
        LCD_PutStr(lcd_local_data);
        LCD_MovCursorLn2(); 
        LCD_PutStr(lcd_remote_data);
    } 
    /* sets the LCD mesage if the alarm is armed */
    if (!temp_mode && alarm_armed && (lcd_displayed == FALSE)) {
        LCD_Clr();
        LCD_PutStr("ARMED!!");
        lcd_displayed = TRUE;
    }
    /* beat counter for the alarm song 
     * increments the note by one each pass
     */
    if(clock.seconds % 48 == 0) {
    //for note duration (64th notes) 
        beat++;
    }

    //update digit to display
}

ISR(USART0_RX_vect){	//USART transmission recieved interrupt


    uint16_t celsius = UDR0;	//store data from USART recieve
	uint16_t local_temp;
    extern uint8_t lm73_wr_buf[2];
	extern uint8_t lm73_rd_buf[2];
	uint16_t lm73_temp;

    twi_start_rd(LM73_ADDRESS, lm73_rd_buf, 2);  //read the temperature
	_delay_ms(2);
	lm73_temp  = lm73_rd_buf[0];    //the high temperature byte
	lm73_temp  = (lm73_temp << 8);  //push into top byte for return value
	lm73_temp |= lm73_rd_buf[1];    //temperature bytes are now assembled
	
    celsius = lm73_temp/128;
    local_temp = celsius;
    char radio_settings[4];
	
	if (preset_enable) {
		current_fm_freq_temp = presets[preset_index];
		sprintf(radio_char, "%d", presets[preset_index]);
	}
	else	//display regular freq on display
		sprintf(radio_char, "%d", current_fm_freq);
	if(current_fm_freq > 9990)	//if it is 4 digits to display
	{
		lcd_string_array[26] = radio_char[0];
		lcd_string_array[27] = radio_char[1];
		lcd_string_array[28] = radio_char[2];
		lcd_string_array[30] = radio_char[3];
	}
	else				//else its 3 digits
	{
		lcd_string_array[26] = ' ';
		lcd_string_array[27] = radio_char[0];
		lcd_string_array[28] = radio_char[1];
		lcd_string_array[30] = radio_char[2];
	}

	char test[2];
	
    sprintf(test,"%d",local_temp);	
    lcd_local_data[12] = test[0];
	lcd_local_data[13] = test[1];
	
    //lcd_string_array[1][9] = test[0];
	//lcd_string_array[1][10] = test[1];
	
	//lcd_string_array[0][17] = test[0];
	//lcd_string_array[0][18] = test[1];
    	
	sprintf(test,"%d",celsius);	
    lcd_remote_data[13] = test[0];
	lcd_remote_data[14] = test[1];

    if (fm_freq != current_fm_freq_temp) {
		fm_freq = fm_freq_temp;
		fm_tune_freq();
	}
	if ((volume != volume_final) && (fm_prev == 1)) {
		volume_final = volume;
		OCR3A = volume_final;
	}
	if (fm == 1) {
		OCR3A = volume_final;
		fm_pwr_up();
		for(var = 0; var < 2; var++) {
			fm_tune_freq();
			fm_freq = fm_freq_temp;
		}
		fm = 2; //default to the "do nothing" case
	}
	else if(!fm) {
		fm = 2; //default to the "do nothing" case
		radio_pwr_dwn();
	}
	if(fm_prev)	{
		//fm_rsq_status();
		//sig_strength = si4734_tune_status_buf[5];
	}
    
}

/* timer1 routine to generate the song tones
 * goes off every 64th of a second to play a note
 */
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

    // Used a fast PWM where duty cycle and frequency can be changed. 
    // For volume control
    TCCR3A |= (1 << COM3A1) | (1 << WGM31) | (1 << CS30); 
    TCCR3B |= (1 << WGM33) | (1 << CS30) | (1 << WGM32);
    OCR3A   = 0x3000; //volume range
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
void init_uart() {
	// Set baud rate
    unsigned int ubrr = UBRR;
	UBRR0H = (unsigned char)(ubrr>>8);
	UBRR0L = (unsigned char)ubrr;

	// Enable receiver, transmitter and receive interrupt
	UCSR0B = (1 << RXEN0) | (1 << TXEN0) | (1 << RXCIE0);

	// Set frame format: 8data, 2stop bit 
	UCSR0C = (1 << USBS0) | (1 << UCSZ01) | (1 << UCSZ00);
}

unsigned char uart_receive(){

    int timer = 0;
    /* Wait for data to be received */
    while (!(UCSR1A & (1<<RXC1))){
        timer++;
        if (timer >= 4000) {
            return 0;
        }
    }
    /* Get and return received data from buffer */
    return UDR1;
}
void uart_putc(unsigned char data){
    /* Wait for empty transmit buffer */
    while (!( UCSR1A & (1<<UDRE1)));
    /* Put data into buffer, sends the data */
    UDR1 = data;
}

void uart_puts(unsigned char * data){
    /* Wait for empty transmit buffer */
    int i = 0;
    while (data[i] != NULL) {
        uart_putc(data[i]);
        i++;       
    }
}

void init_si4734() {

    EICRB |=  (1 << ISC71) | (1 << ISC70);
    EIMSK |=  (1 << INT7);
    //Toggle pins to reset radio board
    DDRE  |=  (1 << PE2);
	PORTE &= ~(1 << PE7);
	DDRE  |=  (1 << PE7);
	PORTE |=  (1 << PE2);
    _delay_us(200);
    PORTE &= ~(1 << PE2);
    _delay_us(30);
    DDRE &=  ~(0x80);
    //default frequency
	current_fm_freq = 9990;
}


int main() {

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
    init_twi();
    music_init();
    init_uart();
    //music_on();
    LCD_Init();
    init_si4734();
    sei();
    while(1){}
    cli();
    return 0;

}//main
