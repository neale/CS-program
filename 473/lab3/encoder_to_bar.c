//lab3_code
//Trevor Love
//10.25.2015
//
//************************************************************************
// Use the encoders to increment/decrement the count on the LED display
// the buttons s5, s6, s7 change 1,2,4 count modes
//************************************************************************
// Bargraph board           Mega128 board 
// --------------      ----------------------    
//     reglck            PORTB bit 0 (ss_n)                      
//     srclk             PORTB bit 1 (sclk)
//     sdin              PORTB bit 2 (mosi)
//     oe_n              PORTB bit 7 (OE_N)
//     gnd2                   ground
//     vdd2                     vcc

// Encoder Board            Mega128 board
// --------------       ---------------------
//     gnd                   ground
//     vdd                   vcc
//   sh/ld               PORTE bit 6 (OE_N)
//     sck               PORTB bit 1 (sclk)
//  chkinh               GND
//     sin               PORTB bit 2 (mosi)
//    sout               PORTB bit 3 (miso)

#include <avr/io.h>
#include <avr/interrupt.h>

void port_init(void)
{
 DDRB = 0xFF;
 DDRE = (1<<PIN1); //PORTE all outputs
}

/***********************************************************************/
//                            spi_init                               
//Initalizes the SPI port on the mega128. Does not do any further   
//external device specific initalizations.  Sets up SPI to be:                        
//master mode, clock=clk/2, cycle half phase, low polarity, MSB first
//interrupts disabled, poll SPIF bit in SPSR to check xmit completion
/***********************************************************************/
void spi_init(void){
  SPCR  |=   (1<<SPE)|(1<<MSTR)|(1<<SPR0); //set up SPI mode
  SPSR  |=   (1<<SPI2X);             // double speed operation
 }//spi_init

/***********************************************************************/
//                              tcnt0_init                             
//Initalizes timer/counter0 (TCNT0). TCNT0 is running in async mode
//with external 32khz crystal.  Runs in normal mode with no prescaling.
//Interrupt occurs at overflow 0xFF.
//
void tcnt0_init(void){
  ASSR   |=  1<<AS0;  //ext osc TOSC
  TIMSK  |=  1<<OCIE0;//enable timer/counter0 overflow interrupt
  TCCR0  |=  1<<WGM01 | 1<<CS00; //CTC mode, no prescale
  OCR0 = 32;	//timer compare register value
}

/*************************************************************************/
//                           timer/counter0 ISR                          
//When the TCNT0 overflow interrupt occurs, the count_7ms variable is    
//incremented.  Every 7680 interrupts the minutes counter is incremented.
//tcnt0 interrupts come at 7.8125ms internals.
// 1/32768         = 30.517578uS
//(1/32768)*256    = 7.8125ms
//(1/32768)*256*64 = 500mS
/*************************************************************************/
ISR(TIMER0_COMP_vect){
  static uint8_t encoder = 0;

  PORTE &= ~(1<<PIN1); //lock
  PORTE |= (1<<PIN1); //and load
  SPDR = 0xFF; //junk byte
  while(!(SPSR & (1<<SPIF))){}; //wait till data is sent out (while spin loop)
  encoder = SPDR;
  
  SPDR = encoder;
  while(!(SPSR & (1<<SPIF))){}; //wait till data is sent out (while spin loop)
  PORTB |=   0x01;          //strobe output data reg in HC165 - rising edge
  PORTB &= ~(0x01);         //falling edge
}
     
int main(){
  port_init();
  tcnt0_init();
  spi_init();
  sei();
  while(1){}
}

