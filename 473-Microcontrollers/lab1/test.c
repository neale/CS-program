#include <stdio.h>
#include <stdlib.h>

uint8_t bcdToDec(uint8_t val)
{
  return ( (val/16*10) + (val%16) );
}

int main() {

    int i = 97;
    int res = 0;
    for (;;) {
        i++;
        res = bcdToDec(i);
        printf("RES: %d\n", res);
        printf("VAL: %d\n", i);
    }
    return 0;
}
