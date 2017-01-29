wwww#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <float.h>
#include <strings.h>

#define TIME

#define MAN_MASK 0x000FFFFFFFFFFFFFllu
#define EXP_MASK 0x7FF0000000000000llu
#define SIGN_MASK     0x8000000000000000llu
#define GET_EXP(x) ((x >> 52) & 0x7FF)
#define GET_MAN(x)  (x & 0xFFFFFFFFFFFFFllu)
#define GET_SIGN(x) (x >> 63)
#define IMPLICIT 0x10000000000000llu
#define A 1000
#define B 1000000000

double subtract(double x, double y);

static __inline__ unsigned long rdtsc(void) {
    unsigned a, d;
    __asm volatile("rdtsc" : "=a" (a), "=d" (d));

    return (((unsigned long)a) | (((unsigned long)d) << 32));
}

typedef int really_long __attribute__ ((mode (TI)));

typedef union {
    double d;
    uint64_t dcast;
} char_cast;

typedef union {
    double d;
    long l;
    unsigned char c[8];
    uint64_t u;
} pmem;

void part3(void) {

    puts("Feature Extraction : \n");
    int i = 0;
    int exponent;
    double mantissa, result;
    pmem test;
    /* use a value of 1.55 */
    test.d = 1.55;
    printf("Doubles :\n");
    printf("Value in union : %lf\n", test.d);
    result = frexp(test.d, &exponent);
    printf("Mantissa       : %lf\n", result);
    int sign = (test.d > 0) ? 1 : ((test.d < 0) ? -1 : 0);
    printf("Sign           : %d\n", sign);
    printf("Exponent       : %d\n", exponent);
    printf("Longs\n");
    printf("Value          : %ld\n", test.l); 
    sign = (test.l > 0) ? 1 : ((test.l < 0) ? -1 : 0);
    printf("Sign           : %d\n", sign);
    puts("\nChar array : \n");
    printf("Hex            : 0x"); 
    for (i = 0; i < sizeof(double); ++i) {    
        printf("%x", test.c[i]);
    }
    unsigned char ctest[8] = {0};
    printf("\nChar :           "); 
    for (i = 0; i < 8; i++) {
        ctest[i] = (test.u >> (i*8)) & 0xff;
        printf("%c", ctest[i]);
    }
    printf("\n\n"); 
}
/*
* Frexp implementation caches NaN and inf errors
* extract components
* subtract bias
* Shift until radix pt is normalized
* Increment exponent with each shift
* Reconstruct double
*/

double my_frexp(double x, int *exponent) {

    char_cast test;
    if (x == 0) {
        return 0;
    } 
    else if (isnan(x) || isinf(x)) {
        return x;
    }

    test.d = x;

    uint64_t exp = GET_EXP(test.dcast);
    uint64_t sign = test.dcast >> 63;
    uint64_t mantissa = GET_MAN(test.dcast);
    if (mantissa == 0) {
        *exponent = 0;
        return x;
    }
    if(exp > 0){    
        exp -= 1023;
    }
    while (mantissa < IMPLICIT) {
        mantissa <<=1;
        exp--;
    }
    *exponent = exp + 1;
    mantissa &= ~IMPLICIT;
    //thing we want to plug into the original uint64_t 
    test.dcast = (sign & SIGN_MASK) | ((exp << 52)& EXP_MASK )| ((mantissa) & MAN_MASK);
    return test.d;
}
/* The Add algorithm is as follows 
 * Extract the components of the double
 * Add an implicit leading 1
 * Shift the lower exponent until it aligns with the larger one
 * Add the fractions
 * Normalize the result by shifting radix point until only one is left
 * Reconstruct the double
 */
