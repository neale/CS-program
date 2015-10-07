#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//Write a C program that returns the following information about your CPU, using the CPUID assembly instruction:

static void cpuid(unsigned int *eax, unsigned int *ebx,
                  unsigned int *ecx, unsigned int *edx) {

    __asm__ __volatile__(
                        "cpuid"
                        : "=a" (*eax),
                          "=b" (*ebx),
                          "=c" (*ecx),
                          "=d" (*edx)
                        : "0"  (*eax), "2" (*ecx)
                        );
}

int main(int argc, char **argv) {

    unsigned eax;
    unsigned ebx;
    unsigned ecx;
    unsigned edx;

// Proc vendor name

    char vendor[13];
    eax = 0;

    cpuid(&eax, &ebx, &ecx, &edx);
 
    memcpy(vendor, (char*)&ebx, 4);
    memcpy(vendor + 4, (char*)&edx, 4);
    memcpy(vendor + 8, (char*)&ecx, 4);
    vendor[12] = 0;   
    
    printf("vendor: %s\n", vendor);


// L1 data cache size (with line info)

    eax = 0x80000006;
    cpuid(&eax, &ebx, &ecx, &edx);
    printf("\nL1 data cache\n");
    printf("%d\n", ecx);

// L1 instruction cache size (with line info)

    
// TLB information (any and all)

    eax = 0x02;
    //TLB info is not returned in specific byte orders
    cpuid(&eax, &ebx, &ecx, &edx);
    printf("\nTLB info\n");
    printf("%d\n", eax);    
    printf("%d\n", ebx);    
    printf("%d\n", ecx);    
    printf("%d\n", edx);    

// Memory hierarchy information


// physical address width

    eax = 80000008;
    cpuid(&eax, &ebx, &ecx, &edx);
    printf("\nphysical address width\n");
    printf("%d", eax & 0xFF);
    
// logical address width

    eax = 0;
    cpuid(&eax, &ebx, &ecx, &edx);

// number of logical CPUs



// CPU family

    eax = 0x01;
    
    cpuid(&eax, &ebx, &ecx, &edx);
   
    printf("\nstepping %d\n", eax & 0xF);
    printf("model %d\n", (eax >> 4) & 0xF);
    printf("family %d\n", (eax >> 8) & 0xF);
    printf("processor type %d\n", (eax >> 12) & 0x3);
    printf("extended model %d\n", (eax >> 16) & 0xF);
    printf("extended family %d\n", (eax >> 20) & 0xFF);



//CPU model (number and name)

    printf("\ncheck if brand string is valid\n");
    eax = 0x80000000;
    cpuid(&eax, &ebx, &ecx, &edx);
    if (eax > 0x80000004){
        printf("\nnecessary instructions included\n");
        printf("eax > 0x80000004");
    }
    else {
        printf("Nope, idiot");
    }

    eax = 0x80000002;

    /*cpuid(&eax, &ebx, &ecx, &edx);

    printf("\nCPU Brand String\n");
    printf("%s", (char*)&eax);    
    printf("%s", (char*)&ebx);    
    printf("%s", (char*)&ecx);    
    printf("%s", (char*)&edx);

    eax = 0x80000003;
    cpuid(&eax, &ebx, &ecx, &edx);
    printf("%s", (char*)&eax);    
    printf("%s", (char*)&ebx);    
    printf("%s", (char*)&ecx);    
    printf("%s", (char*)&edx);

    eax = 0x80000004;
    cpuid(&eax, &ebx, &ecx, &edx);
    printf("%s", (char*)&eax);    
    printf("%s", (char*)&ebx);    
    printf("%s", (char*)&ecx);    
    printf("%s\n", (char*)&edx);
    */

//CPU frequency

    eax = 0x16;
    
    cpuid(&eax, &ebx, &ecx, &edx);
   
    printf("\nProc frequency specs");
    printf("\nBase Frequency (MHz) : %u", eax & 0xFF);
    printf("\nMax Frequency (MHz)  : %u", ebx);
    printf("\nBus Frequency (MHz)  : %u\n", ecx);
    


//CPU features available

    return 0;
}


