#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>

int main() {
    double number = 34.6;
    uint64_t bits = *((uint64_t*)&number);
    uint64_t mantissa1 = bits & ((1<<52)-1);
    unsigned exponent1 = (bits>>52) & 0x7FF;
    unsigned sign1 = bits>>63;
    printf("%c1.%" PRIu64 "e%u", sign1?'-':'+', mantissa1, exponent1);

/*
    double num = 1.1;
    uint64_t bytes = *((uint64_t*)&num);
    uint64_t mantissa = (bytes & 52) - 1);
    unsigned exponent = ((bytes >> 52) & 0x7FF);
    unsigned sign = bytes >> 63; 
    printf("\n\n%c1.%" PRIu64 " * 2^%u", sign?'-':'+', mantissa, exponent-1023);
*/
    return 0;
}
