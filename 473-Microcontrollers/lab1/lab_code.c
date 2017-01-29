// lab1_code.c 
// Neale Razlaff
// 7.21.08

//This program increments a binary display of the number of button pushes on switch 
//S0 on the mega128 board.

#include <avr/io.h>
#include <util/delay.h>

//*******************************************************************************
//                            debounce_switch                                  
// Adapted from Ganssel's "Guide to Debouncing"            
// Checks the state of pushbutton S0 It shifts in ones till the button is pushed. 
// Function returns a 1 only once per debounced button push so a debounce and toggle 
// function can be implemented at the same time.  Expects active low pushbutton on 
// Port D bit zero.  Debounce time is determined by external loop delay times 12. 
//*******************************************************************************
int8_t debounce_switch() {
  static uint16_t state = 0; //holds present state
  state = (state << 1) | (! bit_is_clear(PIND, 0)) | 0xE000;
  if (state == 0xF000) {
      return 1;
  }
  return 0;
}

int bcd(uint8_t val){
    // simple base switch
    // the first part isolates the 10s place and pads 0s
    // the %10 isolates the ones 
    return (((val/10)<<4) + (val%10));
}


//*******************************************************************************
// Check switch S0.  When found low for 12 passes of "debounc_switch(), increment
// PORTB.  This will make an incrementing count on the port B LEDS. 
//*******************************************************************************

void main() {
    
    DDRB = 0xFF;      //set port B to all outputs
    int count = 1;
    int res = 0;
    while(1){         //do forever
                
        if (debounce_switch()) {
            res = bcd(count);
            count++;
            if (count == 100) {
                count = 0;
            }
            PORTB = res;
        }             //if switch true for 12 passes, increment port B
    
        _delay_ms(2); //keep in loop to debounce 24ms
    }                 //while 

}                     //main