double add(double x, double y) {


   /* get 3 unions with double and unsigned64 representations*/
    char_cast a, b, z;
    a.d = x;
    b.d = y;
    int sign_change = 0;
    double sub = 0;
    /* compare signs and swich doubles to negative if sign is 0*/ 
    /* if sign is negative then subtract */
    if (GET_SIGN(a.dcast) != GET_SIGN(b.dcast)) {
        switch(GET_SIGN(a.dcast)) {
            case (0) :
                b.d = -y;
                sub = subtract(x, b.d);
                break;
            default :    
                a.d = -x;
                sub = subtract(y, a.d);
                break;
        }
    }    
    if (sub) { return sub; }
    /* get minimum and maximum of the two values */
    if (fabs(x) < fabs(y)) {
        a.d = y;
        b.d = x;
        sign_change = 1;
    }
    uint64_t maxfraction = GET_MAN(a.dcast) | IMPLICIT;
    uint64_t minfraction = GET_MAN(b.dcast) | IMPLICIT;
    uint64_t maxexp = GET_EXP(a.dcast);
    uint64_t minexp = GET_EXP(b.dcast);
    unsigned int maxsign = GET_SIGN(a.dcast);
    unsigned int minsign = GET_SIGN(b.dcast);

    int exp_diff = maxexp - minexp;
    minfraction >>= exp_diff;
    minexp += exp_diff;
    minfraction += maxfraction;
    /* shift until there is 1 left of the radix point */
    /* increment the exp all the way */
    while ((minfraction >> 52) > 1) {
        minfraction >>= 1;
        maxexp += 1;
    }
    /* depending on the sign change, return a negative or positive result */
    if (sign_change == 0) {
        z.dcast = (maxsign & SIGN_MASK) | ((maxexp << 52)& EXP_MASK )| ((minfraction) & MAN_MASK);
    } else {
        z.dcast = (~maxsign & SIGN_MASK) | ((maxexp << 52)& EXP_MASK )| ((minfraction) & MAN_MASK);
    }
    return z.d;
}
/* The Subtraction algorithm works almost the same as add
 * Extract the components of the double
 * Add an implicit leading 1 
 * Shift the lower exponent until it aligns with the larger one
 * subtract the fractions
 * Normalize the result by shifting radix point left until only one is left
 * Reconstruct the double
 */
double subtract(double x, double y) {

   char_cast a, b, z;
    a.d = x;
    b.d = y;
    int sign_change = 0;
    double adds = 0;
    /* compare signs and swich doubles to negative if sign is 0*/ 
    /* if sign is negative then subtract */
    if (GET_SIGN(a.dcast) != GET_SIGN(b.dcast)) {
        switch (GET_SIGN(a.dcast)) {
            case (0) :
                b.d = -y;
                adds = add(x, b.d);
                break;
            default :    
                a.d = -x;
                adds = add(y, a.d);
                break;
        }
    }             
    if (adds) { return adds; }
    if (fabs(x) < fabs(y)) {
        a.d = y;
        b.d = x;
        sign_change = 1;
    }
    uint64_t maxfraction = GET_MAN(a.dcast) | IMPLICIT;
    uint64_t minfraction = GET_MAN(b.dcast) | IMPLICIT;
    uint64_t maxexp = GET_EXP(a.dcast);
    uint64_t minexp = GET_EXP(b.dcast);
    unsigned int maxsign = GET_SIGN(a.dcast);
    unsigned int minsign = GET_SIGN(b.dcast);

    int exp_diff = maxexp - minexp;
    minfraction >>= exp_diff;
    if (minsign == maxsign) {
        maxfraction -= minfraction;
        sign_change = 1;
    } else {
        maxfraction += minfraction;
        sign_change = 0;
    }
    /* then 0 was input */ 
    if (maxfraction == 0) { return 0; }
    /* shift until there is 1 left of the radix point */
    /* increment the exp all the way */
    while ((maxfraction >> 52) < 1) {
        maxfraction <<= 1;
        maxexp -= 1;
    }
    /* depending on the sign change, return a negative or positive result */
    if (sign_change == 0) {
        z.dcast = (maxsign & SIGN_MASK) | ((maxexp << 52)& EXP_MASK )| ((maxfraction) & MAN_MASK);
    } else {
        z.dcast = (~maxsign & SIGN_MASK) | ((maxexp << 52)& EXP_MASK )| ((maxfraction) & MAN_MASK);
    }
    return z.d;

}

/* The Multiplication algorithm:
 * Add the Exponents, subtract the bias
 * Xor the sign bit 
 * Mutiply significands
 * Store result in 128 bit int
 * Normalize number but shifting
 * Reconstruct the double
 */

