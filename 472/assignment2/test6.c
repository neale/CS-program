/************************************************************
 * PROGRAM: hw2.c
 * AUTHOR: Jordan Crane
 * DESCRIPTION: Implements various floating point functionaity
 * ***********************************************************/

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <limits.h>
#include <memory.h>
#include <float.h>
#include <stdbool.h>

#define FRACTION_MASK 0x000FFFFFFFFFFFFFllu
#define LEADING_BIT   0x0010000000000000llu 
#define EXPONENT_MASK 0x7FF0000000000000llu
#define EXPONENT_NORM 0x3FE0000000000000llu
#define SIGN_MASK     0x8000000000000000llu
#define EXPONENT_NAN  0x07FF
#define EXPONENT_BIAS 1023 
#define GET_EXP(x) ((x & EXPONENT_MASK) >> 52)
#define GET_FRAC(x) (x & FRACTION_MASK)
#define GET_SIGN(x) ((x & SIGN_MASK) >> 63)

double my_frexp(double x, int* exponent);

void frexp_test(double x);

double my_add(double x, double y);

double my_sub(double x, double y);

double neale_sub(double x, double y);

double my_mul(double x, double y);

double my_div(double x, double y);

double my_sqrt(double x);

void feature_extraction(uint64_t bit_pattern);

typedef union {
   double d;
   uint64_t u;
} char_cast;

typedef union {
   uint64_t u;
   double d;
   long l;
   char c[8];
} feature_union;

int main() {

   frexp_test(1.0);
   frexp_test(0.0);
   frexp_test(-0.0);
   frexp_test(1234567890.0987654321);
   frexp_test(-1234567890.0987654321);

   uint64_t bit_pattern = 0xF0F1F2F3F4F5F6F7;
   feature_extraction(bit_pattern);

   my_add(21.0, 20.0);
   my_add(1.0, 5.0);
   my_add(-1.5, 5.5);
   my_add(1.6, 5.5);
   my_add(1.6, 5.2);
   
   my_sub(21.0, 20.0);
   my_sub(-5.0, -1.0);
   my_sub(1.5, -5.5);
   my_sub(1.6, 5.5);
   my_sub(1.6, 5.2);
/*
   my_mul(10.0, 10.0);
   my_mul(0.5, 10.0);
   my_mul(0.5, 0.5);
   my_mul(5.0, 5.0);
   my_mul(2.0, 3.5);
  
   neale_sub(21.0, 20.0);
   neale_sub(-1.0, -1.0);
   neale_sub(1.5, 5.5);
   neale_sub(1.6, 5.5);
   neale_sub(1.6, 5.2);
*/


   //frexp_test(DBL_EPSILON);
   //frexp_test(DBL_MIN);
   //frexp_test(DBL_MIN/1024);
   //frexp_test(DBL_MIN/1024/1024);
   //frexp_test(INFINITY);
   //frexp_test(DBL_TRUE_MIN);
   return 0;
}

double my_frexp(double x, int *exponent) {

   char_cast x_union;
   x_union.d = x;

   uint64_t fraction = x_union.u & FRACTION_MASK;
   uint64_t exp = (x_union.u & EXPONENT_MASK) >> 52;

   if(exp == EXPONENT_NAN) {  //Infinity and NaN
      *exponent = 0;
      return x;
   }
   if(exp > 0) 
      exp -= EXPONENT_BIAS;
   else if(fraction == 0) { //Zero
      *exponent = 0;
      return x; 
   }
   else {   //Sub-normal numbers
      exp = 1 - EXPONENT_BIAS;
      while(fraction < LEADING_BIT) {
         fraction <<= 1;
         exp--;
      }
   }

   *exponent = exp + 1;
   fraction &= ~LEADING_BIT;
   x_union.u = (x_union.u & SIGN_MASK) | EXPONENT_NORM | fraction;
   return x_union.d;   
}

void frexp_test(double d) {

   int i1,i2;
   double d1,d2;
   d1 = frexp(d, &i1);
   d2 = my_frexp(d, &i2);
   printf("frexp:\n input: %lf\n output: %lf\n exponent: %u\n", d, d1, i1);
   printf("my_frexp:\n input: %lf\n output: %lf\n exponent: %u\n", d, d2, i2);
}

double my_add(double x, double y) {

   char_cast x_union, y_union, sum;
   long x_exp, y_exp; 
   int exp_diff;
   double temp;
   uint64_t fraction_sum;
   uint64_t x_frac, y_frac;
   uint8_t x_sign, y_sign;

   if(fabs(x) < fabs(y)) {
      x_union.d = y;
      y_union.d = x;
   }
   else {
      x_union.d = x;
      y_union.d = y;
   }

   if(GET_SIGN(x_union.u) != GET_SIGN(y_union.u)) {  //if signs are different, flip negative sign and send to subtract function
      printf("MY_ADD NO SIGN MATCH\n");
      printf("X: %lf\n", x_union.d);
      printf("Y: %lf\n", y_union.d);
      switch(GET_SIGN(x_union.u)) {
         case 0:
           y_union.d = -y;
           printf("NEW Y: %lf\n", y_union.d);
           printf("NEW X: %lf\n", x_union.d);
           temp = my_sub(x, y_union.d);
           return temp;
           break;
         case 1:
           x_union.d = -x;
           printf("NEW X: %lf\n", x_union.d);
           temp = my_sub(y, x_union.d);
           return temp;
           break;
         default:
           break;
      }
   }

   x_frac = GET_FRAC(x_union.u) | LEADING_BIT; 
   y_frac = GET_FRAC(y_union.u) | LEADING_BIT; 

   x_exp = GET_EXP(x_union.u); 
   y_exp = GET_EXP(y_union.u); 

   exp_diff = x_exp - y_exp;   //find the difference between the exponents
   y_exp += exp_diff;          //add difference to Y's exponent and shft mantissa to the left
   y_frac >>= exp_diff;
   fraction_sum = x_frac + y_frac;

   while((fraction_sum >> 52) > 1) {
      fraction_sum >>= 1;
      x_exp += 1;
   }

   sum.u = (x_union.u & SIGN_MASK) | ((x_exp << 52) & EXPONENT_MASK) | (fraction_sum & FRACTION_MASK);
   printf("\n%lf + %lf = %lf\n\n", x, y, sum.d);
   return sum.d;
}

