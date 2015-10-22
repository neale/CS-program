#include <stdio.h>
#include <stdint.h>

typedef union {
  float f;
  struct {
    unsigned int mantisa : 23;
    unsigned int exponent : 8;
    unsigned int sign : 1;
  } parts;
} double_cast;

typedef union {
    double d;
    uint64_t dcast;
} char_cast;

double frexp_test(double x, int *exponent) {
   
    int i = 0;
    int bias = 1023; 
    char_cast test;
    test.d = x;
    printf("test uint64: %llu\n", test.dcast);
    uint64_t mantissa = test.dcast & 0xFFFFFFFFFFFFF;
    uint64_t exp = (test.dcast >> 52) & 0x7FF;
    unsigned int sign = test.dcast >> 63;
    printf("sign = %d\n",sign);
    printf("exponent = %llu\n",exp-1023);
    printf("mantissa = %llu\n",mantissa);
    for (i = 53; i > 0; i--) {
        //start at end, for each bit multiply by 2^-i
        (mantissa >> i)
    return 1;
}

int main() {
  double_cast d1;
  d1.f = 0.15625;
  printf("sign = %u\n",d1.parts.sign);
  printf("exponent = %u\n",d1.parts.exponent);
  printf("mantisa = %u\n",d1.parts.mantisa);

  double this = 3232.4;
  int shit;
  frexp_test(this, &shit);
  return 1; 
  char_cast d2;
  d2.d = 0.15625;
  printf("chars = %s\n",d2.bin);
  unsigned int fart = (d2.dcast >> 53) & 0x7FF;
  printf("fart : %u\n", fart);
  return 0;

}
