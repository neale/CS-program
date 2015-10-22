#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <float.h>

#define DOUBLE 64
#define MANTISSA 52
#define EXPONENT 11
#define SIGN 1
#define GET_MANTISSA(x) (x & 0xFFFFFFFFFFFFF)
#define GET_EXP(x) ((x >> 0x1FFFFFFFFFFFFF) & 0x3FF)
#define GET_SIGN(x) (x >> 63)
/* this is the double version
 * 53 mantissa bits: shift
 * 11 exponent bits: mask then shift
 * 1 sign bit: last bit
 */ 

struct {
    unsigned long int field : DOUBLE;
} Bitfield;


typedef union {
  double d;
  struct {
    unsigned long mantissa    : MANTISSA;
    unsigned int exponent     : EXPONENT;
    unsigned int sign         : SIGN;
  } parts;

} double_cast;

union udouble {
    double d;
    unsigned long u;
};

double new_frexp(double x, int *exponent) {

    union udouble u1;
    u1.d = x;
    printf("u1: %lu\n", u1.u);
    unsigned long mantissa = GET_MANTISSA(u1.u);
    unsigned long exp = GET_EXP(u1.u);
    unsigned long sign = GET_SIGN(u1.u);
    *exponent = exp;
    return mantissa;

}


int main(int argc, char **argv) {

    double res = 0;
    int exp = 0;
    double param = 8.89;
    res = frexp(param, &exp);
    printf("%f = %f * 2^%d\n", param, res, exp);

    res = 0;
    exp = 0;
    res = new_frexp(param, &exp);
    printf("%f = %f * 2^%d\n", param, res, exp);
    
    double_cast d1;
    d1.d = 1.125;
    printf("sign = %x\n",d1.parts.sign);
    printf("exponent = %x\n",d1.parts.exponent);
    printf("mantisa = %lx\n",d1.parts.mantissa);

    return 0;
}
