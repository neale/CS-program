#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <math.h>

#define N_BITS 64 // word size
#define N_BITS_EXPONENT 11 
#define N_BITS_MANTISSA 53

union float_on{
    struct {
        unsigned int mantissa : 23;
        unsigned int exponent : 8;
        unsigned int sign : 1;
    } raw;
    float f;
} flow;

union check_my_dubs {
    struct {
        uint64_t mantissa     : 52;
        unsigned int exponent : 11;
        unsigned int sign     : 1;
    } raw;
    double d;
} check_em;


union dub {
    double value;
    char mantissa [7];
    char exponent [2];
    char sign     [1];
    char bytes[sizeof (double)];
};

void printbits(unsigned char v) {
  int i; // for C89 compatability
  for(i = 7; i >= 0; i--) putchar('0' + ((v >> i) & 1));
}
int digits(uint64_t num) {
    uint64_t sum = num;
    int digits = 0;
    int i = 0;
    while (sum != 0) {
        sum /= 10;
        digits++;
    }
    return digits;
}

int main() {

    int i = 0;
    int fb = 127;
    int db = 1023;
    puts("\n\n******* UNION MEM *******\n");
    printf("sign\texponent\tmantissa\tbias\n");
    flow.f = 1.1;
    /*printf("%u\t%u\t\t%u\t\t%d\n",
            flow.raw.sign,
            flow.raw.exponent,
            flow.raw.mantissa,
            fb); */
    check_em.d = 1.1;
    uint64_t dmantissa = check_em.raw.mantissa;
    unsigned dexponent = check_em.raw.exponent;
    unsigned sign = check_em.raw.sign;
    int nums = digits(dmantissa);
    uint64_t factor = 10;
    for(i = 0; i < nums-1; i++) {
        factor *= 10;
    }
    uint64_t mantissa_dec = (uint64_t)check_em.raw.mantissa/(uint64_t)factor;
    dmantissa = mantissa_dec + 1;

    printf("%u\t%u\t\t%" PRIu64 "\t%d\n",
            check_em.raw.sign,
            dexponent,
            dmantissa,
            db); 
    printf("mantissa : %llu\n", check_em.raw.mantissa);  
    printf("factor:    %llu\n", factor);
    printf("mantissa dec: %llu\n", mantissa_dec);
    double test_value = 1.1;
    union dub src, dest;
    union dub full_test_src, full_test_dest;
    
    full_test_src.value = test_value;
    memcpy(full_test_src.mantissa, full_test_dest.mantissa, 7);
    memcpy(full_test_src.exponent, full_test_dest.exponent, 2);
    memcpy(full_test_src.sign, full_test_dest.sign, 1);
    
    printf("dest value : %x\n", (unsigned int)full_test_dest.value);
    printf("dest mantissa : %x\n", (unsigned int)full_test_dest.mantissa);
    printf("dest exponent : %x\n", (unsigned int)full_test_dest.exponent);
    printf("dest sign : %x\n", (unsigned int)full_test_dest.sign);
    
    src.value = test_value;
    memcpy(dest.bytes, src.bytes, sizeof(dest.bytes));
    printf("dest value : %lf\n", dest.value);
    printf("dest bytes : %x\n", (unsigned int)dest.bytes);
    
    unsigned long long untest = (unsigned long long)(dest.bytes);
    printf("mantissa : %llu\n", (untest & (1 << 52)-1));
    printf("exponent : %llu\n", (untest >> 52)&0x7FF);
    printf("sign : %llu\n", untest >> 63);
    //printf("%lf\n"(double)&
   
   
   
   
    double param = 1.1;
    double res = 0;
    int exp = 0;
    res = frexp(param, &exp);
    printf("%f = %f * 2^%d\n", param, res, exp);

    return 0;
}
