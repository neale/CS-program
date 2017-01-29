//lab4 Alarm ClocK
//T.Love
//11.5.15


//************************************************************************
// Use the encoders to increment/decrement the count on the LED display
// the buttons s1, s2, s3 change 1,2,4 count modes
//************************************************************************
// Bargraph board           Mega128 board 
// --------------      ----------------------    
//     reglck            PORTD bit 2 (ss_n)                      
//     srclk             PORTB bit 1 (sclk)
//     sdin              PORTB bit 2 (mosi)
//     oe_n              PORTB bit 7 (OE_N)
//     gnd2                   ground
//     vdd2                     vcc

// Encoder Board            Mega128 board
// --------------       ---------------------
//     gnd                   ground
//     vdd                   vcc
//   sh/ld               PORTE bit 6 (OE_I)
//     sck               PORTB bit 1 (sclk)
//  chkinh               GND         
//     sin               PORTB bit 2 (mosi)
//    sout               PORTB bit 3 (miso)

// LED 7-Seg Board      
// Port A:  
//          bit0 brown  segment A button 1
//          bit1 red    segment B        2
//          bit2 orange segment C        3
//          bit3 yellow segment D        4
//          bit4 green  segment E        5
//          bit5 blue   segment F        6
//          bit6 purple segment G        7
//          bit7 grey   decimal point    8
//               black  Vdd
//               white  Vss
// Port D:            
//          bit0 green  SCLK
//          bit1 blue   SDATA (TWI)         
//          bit4 green  seg0
//          bit5 blue   seg1
//          bit6 purple seg2
//          bit7 grey   pwm 
//               black  Vdd
//               white  Vss

// Audio Amplifier           Mega128 board
// --------------       ---------------------
//     gnd                   ground
//     vdd                   vcc
//   RIN                     PORTD7
//   vol                     PORTE3
//
// PORTE: 
//
//          bit0 blue  RX   
//          bit1 green TX
//          bit2 grey  RESET
//          bit3 blue  volume
//          bit4 grey  encoder
//          bit7 purple STC
//
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdlib.h>
#include <util/delay.h>
#include <stdio.h>
#include <string.h>
#include "lm73_functions_skel.h"
#include "twi_master.h"
#include "LCDDriver.h"
#include "uart_functions.h"
#include "./si4734_driver-master/si4734.h"

//display flag tags
#define ALARM  1
#define SNOOZE 2
#define TEMP 3
#define RADIO 4
#define VOLUME 5

//Data Structures
typedef struct Dig{
 uint8_t digit; //0,1,3,4 digit identifier, skips colon
 uint8_t display; //value to 7seg, low make blinky blinky 
} Dig ; //Dig em

typedef struct Clock_alarm{
 uint8_t hours;
 uint8_t minutes;
 uint8_t seconds;
 uint8_t mode;
} Clock_alarm ; //the clock and alarm structure

Dig em[4];//four global digs
Clock_alarm clk, alm1, alm2; //clock and alarms
div_t o, t, h, d; //four global division structs 

static uint8_t snooze, triggered, alarm_flag, radio_flag; //snooze, trigger indicator

//set up radio
uint16_t current_fm_freq =  8810; //0x2706, arg2, arg3; 99.9Mhz, 200khz steps
uint16_t current_sw_freq;
uint16_t current_am_freq;
volatile static uint8_t  radio_press, radio_on = 0; //my radio togglers
volatile uint8_t STC_interrupt;     //indicates tune or seek is done

//from Roger's si4737 
extern uint8_t  si4734_wr_buf[9];
extern uint8_t  si4734_rd_buf[9];
extern uint8_t  si4734_tune_status_buf[8];