double multiply(double x, double y) {
    /* 3 unions for extraction and recalculation of floats */
    char_cast a, b, z;
    a.d = x;
    b.d = y;
    /* extract fractions from a and b, add the leading one */
    uint64_t afraction = (GET_MAN(a.dcast) | IMPLICIT);// << 10;
    uint64_t bfraction = (GET_MAN(b.dcast) | IMPLICIT);// << 11;
    /* get exponents and subtract biases */
    uint64_t aexp = GET_EXP(a.dcast);
    uint64_t bexp = GET_EXP(b.dcast);
    unsigned int asign = GET_SIGN(a.dcast);
    unsigned int bsign = GET_SIGN(b.dcast);
    /* xor the sign bits to get new sign */
    if (aexp == 0x7FF || bexp == 0x7FF) {
        puts("NaN or Inf");
    }
    uint64_t zsign = asign ^ bsign;
    /* add the exponents */
    uint64_t zexp = aexp + bexp - 1023;
    /* store the overflow in a 128 bit int */
    really_long mul = afraction * bfraction;
    uint64_t zfraction;
    /* if there are bits to the left of the radix pt. shift until 1.bbb */
    while ((mul >> 52) > 1) {
        mul >>= 1;
        /* and add one to exponent */
        zexp++;
    }
    /* store back into unsigned int */
    zfraction = mul;
    /* the masks are there in case the value is not 0 */
    z.dcast = (zsign & SIGN_MASK) | ((zexp << 52) & EXP_MASK) | (zfraction);
    /* return the double representation */
    return z.d;
}
/* The quake 3 implementation with another iteration and made for doubles
 * Basically a fast Newton's Method
 * Calculation based on log2(y) = -(1/2)log2(x)
 * The magic number is (3/2) * L * (B-s)
 */

double _sqrt(double x){

    long i;
    double x2, y;
    const double z = 1.5F;
    x2 = x * 0.5F;
    y  = x;
    /* like a union, force the typecast */
    i  = * (long * ) &y;       
    /* Magic double number, found by bisecting to a given tolerance */
    i  = 0x5fe6eb50c7b537a9 - ( i >> 1 ); 
    /* Do it again */
    y  = * ( double * ) &i;
    /* iterations increase pricision */
    y  = y * ( z - ( x2 * y * y ) );   
    y  = y * ( z - ( x2 * y * y ) );   
    y  = y * ( z - ( x2 * y * y ) ); // 3rd iteration, makes it perfect

    return y;

}
/* The division algorithm basically calls multiply
 * Invert the minimum exponent
 * Divide significands
 * Normalize number by shifting
 * Call multiply
 * Reconstruct the double 
 */
double divide(double x, double y) {
    char_cast a, b, z;
    a.d = x;
    b.d = y;
    /* extract fractions from a and b, add the leading one */
    uint64_t afraction = (GET_MAN(a.dcast) | IMPLICIT);// << 10;
    uint64_t bfraction = (GET_MAN(b.dcast) | IMPLICIT);// << 11;
    /* get exponents and subtract biases */
    uint64_t aexp = GET_EXP(a.dcast);
    uint64_t bexp = GET_EXP(b.dcast);
    unsigned int asign = GET_SIGN(a.dcast);
    unsigned int bsign = GET_SIGN(b.dcast);
    /* xor the sign bits to get new sign */
    if (aexp == 0x7FF || bexp == 0x7FF) {
        puts("NaN or Inf");
    }
    unsigned long zexp = -bexp;
    uint64_t zfraction = afraction / afraction;
    if(bfraction != 1) { 
        while ((zfraction >> 52) < 1) {
            zfraction <<= 1;
            zexp -= 1;
        }
    }
    z.dcast = (bsign & SIGN_MASK) | ((zexp << 52) & EXP_MASK) | (zfraction);
    z.d = multiply(x, z.d);
    return z.d;
}