double my_sub(double x, double y) {

   char_cast x_union, y_union, diff;
   long x_exp, y_exp; 
   int exp_diff;
 a  double temp;
   bool sign_flip_flag = false;
   uint64_t fraction_diff;
   uint64_t x_frac, y_frac;
   uint8_t x_sign, y_sign;

   y_union.d = y;
   x_union.d = x;

   printf("X SIGN: %llu\n", GET_SIGN(x_union.u));
   printf("Y SIGN: %llu\n", GET_SIGN(y_union.u));

   if(GET_SIGN(x_union.u) != GET_SIGN(y_union.u)) {  //if signs are different, flip negative sign and send to subtract function
      printf("MY_SUB NO SIGN MATCH\n");
      printf("X: %lf\n", x_union.d);
      printf("Y: %lf\n", y_union.d);
      switch(GET_SIGN(x_union.u)) {
         case 0:
           y_union.d = -y;
           temp = my_add(x, y_union.d);
           return temp;
           break;
         case 1:
           y_union.d = -y;
           temp = my_add(x, y_union.d);
           return temp;
           break;
         default:
           break;
      }
   }

   if(fabs(x) < fabs(y)) {
      x_union.d = y;
      y_union.d = x;
      sign_flip_flag = true;
   } 

   x_frac = GET_FRAC(x_union.u) | LEADING_BIT; 
   y_frac = GET_FRAC(y_union.u) | LEADING_BIT; 

   x_exp = GET_EXP(x_union.u); 
   y_exp = GET_EXP(y_union.u); 

   exp_diff = x_exp - y_exp;   //find the difference between the exponents
   y_exp += exp_diff;          //add difference to Y's exponent and shft mantissa to the left
   y_frac >>= exp_diff;
   fraction_diff = x_frac - y_frac;

   while((fraction_diff >> 52) < 1) {
      fraction_diff <<= 1;
      x_exp -= 1;
   }

   if(sign_flip_flag == false)
      diff.u = (x_union.u & SIGN_MASK) | ((x_exp << 52) & EXPONENT_MASK) | (fraction_diff & FRACTION_MASK);
   else
      diff.u = (~x_union.u & SIGN_MASK) | ((x_exp << 52) & EXPONENT_MASK) | (fraction_diff & FRACTION_MASK);

   printf("\n%lf - %lf = %lf\n\n", x, y, diff.d);
   return diff.d;
}

double my_mul(double x, double y) {

   char_cast x_union, y_union, temp, product;
   x_union.d = x;
   y_union.d = y;

   uint64_t x_frac = GET_FRAC(x_union.u) | LEADING_BIT;
   uint64_t y_frac = GET_FRAC(y_union.u) | LEADING_BIT;
   
   uint32_t x_exp = GET_EXP(x_union.u) - 1023;
   uint32_t y_exp = GET_EXP(y_union.u) - 1023;

   uint8_t x_sign = GET_SIGN(x_union.u);
   uint8_t y_sign = GET_SIGN(y_union.u);

   uint64_t prod_sign = (x_sign + y_sign) % 2;
   long prod_exp = x_exp + y_exp;

   uint64_t Prod_frac =  x_frac * y_frac;

   //printf("afrac : %llu\n", x_frac);
   //printf("bfrac : %llu\n", y_frac);
   //printf("zfrac : %lf\n", prod_frac);

   while ((prod_frac >> 53) > 1) {
      prod_frac >>= 1;
      prod_exp += 1;
   }

   //printf("zexp : %llu\n", prod_exp);
   //printf("zfrac : %llu\n", prod_frac);
   //printf("zsign : %llu\n", prod_sign);
   product.u = ((prod_sign << 63) & SIGN_MASK) | ((prod_exp << 52) & EXPONENT_MASK) | (prod_frac & FRACTION_MASK);
   printf("%lf * %lf = %lf\n\n", x, y, product.d);
   return product.d;
}

double my_div(double x, double y) {


}

double my_sqrt(double x) {

}

void feature_extraction(uint64_t bit_pattern) {
   feature_union features;
   features.u = bit_pattern; 
   int exponent;

   // As a double
   printf("\nDOUBLE:\n");
   double mantissa = my_frexp(features.d, &exponent); 
   if(features.d < 0)
      printf("sign: 1\n");
   else 
      printf("sign: -1\n");
   printf("exponent: %u\n", exponent);
   printf("mantissa: %lf\n\n", mantissa);

   // As a long
   printf("LONG:\n");
   printf("value: %ld\n", features.l);
   if(features.l < 0)
      printf("sign: 1\n\n");
   else
      printf("sign: -1\n\n");

   // As a character array
   printf("CHARACTERS:\n");
   for(int i = 7; i > -1; i--) 
      printf("%c", features.c[i]);
   printf("\n");
}
