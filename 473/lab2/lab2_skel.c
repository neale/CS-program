// lab2_skel.c 
// Neale Ratzlaff
// 9.12.08

//  HARDWARE SETUP:
//  PORTA is connected to the segments of the LED display. and to the pushbuttons.
//  PORTA.0 corresponds to segment a, PORTA.1 corresponds to segement b, etc.
//  PORTB bits 4-6 go to a,b,c inputs of the 74HC138.
//  PORTB bit 7 goes to the PWM transistor base.

#define F_CPU 16000000 // cpu speed in hertz 
#define TRUE 1
#define FALSE 0
#include <avr/io.h>
#include <util/delay.h>

#define LIGHTS _SFR_IO8(0x18)

#define DIG_ONE 0x00
#define DIG_TWO 0x10
#define COLON 0x20
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
#define NINE  0b10110000
#define ZERO  0b11000000

#define CLEAR(x) (x = 0x00)
#define SET(x) (x = 0xFF)

//holds data to be sent to the segments. logic zero turns segment on
uint8_t segment_data[5]; 

//decimal to 7-segment LED display encodings, logic "0" turns on segment
uint8_t dec_to_7seg[12];

int8_t debounce_switch() {
  static uint16_t state = 0; //holds present state
  state = (state << 1) | (! bit_is_clear(PIND, 0)) | 0xE000;
  if (state == 0xF000) {
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
uint8_t chk_buttons(uint8_t button) {
//******************************************************************************
    while(!button) {
        debounce_switch();
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
//***********************************************************************************
//                                   segment_sum                                    
//takes a 16-bit binary input value and places the appropriate equivalent 4 digit 
//BCD segment code in the array segment_data for display.                       
//array is loaded at exit as:  |digit3|digit2|colon|digit1|digit0|
void segsum(uint16_t sum, unsigned int *digit_array) {
  
  int digits = 0;
  //determine how many digits there are 
  while (sum != 0) {
    sum /= 10;
    digits++;
  } 
  //break up decimal sum into 4 digit-segments
  digit_array[3] = sum/1000 % 10;
  digit_array[2] = sum/100 % 10; 
  digit_array[1] = sum/10 % 10;
  digit_array[0] = sum % 10;

  //blank out leading zero digits 
  //now move data to right place for misplaced colon position
}//segment_sum
//***********************************************************************************


//***********************************************************************************
void main() {
    //int nums = 0;
    uint16_t count = 0;
    unsigned int seg_count[5] = {0};
    //set port bits 4-7 B as outputs
    DDRE = (1 << PE1);
    DDRB = 0xFF;
    PORTB = 0x00;

    CLEAR(PORTA);
    while(1){

      //insert loop delay for debounce
      _delay_ms(2);
      
      PORTE &= ~(1 << PB1);
      //PORTB &= ~(1 << PB3);
      //make PORTA an input port with pullups 
      CLEAR(DDRA);
      //enable tristate buffer for pushbutton switches
      //bound the count to 0 - 1023
      count += __builtin_popcount(PINA);
         
      if (count == 1023) {
          count = 0;
      }
      
      SET(DDRA);
      segsum(count, seg_count);
      //break up the disp_value to 4, BCD digits in the array: call (segsum)
      //bound a counter (0-4) to keep track of digit to display 
      //make PORTA an output
      //send 7 segment code to LED segments

      PORTE |= (1 << PB1);

      PORTB = DIG_FOUR;
      _delay_ms(3);
      PORTA = get_segment(seg_count[0]);
      
      PORTB = DIG_THREE; 
      _delay_ms(3);
      PORTA = get_segment(seg_count[1]);  
      
      PORTB = DIG_TWO; 
      _delay_ms(3);
      PORTA = get_segment(seg_count[2]);  
      
      PORTB = DIG_ONE; 
      _delay_ms(3);
      PORTA = get_segment(seg_count[3]);  

      //send PORTB the digit to display
      //update digit to display
    }//while
}//main
