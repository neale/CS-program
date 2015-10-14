// lab2_skel.c 
// Neale Ratzlaff
// 9.12.08

//  HARDWARE SETUP:
//  PORTA is connected to the segments of the LED display. and to the pushbuttons.
//  PORTA.0 corresponds to segment a, PORTA.1 corresponds to segement b, etc.
//  PORTB bits 4-6 go to a,b,c inputs of the 74HC138.
//  PORTB bit 7 goes to the PWM transistor base.

#define F_CPU 16000000 // cpu speed in hertz 

#include <avr/io.h>
#include <util/delay.h>

#define DIG_ONE 0x00
#define DIG_TWO 0x10
#define DIG_THREE 0x30
#define DIG_FOUR 0x40

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

#define CLEAR(x) (x = 0x00)
#define SET(x) (x = 0xFF)

uint8_t debounce_switch(button) {
    
    static uint16_t state[8] = {0}; //holds present state
    switch (button) {
        case(0):
            state[button] = (state[button] << 1) | (! bit_is_clear(PINA, button)) | 0xE000;
            break;
        case(1):
            state[button] = (state[button] << 1) | (! bit_is_clear(PINA, button)) | 0xE000;
            break;
        case(2):
            state[button] = (state[button] << 1) | (! bit_is_clear(PINA, button)) | 0xE000;
            break;
        case(3):
            state[button] = (state[button] << 1) | (! bit_is_clear(PINA, button)) | 0xE000;
            break;
        case(4):
            state[button] = (state[button] << 1) | (! bit_is_clear(PINA, button)) | 0xE000;
            break;
        case(5):
            state[button] = (state[button] << 1) | (! bit_is_clear(PINA, button)) | 0xE000;
            break;
        case(6):
            state[button] = (state[button] << 1) | (! bit_is_clear(PINA, button)) | 0xE000;
            break;
        case(7):
            state[button] = (state[button] << 1) | (! bit_is_clear(PINA, button)) | 0xE000;
        default:
            break;
    }
    if (state[button] == 0xF000) {
        return 1;
    }
    return 0;
}

int __builtin_popcount (unsigned int x);

//******************************************************************************
//                            chk_buttons                                      
//Checks the state of the button number passed to it. It shifts in ones till   
//the button is pushed. Function returns a 1 only once per debounced button    
//push so a debounce and toggle function can be implemented at the same time.  
//Adapted to check all buttons from Ganssel's "Guide to Debouncing"            
//Expects active low pushbuttons on PINA port.  Debounce time is determined by 
//external loop delay times 12. 
//
uint16_t scan(uint16_t count) {
//******************************************************************************
    int i = 0;
    PORTB = 0x70;
    for (i = 0; i < 8; i++) {
        if (debounce_switch(i)) {    
            count += (1 << i);
            if (count > 1023) {
                count -= 1023;
            }
        }
    }
    SET(PORTB);
    return count;
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
//***********************************************************************************
//                                   segment_sum                                    
//takes a 16-bit binary input value and places the appropriate equivalent 4 digit 
//BCD segment code in the array segment_data for display.                       
//array is loaded at exit as:  |digit3|digit2|colon|digit1|digit0|
int segsum(uint16_t count, unsigned int digit_array[]) { 

    int digits = 0;
    int sum = count;
    while (sum != 0) {
        sum /= 10;
        digits++;
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



//***********************************************************************************
void main() {
    uint16_t count = 0;
    unsigned int seg_count[4] = {0};
    uint8_t digits = 0;
    //set port bits 4-7 B as outputs
    int digit = 0;
    DDRB = 0xF0;
    CLEAR(PORTB);
    CLEAR(DDRA);
    SET(PORTA);
    while(1){
        if (digit > 4) {
            digit = 0;
        }
        //insert loop delay for debounce  
        _delay_ms(2);
        //make PORTA an input port with pullups 
        SET(PORTA);
        CLEAR(DDRA);
        //enable tristate buffer for pushbutton switches
        //bound the count to 0 - 1023
        count = scan(count);
       
       
        SET(DDRA);
        SET(DDRB);
        //break up the disp_value to 4, BCD digits in the array: call (segsum)
        digits = segsum(count, seg_count);
        //bound a counter (0-4) to keep track of digit to display 
        //make PORTA an output
      
        //send 7 segment code to LED segments
      
        if (digit == 1) {
            PORTB = DIG_ONE;
            PORTA = get_segment(seg_count[0]);  
        }
        else if ((digit == 2)&&(digits>1)) {
            PORTB = DIG_TWO; 
            PORTA = get_segment(seg_count[1]);  
        }
        else if ((digit == 3)&&(digits>2)) {
            PORTB = DIG_THREE; 
            PORTA = get_segment(seg_count[2]);  
        }
        else if ((digit == 4)&&(digits==4)) {
            PORTB = DIG_FOUR;
            PORTA = get_segment(seg_count[3]);
        }
        digit++;
        //update digit to display
    }//while
}//main
