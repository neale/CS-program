#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <float.h>
#include <strings.h>

#define MAN_MASK 0x000FFFFFFFFFFFFFllu
#define EXP_MASK 0x7FF0000000000000llu
#define SIGN_MASK     0x8000000000000000llu
#define GET_EXP(x) ((x >> 52) & 0x7FF)
#define GET_MAN(x)  (x & 0xFFFFFFFFFFFFFllu)
#define GET_SIGN(x) (x >> 63)
#define IMPLICIT 0x10000000000000llu
#define A 1000000000
#define B 1000
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

    char c[16];
    struct {
        uint64_t high;
        uint64_t low;
    } interior;
} bigint;

typedef union {
    double d;
    long l;
    unsigned char c[8];
    uint64_t u;
} pmem;

void part3(void) {
    int i = 0;
    int exponent;
    double mantissa;
    double result;
    pmem test;
    test.d = 1.55;
    puts("\npart 3\n\n");
    puts("doubles :\n");
    printf("value in union : %lf\n", test.d);
    result = frexp(test.d, &exponent);
    printf("mantissa :       %lf\n", result);
    int sign = (test.d > 0) ? 1 : ((test.d < 0) ? -1 : 0);
    printf("sign :           %d\n", sign);
    printf("exponent :       %d\n", exponent);
    puts("longs\n");
    printf("value :          %ld\n", test.l); 
    sign = (test.l > 0) ? 1 : ((test.l < 0) ? -1 : 0);
    printf("sign :           %d\n", sign);
    puts("\nchar array : \n");
    printf("hex :            "); 
    for (i = 0; i < sizeof(double); ++i) {    
        printf("%x", test.c[i]);
    }
    unsigned char ctest[8] = {0};
    printf("\nchar :           "); 
    for (i = 0; i < 8; i++) {
        ctest[i] = (test.u >> (i*8)) & 0xff;
        printf("%c", ctest[i]);
    }
    printf("\n\n"); 
}

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

double add(double x, double y) {

    char_cast a, b, z;
    a.d = x;
    b.d = y;
    uint64_t afraction = GET_MAN(a.dcast) | IMPLICIT;
    uint64_t bfraction = GET_MAN(b.dcast) | IMPLICIT;
    uint64_t aexp = GET_EXP(a.dcast);
    uint64_t bexp = GET_EXP(b.dcast);
    unsigned int asign = GET_SIGN(a.dcast);
    unsigned int bsign = GET_SIGN(b.dcast);
    uint64_t minfraction = 0;
    uint64_t maxfraction = 0;
    uint64_t minexp = 0;
    uint64_t maxexp = 0;
    unsigned int minsign = 0;
    unsigned int maxsign = 0;
    uint64_t xoperand, yoperand;
    if (fmin(aexp, bexp) == aexp) {
        minfraction = afraction;
        minexp      = aexp;
        minsign     = asign;
        maxfraction = bfraction;
        maxexp      = bexp;
        maxsign     = bsign;
    } else {
        minfraction = bfraction;
        minexp      = bexp;
        minsign     = bsign;
        maxfraction = afraction;
        maxexp      = aexp;
        maxsign     = asign;
    }

    int exp_diff = maxexp - minexp;
    minfraction >>= exp_diff;
    minexp += exp_diff;
    minfraction += maxfraction;
    while ((minfraction >> 52) > 1) {
        minfraction >>= 1;
        maxexp += 1;
    }
    z.dcast = (maxsign & SIGN_MASK) | ((maxexp << 52)& EXP_MASK )| ((minfraction) & MAN_MASK);
    //printf("\n%lf + %lf = %lf\n\n", x, y, z.d);
    return 0;
}

double subtract(double x, double y) {

    char_cast a, b, z;
    a.d = x;
    b.d = y;
    int sign_change;
    uint64_t afraction = GET_MAN(a.dcast) | IMPLICIT;
    uint64_t bfraction = GET_MAN(b.dcast) | IMPLICIT;
    uint64_t aexp = GET_EXP(a.dcast);
    uint64_t bexp = GET_EXP(b.dcast);
    unsigned int asign = GET_SIGN(a.dcast);
    unsigned int bsign = GET_SIGN(b.dcast);
    uint64_t minfraction = 0;
    uint64_t maxfraction = 0;
    uint64_t minexp = 0;
    uint64_t maxexp = 0;
    unsigned int minsign = 0;
    unsigned int maxsign = 0;
    if (fmin(aexp, bexp) == aexp) {
        minfraction = afraction; 
        minexp      = aexp;
        minsign     = asign;
        maxfraction = bfraction;
        maxexp      = bexp;
        maxsign     = bsign;
    } else {
        minfraction = bfraction;
        minexp      = bexp;
        minsign     = bsign;
        maxfraction = afraction;
        maxexp      = aexp;
        maxsign     = asign;
    }
    int exp_diff = maxexp - minexp;
    minfraction >>= exp_diff;
    if (minsign == maxsign) {
        maxfraction -= minfraction;
        sign_change = 1;
    } else {
        maxfraction += minfraction;
        sign_change = 0;
    }

    if (maxfraction == 0) { return 0; }
    while ((maxfraction >> 52) < 1) {
        maxfraction <<= 1;
        maxexp -= 1;
    }
    if (sign_change == 1) {
        z.dcast = (maxsign & SIGN_MASK) | ((maxexp << 52)& EXP_MASK )| ((maxfraction) & MAN_MASK);
    } else {
        z.dcast = (~maxsign & SIGN_MASK) | ((maxexp << 52)& EXP_MASK )| ((maxfraction) & MAN_MASK);
    }
    //printf("\n%lf - %lf = %lf\n\n", x, y, z.d);
    return z.d;

}

