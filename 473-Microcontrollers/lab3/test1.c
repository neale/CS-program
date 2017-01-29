// lab2_skel.c 
// R. Traylor
// 9.12.08
//
// Edited by Aniket Borkar
// 10.09.15
// Added remaining code to complete functionality

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
#include <avr/interrupt.h>

enum encoder_direction {REST, DECREMENT, INCREMENT};
typedef enum encoder_direction direction;

//holds data to be sent to the segments. logic zero turns segment on
uint8_t segment_data[5]; 

//decimal to 7-segment LED display encodings, logic "0" turns on segment
uint8_t dec_to_7seg[12];

//Debounce code. Changed it to check for 8 different button presses on all PORTA pins.
int8_t debounce_switch(uint8_t number) {
    switch(number) {
        static uint16_t state[8] = {0,0,0,0,0,0,0,0};
        case 0:
            state[number] = (state[number] << 1) | (! bit_is_clear(PINA, number)) | 0xE000;
            if (state[number] == 0xF000) return 1;
            return 0;
        case 1:
            state[number] = (state[number] << 1) | (! bit_is_clear(PINA, number)) | 0xE000;
            if (state[number] == 0xF000) return 1;
            return 0;
        case 2:
            state[number] = (state[number] << 1) | (! bit_is_clear(PINA, number)) | 0xE000;
            if (state[number] == 0xF000) return 1;
            return 0;
        case 3:
            state[number] = (state[number] << 1) | (! bit_is_clear(PINA, number)) | 0xE000;
            if (state[number] == 0xF000) return 1;
            return 0;
        case 4:
            state[number] = (state[number] << 1) | (! bit_is_clear(PINA, number)) | 0xE000;
            if (state[number] == 0xF000) return 1;
            return 0;
        case 5:
            state[number] = (state[number] << 1) | (! bit_is_clear(PINA, number)) | 0xE000;
            if (state[number] == 0xF000) return 1;
            return 0;
        case 6:
            state[number] = (state[number] << 1) | (! bit_is_clear(PINA, number)) | 0xE000;
            if (state[number] == 0xF000) return 1;
            return 0;
        case 7:
            state[number] = (state[number] << 1) | (! bit_is_clear(PINA, number)) | 0xE000;
            if (state[number] == 0xF000) return 1;
            return 0;
        default:
            return 0;
    }
}