int main(void) {
    puts("Masks used:\n");
    puts("SIG_MASK    : 0x000FFFFFFFFFFFFFllu\n");
    puts("EXP_MASK    : 0x7FF0000000000000llu\n");
    puts("SIGN_MASK   : 0x8000000000000000llu\n");
    puts("GET_EXP(x)  : ((x >> 52) & 0x7FF)\n");
    puts("GET_MAN(x)  : (x & 0xFFFFFFFFFFFFFllu)\n");
    puts("GET_SIGN(x) : (x >> 63)\n");
    puts("IMPLICIT    : 0x10000000000000llu\n");

    int i = 0;
    double res = 0;

    /* frexp */
    int another = 0;
    double arg = 4.2;
    puts("Frexp implementation caches NaN and inf errors\n");
    puts("* extract components\n");
    puts("* subtract bias\n");
    puts("* Shift until radix pt is normalized\n");
    puts("* Increment exponent with each shift\n");
    puts("* Reconstruct double\n");
    double man = frexp(arg, &another);
    printf("%lf = %lf * 2 ^ %d\n", arg, man, another);

    /* part3 */
    part3();

    /* add */
    puts("The Add algorithm is as follows\n"); 
    puts("* Extract the components of the double\n") ;
    puts("* Add an implicit leading 1\n"); 
    puts("* Shift the lower exponent until it aligns with the larger one\n"); 
    puts("* Add the fractions\n");
    puts("* Normalize the result by shifting radix point until only one is left\n"); 
    puts("* Reconstruct the double\n"); 
 
    res = add(1.5, 99.99);
    printf("1.5 + 99.99 = %lf\n",res);
    res = add(35.6, 54.4);
    printf("35.6 + 54.4 = %lf\n\n", res);

    /* subtract */
    puts("The Subtraction algorithm works almost the same as add\n"); 
    puts("* Extract the components of the double\n"); 
    puts("* Add an implicit leading 1\n"); 
    puts("* Shift the lower exponent until it aligns with the larger one\n"); 
    puts("* subtract the fractions\n");
    puts("* Normalize the result by shifting radix point left until only one is left\n"); 
    puts("* Reconstruct the double\n"); 
 
    res = subtract(101.0, 1);
    printf("101.0 - 1 = %lf\n", res);
    res = subtract(33.0, 31.5);
    printf("33.0 - 31.5 = %lf\n", res);

    /* multiply */
    puts("The Multiplication algorithm:\n"); 
    puts("* Add the Exponents, subtract the bias\n") ;
    puts("* Xor the sign bit\n"); 
    puts("* Mutiply significands\n"); 
    puts("* Store result in 128 bit int\n");
    puts("* Normalize number but shifting\n"); 
    puts("* Reconstruct the double\n"); 

    multiply(9.0, 9.0);
    printf("9.0 * 9.0 = %lf\n", res);
    multiply(.5, .5);
    printf(".5 * .5 = %lf\n", res);

    /* divide */ 
    puts("The division algorithm basically calls multiply\n"); 
    puts("* Invert the minimum exponent\n") ;
    puts("* Divide significands\n"); 
    puts("* Normalize number by shifting\n"); 
    puts("* Call multiply\n");
    puts("* Reconstruct the double\n"); 
 
    res = divide(10.0, 5.0);
    printf("10.0 / 5.0 = %lf\n", res);
    res = divide(5.0, 2.0);
    printf("5.0 / 2.0 = %lf\n", res);

    /* sqrt */
    puts("The quake 3 implementation with another iteration and made for doubles\n");
    puts("Basically a fast Newton's Method\n");
    puts("Calculation based on log2(y) = -(1/2)log2(x)\n");
    puts("The magic number is (3/2) * L * (B-s)\n");
    puts("This is realy fast inverse square root, so the fpu is used to divide, b/c my divide is impricise");
    res = _sqrt(4);
    printf("sqrt(4) = %lf\n", 1/res);
    res = _sqrt(5);
    res = printf("sqrt(5) = %lf\n", 1/res);

   
#ifdef TIME
    puts("Hardware add\n");
    unsigned long a = rdtsc();
    for (i = 0; i < A; i++) {    
        add(4.5, 3.5);
    }
    unsigned long b = rdtsc();

    unsigned long c = rdtsc();
    for (i = 0; i < B; i++) {    
        add(4.5, 3.5);
    }
    unsigned long d = rdtsc();
    unsigned long e = b - a;
    unsigned long f = d - c;
    unsigned long ticks = (f - e)/(B - A);
    printf("Clocks ticks for add on Core M .9GHz: %lu\n\n", ticks);
    
    puts("Software add\n");
    a = rdtsc();
    for (i = 0; i < A; i++) {    
        res = 4.5 + 3.5;
    }
    b = rdtsc();

    c = rdtsc();
    for (i = 0; i < B; i++) {    
        res = 4.5 + 3.5;
    }
    d = rdtsc();
    e = b - a;
    f = d - c;
    ticks = (f - e)/(B - A);
    printf("Clocks ticks for subtract on Core M .9GHz: %lu\n\n", ticks);
    
    puts("Software sub\n");
    a = rdtsc();
    for (i = 0; i < A; i++) {    
        subtract(3.3, 1.1);
    }
    b = rdtsc();

    c = rdtsc();
    for (i = 0; i < B; i++) {    
        subtract(3.3, 1.1);
    }
    d = rdtsc();
    e = b - a;
    f = d - c;
    ticks = (f - e)/(B - A);
    printf("Clocks ticks for subtract on Core M .9GHz: %lu\n\n", ticks);
    
 
    puts("Hardware sub\n");
    a = rdtsc();
    for (i = 0; i < A; i++) {    
        res = 3.3 - 1.1;
    }
    b = rdtsc();

    c = rdtsc();
    for (i = 0; i < B; i++) {    
        res = 3.3 - 1.1;
    }
    d = rdtsc();
    e = b - a;
    f = d - c;
    ticks = (f - e)/(B - A);
    printf("Clocks ticks for subtract on Core M .9GHz: %lu\n\n", ticks);
    
    puts("Software mul\n");
    rdtsc();
    a = rdtsc();
    for (i = 0; i < A; i++) {    
        multiply(2.2, 2.0);
    }
    b = rdtsc();

    c = rdtsc();
    for (i = 0; i < B; i++) {    
        multiply(2.2, 2.0);
    }
    d = rdtsc();
    e = b - a;
    f = d - c;
    ticks = (f - e)/(B - A);
    printf("Clocks ticks for multiply on Core M .9GHz: %lu\n\n", ticks);

     
    puts("Hardware mul\n");
    rdtsc();
    a = rdtsc();
    for (i = 0; i < A; i++) {    
       res = 2.2 * 2.0;
    }
    b = rdtsc();

    c = rdtsc();
    for (i = 0; i < B; i++) {    
       res = 2.2 * 2.0;
    }
    d = rdtsc();
    e = b - a;
    f = d - c;
    ticks = (f - e)/(B - A);
    printf("Clocks ticks for multiply on Core M .9GHz: %lu\n\n", ticks);

    puts("Software sqrt\n");
    a = rdtsc();
    for (i = 0; i < A; i++) {    
        _sqrt(5);
    }
    b = rdtsc();

    c = rdtsc();
    for (i = 0; i < B; i++) {    
        _sqrt(5);
    }
    d = rdtsc();
    e = b - a;
    f = d - c;
    ticks = (f - e)/(B - A);
    printf("Clocks ticks for sqrt on Core M .9GHz: %lu\n\n", ticks);
 
    puts("Hardware sqrt\n");
    a = rdtsc();
    for (i = 0; i < A; i++) {    
        res = sqrt(5);
    }
    b = rdtsc();

    c = rdtsc();
    for (i = 0; i < B; i++) {    
        res = sqrt(5);
    }
    d = rdtsc();
    e = b - a;
    f = d - c;
    ticks = (f - e)/(B - A);
    printf("Clocks ticks for sqrt on Core M .9GHz: %lu\n\n", ticks);
   
    puts("Software division\n");
    a = rdtsc();
    for (i = 0; i < A; i++) {    
        divide(5.0, 2.0);
    }
    b = rdtsc();

    c = rdtsc();
    for (i = 0; i < B; i++) {    
        divide(5.0, 2.0);
    }
    d = rdtsc();
    e = b - a;
    f = d - c;
    ticks = (f - e)/(B - A);
    printf("Clocks ticks for division on Core M .9GHz: %lu\n\n", ticks);
    
    puts("Hardware division\n");
    a = rdtsc();
    for (i = 0; i < A; i++) {    
        res = (5.0/2.0);
    }
    b = rdtsc();

    c = rdtsc();
    for (i = 0; i < B; i++) {    
        res = (5.0/2.0);
    }
    d = rdtsc();
    e = b - a;
    f = d - c;
    ticks = (f - e)/(B - A);
    printf("Clocks ticks for division on Core M .9GHz: %lu\n\n", ticks);
#endif
    return 0;

}
