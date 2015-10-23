#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <float.h>

typedef union {
    double d;
    uint64_t dcast;
} char_cast;

//int constexpr _pow(int base, int exp) {
//    return exp == 0 ? 1 : base * _pow(base, exp - 1);
//}

double frexp_test(double x, int *exponent) {
    
    char_cast test;
    test.d = x;

    uint64_t i = 0;
    uint64_t j = 1;
    
    uint64_t bit = 0;
    uint64_t power = 0;
    double fraction = 0;
    double frac = 0;
    uint64_t place = 1;
    double normal_mantissa = 0;
    double normal_mantissaH = 0;
    double normal_mantissaL = 0;
    uint64_t mantissa = test.dcast & 0xFFFFFFFFFFFFF;
    uint64_t mantissaL = test.dcast & 0xFFFFFF;
    uint64_t mantissaH = (test.dcast >> 24) & 0xFFFFFFF;
    uint64_t exp = (test.dcast >> 52) & 0x7FF;
    unsigned int sign = test.dcast >> 63;

    
    printf("sign = %d\n",sign);
    printf("exponent = %llu\n",exp-1023);
    printf("mantissa = %llu\n",mantissa);
    printf("mantissaH = %llu\n",mantissaH);
    printf("mantissaL = %llu\n",mantissaL);

    for (i = 27; i > 0; i--) {
        bit = (mantissaH >> i) & 0x01;
        if (bit) {
            fraction = (double) (place << j);
            frac = (double) 1 / fraction;
            normal_mantissaH += bit * frac;
        }
        printf("j               : %llu\n", j);
        printf("frac            : %.20lf\n", frac);
        j++;

    }
    printf("\n\n **** NEXT SEGMENT **** \n\n");
    for (i = 23; i > 0; i--) {
        bit = (mantissaL >> i) & 0x01;
        if (bit) {
            fraction = (double) (place << j);
            frac = (double) 1 / fraction;
            normal_mantissaL += bit * frac;
        }
        printf("j               : %llu\n", j);
        printf("frac            : %.20lf\n", frac);
        j++;

    } 
    *exponent = exp-1023;
    normal_mantissa = normal_mantissaL + normal_mantissaH + 1; 
    return normal_mantissa;
}

int main() {
      
    double this = 3232.4;
    double fuckkk;
    int shit;
    fuckkk = frexp_test(this, &shit);
    double man, fuck;
    int another;
    fuck = 3232.4;
    man = frexp(fuck, &another);
    printf("%lf = %lf * 2 ^ %d\n", this, fuckkk, shit);
    printf("%lf = %lf * 2 ^ %d\n", fuck, man, another);
    return 0;

}
