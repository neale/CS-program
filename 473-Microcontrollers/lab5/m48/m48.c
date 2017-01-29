#include <avr/io.h>
#include <stdio.h>
#include <stdlib.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "twi_master.h"
#include "lm73_functions_skel.h"

#define F_CPU 8000000UL		//8Mhz clock
#define FOSC 8000000		// Clock Speed
#define BAUD 9600
#define SETUBRR FOSC/16/BAUD-1  //Calculate UBRR value in UART

char    lcd_string_array[16];  //holds a string to refresh the LCD
extern uint8_t lm73_wr_buf[2];
extern uint8_t lm73_rd_buf[2];

void uart_init(unsigned int ubrr){
    //Set baud rate
    UBRR0H = (unsigned char)(ubrr>>8);
    UBRR0L = (unsigned char)ubrr;
    //Enable receiver and transmitter 
    UCSR0B = (1 << RXEN0) | (1 << TXEN0);
    //Set frame format: 8data, 2stop bit
    UCSR0C = (1 << USBS0) | (1 << UCSZ01) | (1 << UCSZ00);
}
void uart_flush(void) {

    unsigned char dummy;

    while (UCSR0A & (1<<RXC0)) 
    dummy = UDR0;
}
void uart_putc( unsigned char data ){
    while (!( UCSR0A & (1 << UDRE0))) { }
    
    UDR0 = data;
}

char uart_getc(void) {
    uint16_t timer = 0;
    while (!(UCSR0A & (1<<RXC0))) {
        timer++;
        if(timer >= 16000){ return(0);}
            //return the data into a global variable
            //give uart_getc the address of the variable
            //return a -1 if no data comes back.
    } // Wait for byte to arrive
    return(UDR0); //return the received data
}
int main(void){

    uint16_t lm73_temp;  //Variable for assembled temp
    uint8_t temp;
    init_twi();        //initalize TWI
    uart_init(SETUBRR);  // Initialize USART at 9600 Baud
    //set LM73 mode for reading temp by loading pointer register
    lm73_wr_buf[0] = LM73_PTR_TEMP;
    twi_start_wr(LM73_ADDRESS,lm73_wr_buf,1);
    _delay_ms(2);
    sei();             //enable interrupts before entering loop
    while(1){          //main while loop
        if (uart_getc() == 's') {
            _delay_ms(100);  //tenth second wait
            twi_start_rd(LM73_ADDRESS, lm73_rd_buf, 2);  //read temperature data from LM73 (2 bytes)  (twi_master.h)
            _delay_ms(2);	//wait for it to finish
            lm73_temp  = lm73_rd_buf[0];    //save high temperature byte into lm73_temp
            lm73_temp  = (lm73_temp << 8);  //shift it into upper byte 
            lm73_temp |= lm73_rd_buf[1];    //"OR" in the low temp byte to lm73_temp 
            temp = lm73_temp/128;	//convert to celsius
            uart_putc(temp);
            uart_flush();
        } //if
        else {
            uart_flush();
        }
    }//while

    return 0;
}