//set ports
void port_init(void){
 DDRA = 0xFF;//PORTA all outputs
 DDRB = 0xFF;//PORTB all outputs
 DDRD = 0xFF;//PORTD all outputs
 DDRE = 0xFF;//PORTE all outputs
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

void tcnt_init(void){
//set up TCNT0 in CTC mode hit on 1s 
//32khz count 32 takes 1ms
 /* ASSR   |=  1<<AS0;  //ext osc TOSC
  TIMSK  |=  1<<OCIE0;//enable timer/counter0 overflow interrupt
  TCCR0  |=  (1<<WGM01)| (1<<CS01) | (1<<CS00); // | (1<<CS01) ; //CTC mode, no prescale
  OCR0 = 32;	//timer compare register value */
    ASSR   |=  (1<<AS0);    //ext osc TOSC
    TIMSK  |=  (1<<TOIE0);  //enable timer/counter0 overflow interrupt
    TCCR0  |=  (0<<WGM01) | (0<<WGM00) | (0<<COM00) | (0<<COM01) | (0<<CS02) | (0<<CS01) | (1<<CS00);//normal mode, no prescale
//set up TCNT1 in pwm
  TCCR1A |= (1<<WGM11) | (1<<WGM10); //set to mode 15, use OCR1A 
  TCCR1B |= (1<<WGM12) | (1<<WGM13) | (1<<CS10);
//  TCCR1B |= (1<<WGM12)|(1<<CS11)|(1<<CS10);  //CTC, OCR1A = top, clk/64 (250kHz)
  TIMSK |= (1<<OCIE1A); //enable output compare interrupt
  OCR1A = 1000;

//set up TCNT2 in inverting Fast PWM mode
  TCCR2 |= (1<<WGM21) | (1<<WGM20) | (1<<COM21) | (1<<COM20) | (1<<CS21) ;
 // TIMSK |= (1<<TOIE2);
  OCR2 = 255;
//set up TCNT3 in Fast PWM mode
  TCCR3A |= (1<<COM3A1)| (1<<WGM31);// | (1<<WGM30); //enable OC3 on PE.3, set to mode 15 
  TCCR3B |= (1<<WGM32) | (1<<WGM33) | (1<<CS30);
  OCR3A = 0x0000;
  ICR3 = 0x1500;
//turn on int 7
  EICRB |= (1<<ISC70);
  ETIMSK |= (1<<INT7);
}
void adc_init(void){
  ADCSRA  |= (1<< ADEN) | (1<< ADPS2) | (1<< ADPS1) | (1<< ADPS0);  //adc enabled, prescaled 
  ADMUX |= (1<< ADLAR) | (1<<REFS0);//left justify, use 5v reference
}

//read encoders
uint8_t check_encoder(void);
//read buttons
uint8_t get_state(void);
//dec_2_7seg
uint8_t disp_ret(uint8_t div_val);
//display div
void breakdown(int value);
//clock function
void keep_time(void);
//LED display function;
void display_time(uint8_t i);
void display_volume(uint8_t i);
void display_channel(uint8_t i);
//clock setter
void clock_setter(uint8_t state, int inc_dec);
//clock getter, setter helper
Clock_alarm clock_getter(Clock_alarm temp, int inc_dec);
//manual brightness
uint8_t new_bright(uint8_t bright, int inc_dec);
//alarm check
void check_alarm1(void);
void check_alarm2(void);
//go alarm
void sound_the_alarm(void);
//volume control
void adjust_volume(int inc_dec);
//updates light sensistive display
void photo_adc_display(void);
//updates display with temperature data
void temp_thing(void);
//radio
void turn_on_radio(void);
void display_radio(void);
void adjust_freq(int inc_dec);

/*************************************************************************/
//                           timer/counter0 ISR                          
//When the TCNT0 overflow interrupt occurs, ISR checks buttons, sets bar 
//graph, checks encoders, sets value, and lights LED's with individual digits 
//contained in a Dig struct
/*************************************************************************/
ISR(TIMER0_OVF_vect){
  static uint8_t new_en, old_en, i, alm1_press, alm2_press, alm1_set, alm2_set, radio_alarm_press;
  uint8_t left_nen, left_oen, right_nen, right_oen; //parsed 2bit encoder states 
  uint8_t LED; //LED display state machine
  static int count; // 1sec timer
  int inc_dec; //general increment/decrement value
//Button States
//set clk 0, set alm 1, set alm 2, set sound 3, set snooze 4, nothing 5, radio on/off 6, radio tune 7, volume 8 
  static uint8_t state; 

  photo_adc_display(); //set brightness
  
  count++; //clock count
  
  d = div(count, 128);
  if(d.rem == 0){
   keep_time();
   count = 0;
   if(alm1_set){check_alarm1();} 
   if(alm2_set){check_alarm2();}
  }//update count

  PORTA = 0xFF;
  DDRA = 0x00;//PORTA all inputs
  _delay_ms(1);//fixes false trip bug 1ms delay
  PORTB = 7<<4; //turn on buttons
  state = get_state();//get state, check buttons, set bargraph
  DDRA = 0xFF;//PORTA all outputs

 if (state > 0){
   
  //encoder handling
  new_en = check_encoder();//check encoder value
  left_nen = new_en & 0x03; left_oen = old_en & 0x03; //bits 0, 1
  right_nen= new_en & 0x0C; right_oen= old_en & 0x0C; //bits 2, 3
  inc_dec = 0;
  
  if(left_oen  == 0x03){if(left_nen  == 0x02){inc_dec = 100;}}//turned right 
  if(right_oen == 0x0C){if(right_nen == 0x08){inc_dec = 1;}}
  if(left_oen  == 0x03){if(left_nen  == 0x01){inc_dec = -100;}}//turned left 
  if(right_oen == 0x0C){if(right_nen == 0x04){inc_dec = -1;}}//could change this 
  old_en = new_en;//next state
  
  //button state machine
  switch(state){
   case 0x01:{clock_setter(state, inc_dec); break;}  //clock set
   case 0x02:{clock_setter(state, inc_dec); radio_alarm_press = 1; alm1_press =1; break;} //alarm 1 set/toggle
   case 0x04:{clock_setter(state, inc_dec); radio_alarm_press = 1; alm2_press =1; break;} //alarm 2 set/toggle
   case 0x08:{OCR3A = 0; snooze = 1; break;} //snooze LED = SNOOZE;
   case 0x20:{radio_press = 1; LED = RADIO; break;}
   case 0x40:{adjust_freq(inc_dec); LED = RADIO; break;} //radio adjust
   case 0x80:{adjust_volume(inc_dec); LED = VOLUME; break;} //volume adjust break;}
  }//switch

  
 }//if: set states

 else{ //arm alarms, regular clock function
  //acts on button presses from state change
  if(alm1_press){//if pressed toggle settings: LED ind. turns off
                 //alarm is off triggered, and snooze is reset
   if(alm1_set){alm1_set = 0; OCR3A = 0; triggered = 0; snooze = 0;}//music_off(); triggered = 0;}
   else{alm1_set = 1;} //alm1 is set, conditional to state, alarm could be running 
   alm1_press = 0; //toggle press
  }
  if(alm2_press){ //same functionality
   if(alm2_set){alm2_set = 0; OCR3A = 0; triggered = 0; snooze = 0;}//music_off(); }
   else{alm2_set = 1;}
   alm2_press = 0;
  }
  if(radio_press){ //same functionality
   if(radio_on){radio_on = 0; OCR3A = 0;}
   else{radio_on = 1;}
   radio_press = 0;
  }
  if(radio_alarm_press){
   if(alarm_flag == 1){alarm_flag = 0; radio_flag = 1;}
   else{alarm_flag = 1; radio_flag = 0;}
   radio_alarm_press = 0;
  }//schmitty

  //do the clock thing
  if(count < 64){
   //blinks for half a second
   if(alm1_set || alm2_set){
    PORTA = 0x00; // colon and high dot pins
    PORTB = 2<<4;   _delay_ms(1);}//colon  on 
   else{
    PORTA = 1<<2; // just colon
    PORTB = 2<<4; _delay_ms(1); }//colon  on 
  } 

  breakdown((clk.hours * 100) + clk.minutes); //load em with time
//  LED = CLOCK;
 }//regular display 

 if(radio_on){
  for(i=0;i<4; i++)
   display_channel(i);
 }
 else{
   for(i=0;i<4;i++)
    display_time(i); 
 }   
 
 /*switch(LED){

  case RADIO:{ 
   for(i=0;i<2; i++)
    display_channel(i);
   break;
  }
  case VOLUME:{
   for(i=0;i<2;i++)
    display_volume(i); 
   break;
  }
  default:{
   for(i=0;i<3;i++)
    display_time(i); 
   break;
  }
 }//switch LED */
}//ISR 0 
 
/*********************************************************************/
/*                             TIMER1_COMPA                          */
/*Oscillates pin7, PORTD for alarm tone output                       */
/*********************************************************************/
ISR(TIMER1_COMPA_vect){
   PORTD ^= 0x80;  //flips the bit, creating a tone
}

//******************************************************************************
//                          External Interrupt 7 ISR
// Handles the interrupts from the radio that tells us when a command is done.
// The interrupt can come from either a "clear to send" (CTS) following most
// commands or a "seek tune complete" interrupt (STC) when a scan or tune command
// like fm_tune_freq is issued. The GPIO2/INT pin on the Si4734 emits a low
// pulse to indicate the interrupt. I have measured but the datasheet does not
// confirm a width of 3uS for CTS and 1.5uS for STC interrupts.
//
// I am presently using the Si4734 so that its only interrupting when the
// scan_tune_complete is pulsing. Seems to work fine. (12.2014)
//
// External interrupt 7 is on Port E bit 7. The interrupt is triggered on the
// rising edge of Port E bit 7.  The i/o clock must be running to detect the
// edge (not asynchronouslly triggered)
//******************************************************************************
ISR(INT7_vect){STC_interrupt = TRUE;}
//******************************************************************************

int main(){

static uint8_t LCD, radio;
//initialization
  port_init();
  tcnt_init();
  adc_init();
  spi_init();
  init_twi();   
  LCD_Init(); 
  uart_init();

//init em       
em[0].digit = 0;
em[1].digit = 1;
em[2].digit = 3;
em[3].digit = 4;//skips colon
   
//set clocks
clk.hours = 0;
clk.minutes = 0; 
clk.seconds = 0;
clk.mode = 24;

//set alarms
alm1.hours = 0;
alm1.minutes = 0; 
alm1.seconds = 0;
alm1.mode = 24;

alm2.hours = 0;
alm2.minutes = 0; 
alm2.seconds = 0;
alm2.mode = 24;


  sei(); //enable interrupts

  while(1){ //LCD_Display, Temperature and Radio handling
   if((radio == 0) && (radio_on == 1)){turn_on_radio();}
   if((radio == 1) && (radio_on == 0)){radio_pwr_dwn();}
   radio = radio_on; //state variable maintained in the ISR and main

   if((triggered != 1) && (snooze != 1) && (radio != 1)){
     LCD = TEMP;
   } 
   if(radio == 1){
     LCD = RADIO;
   }
   if((triggered == 1) && (snooze != 1)){
     LCD = ALARM;
   }
   if(snooze ==1){
     LCD = SNOOZE;
   }//if ladder determines presidence, least to greatest 
   
   switch(LCD){ //LCD display options
    case ALARM:
    { LCD_Clr();
      LCD_PutStr("ALARM!");
      _delay_ms(50);
      break;
    }
    case SNOOZE:
    {
     LCD_Clr();
     LCD_PutStr("SNOOZE");//snooze if pressed while triggered  
     _delay_ms(50);
     break;
    }
    case TEMP:
    {
     temp_thing(); //display temperatures received over TWI and UART
     break;
    }
    case RADIO:
    {
     display_radio();
     break;
    }	
   }//switch
  }//while
}

//ISR HELPERS

//dig em out
void display_time(uint8_t i){
  PORTA = em[i].display; //set display pins
  PORTB = em[i].digit<<4;//turn on display digit
  _delay_ms(1);
  PORTA = 0xFF; //and off
}

void display_channel(uint8_t i){
  if(i!=1){PORTA = em[i].display;} //set display pins
  else{PORTA = (em[i].display & 0x7F);} //set decimal
  PORTB = em[i].digit<<4;//turn on display digit
  _delay_ms(1);
  PORTA = 0xFF; //and off
}

void display_volume(uint8_t i){
  PORTA = em[i].display; //set display pins
  PORTB = em[i].digit<<4;//turn on display digit
  _delay_ms(2);
  PORTA = 0xFF; //and off
}

void photo_adc_display(void){
//pulse LED display according to ADC reading on photoresistor reading  
 ADCSRA |= 1<<ADSC;
 while (bit_is_clear(ADCSRA, ADIF)){} //compute time allows LED to display
 OCR2 = ADCH; 
}

//rolls up clocks 
void keep_time(void){ 
 clk.seconds++;
 if(clk.seconds > 59){clk.minutes++; clk.seconds = 0;}
 if(clk.minutes > 59){clk.hours++; clk.minutes = 0;}
 if(clk.hours > 24){clk.hours = 0;} //resets and stuff
}

//for encoder handling
void clock_setter(uint8_t state, int inc_dec){

 if(state == 1){ //clock set
  clk = clock_getter(clk, inc_dec);//get new clock
  breakdown(clk.hours*100 + clk.minutes); //load em with clock
 }

 if(state == 2){ //alarm 1 set
  alm1 = clock_getter(alm1, inc_dec);
  breakdown(alm1.hours*100 + alm1.minutes);
 }

 if(state == 4){ //alarm 2 set
  alm2 = clock_getter(alm2, inc_dec);
  breakdown(alm2.hours*100 + alm2.minutes);
 }  
}//rolls up

  /* better snooze   alm.minutes+=9
                     if(alm.minutes > 60){alm.hour++;}
                     if(alm.hour>alm.mode){alm.hour = 0;}//rollover} //set snooze */

//makes change to clock or alarm
Clock_alarm clock_getter(Clock_alarm temp, int inc_dec){
 //only considers 24 hour mode
 if(inc_dec == 100){
   if(temp.hours<23){temp.hours += 1;}
   else{ temp.hours = 0; }
 }
 if(inc_dec == -100){

   if(temp.hours > 0){temp.hours -= 1;}
   else{temp.hours = 23;}
 }
 if(inc_dec == 1){
   if(temp.minutes<59){temp.minutes += 1;}
   else{temp.minutes = 0;}
 }
 if(inc_dec == -1){
   if(temp.minutes > 0){temp.minutes -= 1;}
   else{temp.minutes = 59;}
 }
 return temp;
}

void adjust_volume(int inc_dec){
  static int cur = 0; //load ICR3 to cur
  //cur += inc_dec; //make change
  if(inc_dec<0){inc_dec = -0x0100;} //even out inc_dec
  if(inc_dec>0){inc_dec = 0x0100;}

  //check change, if okay change ICR3
  if(ICR3 < 0x0500){OCR3A = 0x0000; cur = 0;} //drop OCR3 to mute, real quick
  else if(ICR3 > 0x1500){OCR3A = 0x1500; cur = 10;}  //restore midline OCR3
  else{
 // if((cur <= 0x1500) && (cur > 0x0500)){ //volume range allows pwm signals between 
   ICR3 += inc_dec;
   cur = (int)(ICR3>>8)/16;
  }
  
 // else{cur = ICR3;} //or don't change
  breakdown(cur); //load em with result 
}

void adjust_freq(int inc_dec){
  int cur; 
  cur = current_fm_freq;
//the old switch statement just doesn't work
 if(inc_dec == 100){
   if(cur < 10690){cur+=100; }
   else{cur = 10790;}
 }
 if(inc_dec == -100){

   if(cur > 8910){cur-=100;}
   else{cur = 8810;}
 }
 if(inc_dec == 1){
   if(cur < 10770){cur+=20;}
   else{cur = 10790;}
 }
 if(inc_dec == -1){
   if(cur > 8830){cur -= 20;}
   else{cur = 8810;}
 }

  current_fm_freq = (uint16_t)(cur & 0xFFFF); 
  breakdown(cur/10);
}

void breakdown(int value){ 
  //do some optimized division
   o = div(value,   10); //ones fallout
   t = div(value,  100); //tens
   h = div(value, 1000); //hundeds and thousands
   
   //1's display
   em[0].display = disp_ret(o.rem);
   //10's  more division, isolate bcd's
   d = div(t.rem, 10); em[1].display = disp_ret(d.quot);
   //100's
 //  if(value > 99){
   d = div(h.rem, 100); em[2].display = disp_ret(d.quot);//}
   //else{ em[2].display = 0xFF; }//off
   //1000's
   if(value > 999){
   em[3].display = disp_ret(h.quot);}
   else{ em[3].display = 0xFF; }//off
}     

uint8_t disp_ret(uint8_t div_val){//return display value
 switch(div_val){         //grounded pins make blinky blinky
  case 0: //dgfedcba
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
  default: //never happens, light em up
   return 0x00;
 }//switch
}//disp_ret

uint8_t check_encoder(void){
  PORTE &= ~(1<<PIN4); //lock
  PORTE |= (1<<PIN4); //and load on rising edge
  SPDR = 0xFF; //junk byte
  while(!(SPSR & (1<<SPIF))){}; //wait till data is sent out (while spin loop)
  return SPDR; //up up and away
}

uint8_t get_state(void){
 static uint16_t s[8]; 
 static uint8_t  b = 0; //first 3 bits represent buttons 1,2,3 state 
 uint8_t i;

 asm volatile ("nop");//wait for latch 
 asm volatile ("nop");
 asm volatile ("nop");
 //debounce like Gansell 
for(i=0; i<8;i++){
 s[i] = ((s[i] << 1) | bit_is_clear(PINA, i) | 0xE000);
 if(s[i] == 0xF000){//track button state    
   if(b == 1<<i){b=0;} //turn off
   else{b = 1<<i;}//turn on
 }
}

 //see button state on bar graph
 SPDR = b;
 while(!(SPSR & (1<<SPIF))){}; //wait till data is sent out (while spin loop)
 PORTD |= 0x40;          //strobe output data reg in HC165 - rising edge
 PORTD &= 0xBF;         //falling edge

 return b; //return state
} 

void check_alarm1(void){
 static uint8_t count_snooze;

 if((alm1.hours == clk.hours) && (alm1.minutes == clk.minutes)){
  if(snooze == 1){count_snooze++;} //snoozin?
  else{if(triggered != 1){sound_the_alarm();}} //wake up!
  triggered = 1; // call it for the minute
  if(count_snooze > 20){ //or call on a snooze
   snooze = 0; //disarm snooze
   count_snooze = 0; //restart count
   sound_the_alarm(); //wake up!
  }
 } //alarm1
}//check

void check_alarm2(void){
 static uint8_t count_snooze;

 if((alm2.hours == clk.hours) && (alm2.minutes == clk.minutes)){
  if(snooze == 1){count_snooze++;} //snoozin?
  else{if(triggered != 1){sound_the_alarm();}} //wake up!
  triggered = 1; // call it for the minute
  if(count_snooze > 20){ //or call on a snooze
   snooze = 0; //disarm snooze
   count_snooze = 0; //restart count
   sound_the_alarm(); //wake up!
  }
 } //alarm2
}//check

void sound_the_alarm(void){
   if(alarm_flag){OCR3A = 0x1000;}
   else{turn_on_radio();}
}

void temp_thing(void){

  //delclare the 2 byte TWI read and write buffers (lm73_functions_skel.h)
  uint8_t lm73_wr_buf[2]; //keep this internal, only write a little
  uint8_t lm73_rd_buf[2];
  uint16_t lm73_temp;  //a place to assemble the temperature from the lm73

  //thermo stuff
  char    p1_loc[16];  //holds a string to build temp
  char    p2_loc[16];  //holds a string to build temp
  char    loc_temp[16];  //holds a string to refresh the LCD
  int8_t  temp_loc[2];
  char    p1[16];  //holds a string to build remote temp
  char    p2[16];  //holds a string to refresh the LCD
  char    rem_temp[16];  //holds a string to refresh the LCD
  static int8_t temp[2];
  int8_t get_it[2];
//set LM73 mode for reading temperature by loading pointer register
//this is done outside of the normal interrupt mode of operation 
  lm73_wr_buf[0] = 0x00;   //load lm73_wr_buf[0] with temperature pointer address
  lm73_wr_buf[1] = 0xE0; //disables smb bus timeout and sets 14-bit resolution

  twi_start_wr(LM73_ADDRESS, lm73_wr_buf, 2); //start the TWI write process (twi_start_wr())
  _delay_ms(2);      //wait for the xfer to finish
  twi_start_rd(LM73_ADDRESS, lm73_rd_buf, 2); //read temp
  _delay_ms(2);    //wait for it to finish
  
   //bring in mega48 data
  get_it[0] = uart_getc();
  get_it[1] = uart_getc(); //just a little error checking maybe they came in backwards
  if((get_it[0] != temp[0]) && (get_it[0] != temp[1])){temp[0] = get_it[0];}
  if((get_it[1] != temp[0]) && (get_it[1] != temp[1])){temp[1] = get_it[1];}

  cli(); //no interrupts please

//now assemble the two bytes read back into one 16-bit value
  lm73_temp =  lm73_rd_buf[0]<<8;//save high temperature byte into lm73_tem //shift it into upper byte 
  lm73_temp |= lm73_rd_buf[1]; //"OR" in the low temp byte to lm73_temp 
//convert to string in array with itoa() from avr-libc 0 Farhanheit 1 Celcius
  lm73_temp_convert(lm73_wr_buf, lm73_temp, temp_loc, 1); //mega48 does this too
  itoa(temp_loc[0], p1_loc,10);// 
  itoa(temp_loc[1], p2_loc,10);// get that precision 
  strcpy(loc_temp, "LOCAL : ");
  strcat(loc_temp, p1_loc);
  strcat(loc_temp, ".");   
  strcat(loc_temp, p2_loc); 
 // if((temp[0] < 1) | (temp[0] > 100)){LCD_MovCursorLn1(); return;}
  itoa(temp[0], p1,10);// 
  itoa(temp[1], p2,10);// 
  strcpy(rem_temp, "REMOTE: ");
  strcat(rem_temp, p1);
  strcat(rem_temp, ".");   
  strcat(rem_temp, p2); 
  LCD_Clr();
  LCD_PutStr(loc_temp); //send the string to LCD (lcd_functions)
  LCD_MovCursorLn2();
  LCD_PutStr(rem_temp); //send the string to LCD (lcd_functions)
  LCD_MovCursorLn1(); 
  sei();
  _delay_ms(50);


}
void turn_on_radio(void){

//                           DDRE:  0 0 0 0 1 0 1 1
//   (^ edge int from radio) bit 7--| | | | | | | |--bit 0 USART0 RX
//(shift/load_n for 74HC165) bit 6----| | | | | |----bit 1 USART0 TX
//                           bit 5------| | | |------bit 2 (new radio reset, active high)
//                  encoders bit 4--------| |--------bit 3 (TCNT3 PWM output for volume control)

//TIMSK  |=  (0<<TOIE0)| (0<<OCIE1A); //temporarily disable timing interrupts on fire up

DDRE  |= 0x04; //Port E bit 2 is active high reset for radio
DDRE  |= 0x40; //Port E bit 6 is shift/load_n for encoder 74HC165
DDRE  |= 0x08; //Port E bit 3 is TCNT3 PWM output for volume
PORTE |= 0x04; //radio reset is on at powerup (active high)
PORTE |= 0x40; //pulse low to load switch values, else its in shift mode


//Given the hardware setup reflected above, here is the radio reset sequence.
//hardware reset of Si4734
DDRE  &= ~(0x80); //PORTE is set to all outputs to begin with, turn off and on for reset
PORTE &= ~(1<<PE7); //int2 initially low to sense TWI mode
DDRE  |= 0x80;      //turn on Port E bit 7 to drive it low
PORTE |=  (1<<PE2); //hardware reset Si4734
_delay_us(200);     //hold for 200us, 100us by spec
PORTE &= ~(1<<PE2); //release reset
_delay_us(30);      //5us required because of my slow I2C translators I suspect
                    //Si code in "low" has 30us delay...no explaination in documentation
DDRE  &= ~(0x80);   //now Port E bit 7 becomes input from the radio interrupt


//Once its setup, you can tune the radio and get the received signal strength.
//station = get_station();

while(twi_busy()){} //spin while TWI is busy
fm_pwr_up();        //power up radio
while(twi_busy()){} //spin while TWI is busy
fm_tune_freq();     //tune to frequency
_delay_us(30); //give it a while

//TIMSK  |=  (1<<TOIE0)| (1<<OCIE1A); //timers back on
}//turn_on

void display_radio(void){
 uint8_t rssi = 0;
 uint16_t display_val;
 static uint16_t old_freq = 9990;
 char station_disp[16], Mhz[16], Khz[16], strength[16];

	if(current_fm_freq != old_freq){
	 while(twi_busy()){} //spin while TWI is busy
	  fm_tune_freq();     //tune to frequency
     //set_property(FM_TUNE_FREQ, current_fm_freq); //get status of radio tuning operation
	}

old_freq = current_fm_freq;
//retrive the receive strength and display on the bargraph display
while(twi_busy()){}                //spin while TWI is busy
fm_rsq_status();                   //get status of radio tuning operation
rssi =  si4734_tune_status_buf[4]; //get tune status
//redefine rssi to be a thermometer code
  if(rssi<= 8) {rssi = 0x00;} else
  if(rssi<=16) {rssi = 0x01;} else
  if(rssi<=24) {rssi = 0x03;} else
  if(rssi<=32) {rssi = 0x07;} else
  if(rssi<=40) {rssi = 0x0F;} else
  if(rssi<=48) {rssi = 0x1F;} else
  if(rssi<=56) {rssi = 0x3F;} else
  if(rssi<=64) {rssi = 0x7F;} else
  if(rssi>=64) {rssi = 0xFF;}
cli();
//hmm
itoa(rssi, strength, 10);

LCD_Clr();
display_val = current_fm_freq/100;
itoa(display_val, Mhz, 10);
display_val = (current_fm_freq%100)/10;
itoa(display_val, Khz, 10);
strcpy(station_disp, Mhz);
strcat(station_disp, ".");
strcat(station_disp, Khz);
strcat(station_disp, " FM ");
strcat(station_disp, strength); 
strcat(station_disp, " RSSI");
LCD_PutStr(station_disp);
LCD_MovCursorLn2();
if(alarm_flag){strcpy(station_disp, "ALARM");}
else{strcpy(station_disp, "RADIO");} 
LCD_PutStr(station_disp);
LCD_MovCursorLn1();
sei();
_delay_ms(100); 
}
