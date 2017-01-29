#include <avr/io.h>
#include <stdio.h>
#include <stdlib.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "twi_master.h"
#include "lm73_functions_skel.h"

#include <avr/pgmspace.h>

#define USART_BAUDRATE 9600  
#define BAUDVALUE  ((F_CPU/(USART_BAUDRATE * 16UL)) - 1 )

char    lcd_string_array[16];  //holds a string to refresh the LCD
extern uint8_t lm73_wr_buf[2];
extern uint8_t lm73_rd_buf[2];


void uart_init(){
//rx and tx enable, receive interrupt enabled, 8 bit characters
//UCSR0B |= (1<<RXEN0) | (1<<TXEN0) | (1<<RXCIE0); //INTERRUPTS ENABLED
  UCSR0B |= (1<<RXEN0) | (1<<TXEN0);               //INTERRUPS DISABLED

//async operation, no parity,  one stop bit, 8-bit characters
  UCSR0C |= (1<<UCSZ01) | (1<<UCSZ00);
  UBRR0H = (BAUDVALUE >>8 ); //load upper byte of the baud rate into UBRR 
  UBRR0L =  BAUDVALUE;       //load lower byte of the baud rate into UBRR 

}
void uart_flush(void) {

    unsigned char dummy;

    while (UCSR0A & (1<<RXC0)) 
    dummy = UDR0;
}

void uart_putc(char data) {
    while (!(UCSR0A&(1<<UDRE0)));    // Wait for previous transmissions
    UDR0 = data;    // Send data byte
    while (!(UCSR0A&(1<<UDRE0)));    // Wait for previous transmissions
}
unsigned char uart_getc(void) {
    while (!(UCSR0A & (1<<RXC0))) { }
    return(UDR0); //return the received data
}
int main(void){

    uart_init();  // Initialize USART at 9600 Baud
    uint16_t lm73_temp;  //Variable for assembled temp
    uint8_t temp;
    init_twi();        //initalize TWI
    //set LM73 mode for reading temp by loading pointer register
    lm73_wr_buf[0] = LM73_PTR_TEMP;
    twi_start_wr(LM73_ADDRESS,lm73_wr_buf,1);
    _delay_ms(2);
    sei();
    while(1){          //main while loop
        if (uart_getc() == 'a') {
            _delay_ms(100);  //tenth second wait
            twi_start_rd(LM73_ADDRESS, lm73_rd_buf, 2);  //read temperature data from LM73 (2 bytes)  (twi_master.h)
            _delay_ms(2);	//wait for it to finish
            lm73_temp  = lm73_rd_buf[0];    //save high temperature byte into lm73_temp
            lm73_temp  = (lm73_temp << 8);  //shift it into upper byte 
            lm73_temp |= lm73_rd_buf[1];    //"OR" in the low temp byte to lm73_temp 
            temp = lm73_temp/128;	//convert to celsius
            uart_putc(temp);
            _delay_ms(2);
        }
    }//while

    return 0;
}