double multiply(double x, double y) {

    /* 3 unions for extraction and recalculation of floats */
    char_cast a, b, z;
    a.d = x;
    b.d = y;
    /* extract fractions from a and b, add the leading one */
    uint64_t afraction = (GET_MAN(a.dcast) | IMPLICIT) << 10;
    uint64_t bfraction = (GET_MAN(b.dcast) | IMPLICIT) << 11;
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
    printf("mul: %lld\n", mul);
    /* check if the passed in value is equal */
    /* if there are bits to the left of the radix pt. shift until 1.bbb */
    uint64_t zfraction0 = mul >> 64;
    uint64_t zfraction1 = mul & 0xFFFFFFFFFFFFFFFF;
    zfraction0 |= (zfraction1 != 0);

    while (1 <= (zfraction0 << 1)) {
        zfraction0 <<= 1;
        /* and add one to exponent */
        zexp--;
    }

    /* store back into unsigned int */
    printf("zfrac %llu\n", zfraction);
    printf("exp %llu\n", zexp);
    /* add back bias */
    //zexp += 1023;
    /* logical | back into the union */
    /* the masks are there in case the value is not 0 */
    z.dcast = (zsign & SIGN_MASK) | ((zexp << 52) & EXP_MASK) | ((zfraction) >> 10);
    printf("\n%lf * %lf = %lf\n\n", x, y, z.d);
    /* return the double representation */
    return z.d;
}

double _sqrt(double x){

    long i;
    double x2, y;
    const double z = 1.5F;

    x2 = x * 0.5F;
    y  = x;
    i  = * (long * ) &y;                       // evil floating point bit level hacking
    i  = 0x5fe6eb50c7b537a9 - ( i >> 1 );               // what the fuck? 
    y  = * ( double * ) &i;
    y  = y * ( z - ( x2 * y * y ) );   // 1st iteration
    y  = y * ( z - ( x2 * y * y ) );   // 2nd iteration, this can be removed
    y  = y * ( z - ( x2 * y * y ) );   // 2nd iteration, this can be removed

    printf("\nsqrt(%lf) = %lf\n\n", x, 1/y);
    return y;

}
int main() {

    //int i = 0;
    int another = 0;
    double arg = 4.2;
    double man = frexp(arg, &another);
    printf("%lf = %lf * 2 ^ %d\n", arg, man, another);
    //part3();
    add(4.5, 3.5);
    add(1.2, 3.3);

    /*    unsigned long a = rdtsc();
          for (i = 0; i < A; i++) {    
          add(4.5, 3.5);
          }
          unsigned long b = rdtsc();

          unsigned long c = rdtsc();
          for (i = 0; i < B; i++) {    
          4.5 + 3.5;
          }
          unsigned long d = rdtsc();
          unsigned long e = b - a;
          unsigned long f = d - c;
          unsigned long ticks = (e - f)/(A - B);

          subtract(4.2, 1.1);
          subtract(3.3, 1.1);
          puts("sub\n");
          a = rdtsc();
          for (i = 0; i < A; i++) {    
          subtract(3.3, 1.1);
          }
          b = rdtsc();

          c = rdtsc();
          for (i = 0; i < B; i++) {    
          3.3 - 1.1;
          }
          d = rdtsc();
          e = b - a;
          f = d - c;
          ticks = (e - f)/(A - B);

          puts("mul\n");
          rdtsc();
          a = rdtsc();
          for (i = 0; i < A; i++) {    
          multiply(2.2, 2.0);
          }
          b = rdtsc();

          c = rdtsc();
          for (i = 0; i < B; i++) {    
          2.2 * 2.0;
          }
          d = rdtsc();
          e = b - a;
          f = d - c;
          ticks = (e - f)/(A - B);

*/ 
    multiply(2.2, 2.0);
    multiply(9.0, 9.0);
    multiply(.5, .5);
    /*
       puts("sqrt");
       a = rdtsc();
       for (i = 0; i < A; i++) {    
       _sqrt(5);
       }
       b = rdtsc();

       c = rdtsc();
       for (i = 0; i < B; i++) {    
       sqrt(5);
       }
       d = rdtsc();
       e = b - a;
       f = d - c;
       ticks = (e - f)/(A - B);

    */
       _sqrt(4);
       _sqrt(5);
       
    return 0;

}