//Mappings for decimal to 7 seg decoder.
uint8_t dec_to_seg(uint8_t digit) {
   // uint8_t digit = count % 10;
    switch(digit) {
        case 0:
            return 0b11000000;
        case 1:
            return 0b11111001;
        case 2:
            return 0b10100100;
        case 3:
            return 0b10110000;
        case 4:
            return 0b10011001;
        case 5:
            return 0b10010010;
        case 6:
            return 0b10000010;
        case 7:
            return 0b11111000;
        case 8:
            return 0b10000000;
        case 9:
            return 0b10010000;
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
//******************************************************************************

//***********************************************************************************
//                                   segment_sum                                    
//takes a 16-bit binary input value and places the appropriate equivalent 4 digit 
//BCD segment code in the array segment_data for display.                       
//array is loaded at exit as:  |digit3|digit2|colon|digit1|digit0|
uint8_t segsum(uint16_t sum) {
  //determine how many digits there are
    uint8_t units = 0x00;
    uint8_t tens = 0x00;
    uint8_t hundreds = 0x00;
    uint8_t thousands = 0x00;
    uint8_t digits;

    if (sum < 10) { //one digit
        units = sum;
        digits = 1;
    } else if (sum >= 10 && sum < 100) { //two digits
        units = sum % 10;
        tens = sum / 10 % 10;
        digits = 2;
    } else if (sum >= 100 && sum < 1000) { //three digits
        units = sum % 10;
        tens = sum / 10 % 10;
        hundreds = sum / 100 % 10;
        digits = 3;
    } else { //four digits
        units = sum % 10;
        tens = sum / 10 % 10;
        hundreds = sum / 100 % 10;
        thousands = sum / 1000 % 10;
        digits = 4;
    }

  //break up decimal sum into 4 digit-segments
  //blank out leading zero digits 
  //now move data to right place for misplaced colon position
    segment_data[0] = dec_to_seg(thousands);
    segment_data[1] = dec_to_seg(hundreds);
    segment_data[3] = dec_to_seg(tens);
    segment_data[4] = dec_to_seg(units);
    return digits;
}//segment_sum
//***********************************************************************************


//***********************************************************************************
//


//Initialize Timer/Counter 0
void init_timer0() {
    ASSR |= (1<<AS0); //use ext oscillator
    TCCR0 |= (1<<CS00) | (1<<WGM01); //start clock no prescale with CTC mode
    TIMSK |= (1<<OCIE0); //enable output compare match interrupt
    OCR0 = 0x3F;
}

void init_spi() {
    SPCR |= (1<<SPE) | (1<<MSTR); //Enable SPI and set as master
    SPSR |= (1<<SPI2X); //Enable double SPI speed for master mode

}

ISR(TIMER0_COMP_vect) {
    //set port bits 4-7 B as outputs
    DDRB = 0xF7;
    //set PORTA output for display
    DDRA = 0xFF;
    //Set SS high
    PORTB |= (1<<0);
    //variable to hold state of cycling digits
    static uint8_t digit_counter = 0;
    //number of digits in count
    static uint8_t digits = 0;
    //number count to be displayed
    static uint16_t count = 0;
    //states for bar graph
    static uint8_t button_one = FALSE;
    static uint8_t button_two = FALSE;
    //Amount to change count by
    static uint8_t count_delta = 1;
    //encoder reading
    static uint8_t encoder_reading = 0b00000000;
    //Encoder One States
    static uint8_t encoder_one_A = TRUE; //true by default since active low
    static uint8_t encoder_one_A_old = FALSE;
    static uint8_t encoder_one_B = TRUE;
    static uint8_t encoder_one_already_changed = TRUE;
    //Encoder Two States
    static uint8_t encoder_two_A = TRUE; //true by default since active low
    static uint8_t encoder_two_A_old = FALSE;
    static uint8_t encoder_two_B = TRUE;
    static uint8_t encoder_two_already_changed = TRUE;
    //Direction
    static direction d1 = REST;
    static direction d2 = REST;
    
    //if past the fourth digit, go back to the first
    if (digit_counter > 4) digit_counter = 0;
    //make PORTA an input port with pullups
    DDRA = 0x00; //INPUT
    PORTA = 0xFF; //PULLUP
    PORTB |= 0x70; //TRISTATE
    
    //enable tristate buffer for pushbutton switches
    //DDRB = 0x70;
    //now check each button and increment the count as neededi
    int i = 0;
    for (i = 0; i < 8; i++) {
         if (debounce_switch(i)) {
            if (i == 0) {
                button_one = !button_one;
            }
            if (i == 1) {
                button_two = !button_two;
            }
         }
    } 
     
    //disable tristate buffer for pushbutton switches
    PORTB = 0x00;
      //break up the disp_value to 4, BCD digits in the array: call (segsum)
    digits = segsum(count);
      //make PORTA an output
    DDRA = 0xFF;
    
    
    
    //Send Data to SPDR for Bar Graph Setting
    if (button_one && button_two) {
        //both buttons toggled - no increment
        count_delta = 0;
        //Send output to SPDR
        SPDR = 0b00000000;
        while (bit_is_clear(SPSR,SPIF)){} //wait till 8 clock cycles are done
        PORTB |= (1<<0); //enable bar graph
       }
       else if (button_one && !button_two) {
           //button one toggled - 2 increment
           count_delta = 2;
           SPDR = 0b00000011;
        while (bit_is_clear(SPSR,SPIF)){} //wait till 8 clock cycles are done
        PORTB |= (1<<0); //enable bar graph
       } 
       else if (!button_one && button_two) {
           //button two toggled - 4 increment
           count_delta = 4;
           SPDR = 0b00001111;
        while (bit_is_clear(SPSR,SPIF)){} //wait till 8 clock cycles are done
        PORTB |= (1<<0); //enable bar graph
       }
       else if (!button_one && !button_two) {
           //both buttons untoggled - 1 increment
           count_delta = 1;
           SPDR = 0b00000001;
        while (bit_is_clear(SPSR,SPIF)){} //wait till 8 clock cycles are done
        PORTB |= (1<<0); //enable bar graph
    }

       //Read Encoders Now
       //First Unselect Bar Graph
       PORTB &= ~(1<<0);
       //Select Encoder
       DDRE = 0xFF;
       PORTE |= (1<<6);
       //Send Junk Byte
       SPDR = 0xFF;
       //Spin
       while (bit_is_clear(SPSR, SPIF)){}
       //Get readings
    encoder_reading = SPDR;
       //Unselect Encoder
       PORTE &= ~(1<<PIN6);
       
       //Encoder Logic
       if (encoder_reading & (1<<0)) {
           encoder_one_A = TRUE;
       } else {
           encoder_one_A = FALSE;
           encoder_one_already_changed = FALSE;
       }
       if (encoder_reading & (1<<1)) {
           encoder_one_B = TRUE;
       } else {
           encoder_one_B = FALSE;
           encoder_one_already_changed = FALSE;
       }
       if (encoder_reading & (1<<2)) {
           encoder_two_A = TRUE;
       } else {
           encoder_two_A = FALSE;
           encoder_two_already_changed = FALSE;
       }
       if (encoder_reading & (1<<3)) {
           encoder_two_B = TRUE;
       } else {
           encoder_two_B = FALSE;
           encoder_two_already_changed = FALSE;
       }
       
       if ((encoder_one_A_old == FALSE) && (encoder_one_A == TRUE)) {
           if (encoder_one_B == FALSE) {
               d1 = INCREMENT;
           } else {
               d1 = DECREMENT;
           }
       }
       if ((encoder_two_A_old == FALSE) && (encoder_two_A == TRUE)) {
           if (encoder_two_B == FALSE) {
               d2 = INCREMENT;
           } else {
               d2 = DECREMENT;
           }
       }
       encoder_one_A_old = encoder_one_A;
       encoder_two_A_old = encoder_two_A;
       
       if (encoder_one_A && encoder_one_B) {
           if (!encoder_one_already_changed) {
               if (d1 == DECREMENT) {
                   if (count < count_delta) { //rollover below zero to 1023
                       count = 1023;
                   } else {
                       count -= count_delta;
                   }
               } else {
                   
                   count += count_delta;
                   //account for overflow
                if (count > 1023) {
                    count = count - 1023;
                }
               }
               encoder_one_already_changed = TRUE;
           }
       }
       if (encoder_two_A && encoder_two_B) {
           if (!encoder_two_already_changed) {
               if (d2 == DECREMENT) {
                   if (count < count_delta) { //rollover below zero to 1023
                       count = 1023;
                   } else {
                       count -= count_delta;
                   }
               } else {
                   
                   count += count_delta;
                   //account for overflow
                if (count > 1023) {
                    count = count - 1023;
                }
               }
               encoder_two_already_changed = TRUE;
           }
       }    
    
    //send 7 segment code to LED segments
      //send PORTB the digit to display
    if (digit_counter == 0) {
        PORTB = 0x00;
        PORTA = segment_data[4];
    } else if (digit_counter == 1) {
        PORTB = 0x10;
        if (digits > 1) PORTA = segment_data[3];
    } else if (digit_counter == 2) {
        PORTB = 0x20;
        //blank out the colon
        PORTA = 0xFF;
    } else if (digit_counter == 3) {
        PORTB = 0x30;
        if (digits > 2) PORTA = segment_data[1];
    } else if (digit_counter == 4) {
        PORTB = 0x40;
        if (digits > 3) PORTA = segment_data[0];
    }
      //update digit to display
    digit_counter++;
}

uint8_t main() {

    //Set PortB bits 4-7 to output and also SPI bits
    DDRB = 0xF7;
    //Set clk, mosi, and ss high
    PORTB = 0x07; 
    //Set PortA as input
    DDRA = 0x00;
    //Enable pullups
    PORTA = 0xFF; 
    
    //Start SPI
    init_spi();
    //Start Timer/Counter 0
    init_timer0();
    sei();
    while(1){}
return 0;
}//main
