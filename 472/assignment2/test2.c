#include <limits.h>
#include <math.h>
#include <memory.h>
#include <stdint.h>
#include <stdio.h>
#include <float.h>


double myfrexp(double number, int *exp) {
  static const uint64_t mantissa_mask       = 0x000FFFFFFFFFFFFFllu;
  static const uint64_t mantissa_impliedBit = 0x0010000000000000llu;
  static const uint64_t expo_mask           = 0x7FF0000000000000llu;
  static const uint64_t expo_norm           = 0x3FE0000000000000llu;
  static const uint64_t sign_mask           = 0x8000000000000000llu;
  static const int expo_NaN = 0x07FF;
  static const int expo_Bias = 1023;

  union {
    double d;
    uint64_t u;
  } x = { number };
  uint64_t mantissa = x.u & mantissa_mask;
  int expo = (x.u & expo_mask) >> 52;

  if (expo == expo_NaN) {  // Behavior for Infinity and NaN is unspecified.
    *exp = 0;
    return number;
  }
  if (expo > 0) {
    mantissa |= mantissa_impliedBit;  // This line is illustrative, not needed.
    expo -= expo_Bias;
  }
  else if (mantissa == 0) {
    *exp = 0;
    return number;  // Do not return 0.0 as that does not preserve -0.0
  }
  else {
    // de-normal or sub-normal numbers
    expo = 1 - expo_Bias;  // Bias different when biased exponent is 0
    while (mantissa < mantissa_impliedBit) {
      mantissa <<= 1;
      expo--;
    }
  }
  *exp = expo + 1;
  mantissa &= ~mantissa_impliedBit;
  x.u = (x.u & sign_mask) | expo_norm | mantissa;
  return x.d;
}
void frexp_test(double d) {

  int i1,i2;
  double d1,d2;
  d1 = frexp(d, &i1);
  d2 = myfrexp(d, &i2);

  if (memcmp(&d1,&d2,sizeof(d1)) != 0 || (i1 != i2)) {
    printf("%a  (%a %x) (%a %x)\n", d, d1, i1, d2, i2);

  }
  else {
    printf("fucking shit");
    }
}

int main() {
  frexp_test(1.0);
  frexp_test(0.0);
  frexp_test(-0.0);
  frexp_test(DBL_MAX);
  frexp_test(-DBL_MAX);
  frexp_test(DBL_EPSILON);
  frexp_test(DBL_MIN);
  frexp_test(DBL_MIN/1024);
  frexp_test(DBL_MIN/1024/1024);
  frexp_test(INFINITY);
  //frexp_test(DBL_TRUE_MIN);
  return 0;
}
