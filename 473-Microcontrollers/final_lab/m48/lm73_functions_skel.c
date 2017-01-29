// lm73_functions.c       
// Roger Traylor 11.28.10

#include <util/twi.h>
#include "lm73_functions_skel.h"
#include <util/delay.h>

volatile uint8_t lm73_wr_buf[2];
volatile uint8_t lm73_rd_buf[2];

//********************************************************************************

//******************************************************************************
void lm73_temp_convert(uint8_t * temp, uint16_t lm73_temp, uint8_t f_not_c){

    //given a temperature reading from an LM73, the address of a buffer
    //array, and a format (deg F or C) it formats the temperature into ascii in 
    //the buffer pointed to by the arguement.


    //default 11 bit readings

    if ((lm73_temp & 0x8000) == 0x0000){ //check sign bit
        if(lm73_temp & 1<<14){temp[0] += 128;}
        if(lm73_temp & 1<<13){temp[0] += 64;}
        if(lm73_temp & 1<<12){temp[0] += 32;}
        if(lm73_temp & 1<<11){temp[0] += 16;}
        if(lm73_temp & 1<<10){temp[0] += 8;}
        if(lm73_temp & 1<<9) {temp[0] += 4;}
        if(lm73_temp & 1<<8) {temp[0] += 2;}
        if(lm73_temp & 1<<7) {temp[0] += 1;}

        if(lm73_temp & 1<<6) {temp[1] += 50;}
        if(lm73_temp & 1<<5) {temp[1] += 25;}
        if(lm73_temp & 1<<4) {temp[1] += 13;}
        if(lm73_temp & 1<<3) {temp[1] += 6;}
        if(lm73_temp & 1<<2) {temp[1] += 3;}
    }

    // ********** Negative Values *************** //
    /* else{
       if(~lm73_temp & 1<<14){temp += 128;}
       if(~lm73_temp & 1<<13){temp += 64;}
       if(~lm73_temp & 1<<12){temp += 32;}
       if(~lm73_temp & 1<<11){temp += 16;}
       if(~lm73_temp & 1<<10){temp += 8;}
       if(~lm73_temp & 1<<9){temp += 4;}
       if(~lm73_temp & 1<<8){temp += 2;}
       if(~lm73_temp & 1<<7){temp += 1;}
       if(~lm73_temp & 1<<6){temp += .5;}
       if(~lm73_temp & 1<<5){temp += .25;}
       if(~lm73_temp & 1<<4){temp += .125;}
       if(~lm73_temp & 1<<3){temp += .0625;}
       if(~lm73_temp & 1<<2){temp += .03125;}
       temp = temp*-1;
       } */
    //if (f_not_c == 1){ //Celcius
}//lm73_temp_convert
