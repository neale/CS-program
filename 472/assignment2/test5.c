#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <float.h>
#include <strings.h>

#define GET_EXP(x) ((x >> 52) & 0x7FF)
#define GET_MAN(x)  (x & 0xFFFFFFFFFFFFF)
#define GET_SIGN(x) (x >> 63)
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
    int i = 0;
    int exponent;
    double mantissa;
    double result;
    pmem test;
    test.d = 1.55;
    puts("\nPART 3\n\n");
    puts("DOUBLES :\n");
    printf("Value in union : %lf\n", test.d);
    result = frexp(test.d, &exponent);
    printf("Mantissa :       %lf\n", result);
    int sign = (test.d > 0) ? 1 : ((test.d < 0) ? -1 : 0);
    printf("Sign :           %d\n", sign);
    printf("Exponent :       %d\n\n", exponent);
    puts("LONGS\n");
    printf("Value :          %ld\n", test.l); 
    sign = (test.l > 0) ? 1 : ((test.l < 0) ? -1 : 0);
    printf("Sign :           %d\n", sign);
    puts("\nChar Array : \n");
    printf("Hex :            "); 
    for (i = 0; i < sizeof(double); ++i) {    
        printf("%x", test.c[i]);
    }
    unsigned char ctest[8] = {0};
    printf("\nChar :           "); 
    for (i = 0; i < 8; i++) {
        ctest[i] = (test.u >> (i*8)) & 0xFF;
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

    printf("total : %llu\n",test.dcast);
    uint64_t exp = (test.dcast >> 52) & 0x7FF;
    uint64_t sign = test.dcast >> 63;
    uint64_t mantissa = test.dcast & 0xFFFFFFFFFFFFF;
    uint64_t exp_bias = exp - 1023 + 1; 
    uint64_t zero = 0x7FF;
    *exponent = exp_bias;
    //thing we want to plug into the original uint64_t 
    test.dcast &= ~(zero << 52);
    printf("zero        : %llu\n", zero);
    printf("exp_bias    : %llu\n", exp_bias);
    printf("zeroed test : %llu\n", test.dcast);
    test.dcast |= (exp_bias << 52);
    printf("added test : %llu\n", test.dcast);
    printf("added fuckery : %.20lf\n", test.d);
    uint64_t new = (sign << 63 | exp_bias << 52 | mantissa);
    printf("fuck : %.20lf\n", (double) new);

    return test.d;
}

double frexp_test(double x, int *exponent) {

    char_cast test;
    if (x == 0) {
        return 0;
    } 
    else if (isnan(x) || isinf(x)) {
        return x;
    }
    test.d = x;

    uint64_t i = 0;
    uint64_t j = 1;

    uint64_t bit = 0;
    double fraction = 0;
    double frac = 0;
    uint64_t place = 1;
    double normal_mantissa = 0;
    uint64_t mantissa = GET_MAN(test.dcast);
    uint64_t exp = GET_EXP(test.dcast);
    printf("manta : %llu\n",mantissa);
    mantissa += 1;
    for (i = 51; i > 0; i--) {
        bit = (mantissa >> i) & 0x01;
        printf("bit : %llu\n",bit);

        printf("j : %llu\n",j);
        fraction = (double) (place << j);
        frac = (double) 1 / fraction;
        normal_mantissa += bit * frac;
        printf("normal_mantissa : %lf\n",normal_mantissa);
        j++;

    } 
    *exponent = exp-1023+1;
    return ++normal_mantissa/2;
}

double add(double x, double y) {

    char_cast a, b;
    a.d = x;
    b.d = y;
    uint64_t afraction = GET_MAN(a.dcast);
    uint64_t bfraction = GET_MAN(b.dcast);
    uint64_t aexp = GET_EXP(a.dcast) + 1 - 1023;
    uint64_t bexp = GET_EXP(b.dcast) + 1 - 1023;
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

    return 0;
}

double subtract(double x, double y) {

    char_cast a, b, z;
    a.d = x;
    b.d = y;
    uint64_t afraction = GET_MAN(a.dcast);
    uint64_t bfraction = GET_MAN(b.dcast);
    uint64_t aexp = GET_EXP(a.dcast) + 1 - 1023;
    uint64_t bexp = GET_EXP(b.dcast) + 1 - 1023;
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
    if (minsign == maxsign) {
        maxfraction -= minfraction;
    } else {
        maxfraction += minfraction;
    }
    
    if (maxfraction == 0) { return 0; }
    uint64_t test = maxfraction; 
    double count = 0;
    while (test > 1) {
        test = test >> 1;
        count++;
    }
    uint64_t exp = count;
    maxfraction *= pow(2, -count);
    if (127 + count > 0) {
        z.dcast |= (0llu << 63llu) | (exp << 52) | (maxfraction);
    } else {
        z.dcast |= (1llu << 63llu) | (exp << 52) | (maxfraction);
    }
    printf("\nsign     : %u\n", maxsign );
    printf("exponent : %llu\n", exp );
    printf("mantissa : %llu\n", maxfraction );
    printf("xoperand : %llu\n", xoperand );
    return z.d;

}

double multiply(double x, double y) {

    char_cast a, b, c, z;
    a.d = x;
    b.d = y;
    int i = 0;
    uint64_t afraction = GET_MAN(a.dcast);
    uint64_t bfraction = GET_MAN(b.dcast);
    uint64_t aexp = GET_EXP(a.dcast) + 1 - 1023;
    uint64_t bexp = GET_EXP(b.dcast) + 1 - 1023;
    unsigned int asign = GET_SIGN(a.dcast);
    unsigned int bsign = GET_SIGN(b.dcast);
    uint64_t zsign = (asign + bsign) % 2;
    uint64_t zexp = aexp + bexp;
    c.d = afraction * bfraction;
    uint64_t zfraction = c.dcast;
    printf("afrac : %llu\n", afraction);
    printf("bfrac : %llu\n", bfraction);
    printf("zfrac : %lf\n", c.d);
    while ((zfraction >> 53) > 1) {
        zfraction >>= 1;
        zexp += 1;
    }
    
    printf("zexp : %llu\n", zexp);
    printf("zfrac : %llu\n", zfraction);
    printf("zsign : %llu\n", zsign);
    z.dcast |= (zsign << 63) | (zexp << 52) | (zfraction);
    printf("z float: %lf\n", z.d);
    return z.d;
}

int main() {

    double this = -3234.4;
    double fuckkk;
    double man, fuck, damn;
    int shit;
    int another, one_more;
    damn = my_frexp(this, &one_more);
    fuckkk = frexp_test(this, &shit);
    fuck = -3234.4;
    man = frexp(fuck, &another);
    printf("%lf = %lf * 2 ^ %d\n", this, damn, one_more);
    printf("%lf = %lf * 2 ^ %d\n", this, fuckkk, shit);
    printf("%lf = %lf * 2 ^ %d\n", fuck, man, another);
    add(4.5, 3.5);
    part3();
    double sub = subtract(1.5, .5);
    printf("\nsub : %lf\n", sub);
    double one = 1.5;
    double two = 1.5;
    multiply(one, two);
    return 0;

}
