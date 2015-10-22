//heartint.c
//setup TCNT1 in pwm mode, TCNT3 in normal mode 
//set OC1A (PB5) as pwm output 
//pwm frequency:  (16,000,000)/(1 * (61440 + 1)) = 260hz
//
//Timer TCNT3 is set to interrupt the processor at a rate of 30 times a second.
//When the interrupt occurs, the ISR for TCNTR3 changes the duty cycle of timer 
//TCNT1 to affect the brightness of the LED connected to pin PORTB bit 5.
//
//to download: 
//wget http://www.ece.orst.edu/~traylor/ece473/inclass_exercises/timers_and_counters/heartint_skeleton.c
//

#include <avr/io.h>
#include <avr/interrupt.h>

#define TRUE  1
#define FALSE 0

//Traverse the array up then down with control statements or double the size of
//the array and make the control easier.  Values from 0x0100 thru 0xEF00 work 
//well for setting the brightness level.

uint16_t brightness[22] = {0x100, 0x200, 0x400, 0x600, 0x900, 0xC000, 0xD000, 0xE000,
                           0xE100, 0xE500, 0xEF00, 0xEF00, 0xE500, 0xE100, 0xE000,
                           0xD000, 0xC000, 0x900, 0x600, 0x400, 0x200, 0x100};

ISR(TIMER3_OVF_vect) {
    static int i = 0;
    if (i == 21) {
        i = 0;
    }
    OCR1A = brightness[i]; 
    i++;                    
}

int main() {

  DDRB    = (1 << PB5);                            //set port B bit five to output
                                                   //setup timer counter 1 as the pwm source
  TCCR1A |= (1 << COMA1) | (1 << COMA0);           //fast pwm, set on match, clear@bottom, 
                                                   //(inverting mode) ICR1 holds TOP
  TCCR1B |= (1 << CS10) | (1 << WGM13);             //use ICR1 as source for TOP, use clk/
  TCCR1C  =  0;                                     //no forced compare 
  ICR1    = 0xF000;
//setup timer counter 3 as the interrupt source, 30 interrupts/sec
// (16,000,000)/(8 * 2^16) = 30 cycles/sec

  TCCR3A = 0;                              //normal mode

  TCCR3B = (1 << CS31);                           //use clk/8  (15hz)  

  TCCR3C = 0;                             //no forced compare 

  ETIMSK = (1 << TOIE3);                              //enable timer 3 interrupt on TOV

  sei();                                //set GIE to enable interrupts
  while(1) { } //do forever
 
}  // main
