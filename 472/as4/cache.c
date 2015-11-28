#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <float.h>
#include <time.h>
#include <limits.h>
#include <memory.h>
#define SIZE_ARR 2000000000
#define CPU_MHZ .9 * 1024.0 * 1024.0 /* e.g., 2.8 GHz */
#define MINBYTES (1 << 10) /* Working set size ranges from 1 KB */
#define MAXBYTES (1 << 23) /* ... up to 8 MB */
#define MAXSTRIDE 16 /* Strides range from 1 to 16 */
#define MAXELEMS MAXBYTES/sizeof(int)
int data[MAXELEMS]; /* The array we'll be traversing */


uint64_t rdtsc(void){
    unsigned a, d;
    __asm__ volatile("rdtsc" : "=a" (a), "=d" (d));
    return ((uint64_t)a) | (((uint64_t)d) << 32);;
} 
/* The test function */
void test(int elems, int stride) {
    int i, result = 0;
    volatile int sink;
    for (i = 0; i < elems; i += stride)
        result += data[i];
    sink = result; /* So compiler doesn't optimize away the loop */
}
/* Run test(elems, stride) and return read throughput (MB/s) */
double run(int size, int stride){ 
    uint64_t start_cycles, end_cycles, diff;
    int elems = size / sizeof(int);
    
    test(elems, stride); /* warm up the cache */
    start_cycles = rdtsc(); /* Read CPU cycle counter */
    test(elems, stride); /* Run test */
    end_cycles = rdtsc(); /* Read CPU cycle counter again */
    
    diff = end_cycles - start_cycles; /* Compute time */
    return (size / stride) / (diff / CPU_MHZ); /* convert cycles to MB/s */
}

int check_cache(){

    int i = 0;
    int j = 0;  

    double stride = 1024;
    int stride_inc = 4096;
    unsigned char *huge = malloc(SIZE_ARR);
    long long int a, b, c;

    float size = 0;
    double time_seconds;
    int freq = 3166000; //using this will give you time in ms
    double old_time = 0;
    double factor = 0;
    int count = 0;
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
        //printf("stride size: %d, time: %lf, factor_inc %0.3f\n", stride, time_seconds, factor);
        fprintf(stdout, "Size: %0.3fKB,\tTime: %lf ms,\tpercent: %lf\n", size, time_seconds, stride/SIZE_ARR);
        stride *= 2;
    }
    return 0;
}

int main(int argc, char **argv) {
    int size; /* Working set size (in bytes) */
    int stride; /* Stride (in array elements) */
    int i = 0; 
    /* Initialize each element in data ti 1 */
     for (i = 0; i < MAXELEMS; i++) {
        data[i] = 1;
    }

    for (size = MAXBYTES; size >= MINBYTES; size >>= 1) {
        for (stride = 1; stride <= MAXSTRIDE; stride++)
            printf("%.1lf\t", run(size, stride));
        printf("\n");
    }

    check_cache();
    return 0;
}
