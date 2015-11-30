// lab4_skel.c 
// Neale Ratzlaff
// 11.12.08

#define F_CPU 16000000 // cpu speed in hertz 

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <string.h>

#define USART_BAUDRATE 57600  
//Compute baudvalue at compile time from USART_BAUDRATE and F_CPU
#define BAUDVALUE  ((F_CPU/(USART_BAUDRATE * 16UL)) - 1 )

char uart_tx_buf[40];      //holds string to send to crt
char uart_rx_buf[40];      //holds string that recieves data from uart


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

void uart_putc(char data) {
    while (!(UCSR0A&(1<<UDRE0)));    // Wait for previous transmissions
    UDR0 = data;    // Send data byte
    while (!(UCSR0A&(1<<UDRE0)));    // Wait for previous transmissions
}
//******************************************************************

//******************************************************************
//                        uart_puts
// Takes a string and sends each charater to be sent to USART0
//void uart_puts(unsigned char *str) {
void uart_puts(char *str) {
    int i = 0;
    while(str[i] != '\0') { // Loop through string, sending each character
        uart_putc(str[i]);
        i++;
    }
}

//Initialize Timer/Counter 0
/*void init_clk() {

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
}*/
/* initialize to 125 kHz (datasheet), using VCC for reference,
 * 8 bit resolution, and then do the first conversion (init) 
 */
/*void init_adc() {

    DDRF   &= ~(1 << PF0);
    ADCSRA |=  (1 << ADPS0) | (1 << ADPS1) | (1 << ADPS2);
    ADMUX  |=  (1 << REFS0) | (1 << ADLAR);  
    ADCSRA |=  (1 << ADEN); // do the first conversion
}*/
/*
void init_spi() {
    SPCR |= (1<<SPE) | (1<<MSTR); //Enable SPI and set as master
    SPSR |= (1<<SPI2X); //Enable double SPI speed for master mode

}
*/
void uart_init(void) {

    UCSR0B |= (1 << RXEN0) | (1 << TXEN0);
    //async operation, no parity,  one stop bit, 8-bit characters
    UCSR0C |= (1<<UCSZ01) | (1<<UCSZ00);
    UBRR0H = (BAUDVALUE >>8 ); //load upper byte of the baud rate into UBRR 
    UBRR0L =  BAUDVALUE;       //load lower byte of the baud rate into UBRR 

}

int main(void) {

    /*init_spi();
    init_clk();
    init_adc();
    LCD_Init();
    sei();
    */
    DDRD |= (1 << PD1);
    uart_init();
    while(1){
        
        uart_puts("HAHAHAHA");
    }
    //cli();
    return 0;

}//main

