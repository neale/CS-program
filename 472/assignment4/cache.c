#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <float.h>
#include <time.h>
#include <limits.h>
#include <memory.h>


uint64_t rdtsc(void){
    unsigned a, d;
    __asm__ volatile("rdtsc" : "=a" (a), "=d" (d));
    return ((uint64_t)a) | (((uint64_t)d) << 32);;
} 

int check_cache(){

    int i = 0;
    int j = 0;  
    int size_of_array = 1024 * 1024;
    unsigned char buffer[size_of_array];
    int cycles = sizeof(buffer)/sizeof(buffer[0]);
    long long int a, b, c;
    FILE *fp;
    fp = fopen("output.txt", "w");
    if (fp == NULL){
        printf("File does not exists \n");
        return 1;
    }
    float size = 0;
    double time_seconds;
    int freq = 3166000; //using this will give you time in ms
    for(i = 0; i < cycles; i += 1024) {
        a = rdtsc();
        for(j = 0; j < i; j++) {
            buffer[j]++;
        }
        b = rdtsc();
        c = b - a;
        time_seconds = (double) c / freq;
        size = (float) i / 1024;
        fprintf(fp, "Size: %0.3fKB, Time: %lf ms\n", size, time_seconds);
    }
    fclose(fp);
    return 0;
}

int main(int argc, char **argv) {

    check_cache();
    return 0;
}
