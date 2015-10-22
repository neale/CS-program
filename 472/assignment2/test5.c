#include <stdio.h>
#include <stdint.h>
#include <math.h>

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

    int i = 0;
    uint64_t j = 1;
    uint64_t bit = 0;
    uint64_t power = 0;
    double fraction = 0;
    double frac = 0;
    double normal_mantissa = 0;
    uint64_t mantissa = test.dcast & 0xFFFFFFFFFFFFF;
    uint64_t exp = (test.dcast >> 52) & 0x7FF;
    unsigned int sign = test.dcast >> 63;

    printf("sign = %d\n",sign);
    printf("exponent = %llu\n",exp-1023);
    printf("mantissa = %llu\n",mantissa);

    for (i = 51; i >= 0; i--) {
        bit = (mantissa >> i) & 0x01;
        if (bit) {
            power = (1 << j);
            fraction = (double) power;
            frac = (double) 1./fraction;
            normal_mantissa += bit * frac;
        }
        
        printf("i               : %d\n", i);
        printf("j               : %llu\n", j);
        printf("bit             : %llu\n", bit);
        printf("power           : %llu\n", power);
        printf("fraction        : %lf\n", fraction);
        printf("frac            : %lf\n", frac);
        printf("normal_mantissa : %lf\n\n", normal_mantissa);
        j++;
    }
    printf("normalized mantissa : %lf\n", 1+normal_mantissa);
    return 1;
}

int main() {
  
  double this = 3232.4;
  int shit;
  frexp_test(this, &shit);
  char_cast d2;
  double man, fuck;
  int another;
  fuck = 4.5;
  man  = frexp(fuck, &another);
    printf("%lf = %lf * 2 ^ %d\n", fuck, man, another);
  return 0;

}
