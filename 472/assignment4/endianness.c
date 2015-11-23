#include <stdio.h>

#define BYTES   (sizeof(short) * 8)
#define SHIFT1  (0xFF << (BYTES - 8))
#define SHIFT2  (0xFF << (BYTES - 16))


typedef union {
    unsigned char p[2];
    short val;
    struct vals {
        unsigned char p_high;
        unsigned char p_low;
    } vals;

} Data;


int main(int argc, char **argv) {
    short val;
    char *p_val;
    p_val = (char *) &val;
    /*
     *    The following two lines assume big-endian
     *    Architecture to initialize the variable Val
     *    to 0x1234.
     *              */
    p_val[0] = 0x12;
    p_val[1] = 0x34;
    printf("Kevins example: %x\n", val);

    #if defined(__BYTE_ORDER__)&&(__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
         p_val[0] = 0x12;
         p_val[1] = 0x34;
         printf("Big Endian: %x\n", val);
    #elif defined(__BYTE_ORDER__)&&(__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__)    
        p_val[0] = 0x34;
        p_val[1] = 0x12;
        printf("Little Endian: %x\n", val);
    #else 
        print("how did you get here\n");
    #endif


    Data order;
    short temp = 0x1234;
    order.p[0] = (temp & SHIFT1) >> (BYTES - 8);
    order.p[1] = (temp & SHIFT2) >> (BYTES - 16);
    printf("Vals ordered: %x %x\n", order.p[0], order.p[1]);
    printf("short val: %x", order.val);
   

    
     
    return 0;
}
