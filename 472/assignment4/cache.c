#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <float.h>
#include <time.h>
#include <limits.h>
#include <memory.h>
/* real big array, larger than cache */
#define SIZE_ARR 2000000000

/* timing routine */
uint64_t rdtsc(void){
    unsigned a, d;
    __asm__ volatile("rdtsc" : "=a" (a), "=d" (d));
    return ((uint64_t)a) | (((uint64_t)d) << 32);;
} 
int check_cache(){

    int i = 0;
    int j = 0;  
    
    double stride = 1024;                       // Start with a single KB
    int stride_inc = 4096;                      // Increment with 4KB
    unsigned char *huge = malloc(SIZE_ARR);     // Huge array
    long long int a, b, c;                      // timing variables

    float size = 0;
    double time_seconds;
    int freq = 3166000; //using this will give you time in ms
    double old_time = 0;
    double factor = 0;
    int count = 0;
    /* The loop will touch every operation within the array
     * The segment touched varied by the size of stride
     * The stride is doubled every iteration
     * The increase in time should be linear until the stride is larger than a cache
     * Then there will be a noticible jump in time because of cache overflow
     */
    while (stride < SIZE_ARR) {
        a = rdtsc();
        count = 0;
        for(i = 0; i < stride; i++) {
            huge[i]++;
            count++;
        }
        b = rdtsc();
        c = b - a;
        old_time = time_seconds;
        time_seconds = (double) c / freq;
        size = (float) stride/1024;
        factor = time_seconds/old_time;
        fprintf(stdout, "Size: %0.3fKB,\tTime: %lf ms,\tpercent: %lf\n", size, time_seconds, stride/SIZE_ARR);
        stride *= 2;
    }
    return 0;
}

/* simply checks the cache */
int main(int argc, char **argv) {
    check_cache();
    return 0;
}
