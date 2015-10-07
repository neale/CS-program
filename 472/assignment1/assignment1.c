#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define false 0
#define true 1
#define is_valid_leaf 0

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

    int i = 0;
    unsigned eax;
    unsigned ebx;
    unsigned ecx;
    unsigned edx;
    unsigned int cache_level = 0;
    unsigned int ctype = 0;
// Proc vendor name

    char vendor[13];
    eax = 0;

    cpuid(&eax, &ebx, &ecx, &edx);
 
    memcpy(vendor, (char*)&ebx, 4);
    memcpy(vendor + 4, (char*)&edx, 4);
    memcpy(vendor + 8, (char*)&ecx, 4);
    vendor[12] = 0;   
    
    printf("vendor: %s\n", vendor);

    int cache_size = 0;

    char* types[4] = {"Null", "Data", "Instruction", "Unified"};

// L1 instruction cache size (with line info)
    for(i = 0; i < 4; i++) {

        ecx = i;
        eax = 0x04;

        cpuid(&eax, &ebx, &ecx, &edx);
        cache_level = (eax >> 5) & 0x7;
        ctype = (eax & 0xF);
        cache_size = (((ebx >> 22) & 0x3FF) + 1) * (((ebx >> 12) & 0x3FF)+1) * (ebx & 0xFFF) * (ecx + 1);
        switch(cache_level) {
        
            case(0):
        
                printf("no more levels\n");
                break;
        
            case(1):
                
                printf("L%u %s cache\n", cache_level, types[ctype]);
                printf("system line size: %u\n", ebx & 0xFF);
                printf("line partitions: %u\n",((ebx>>12) & 0x3FF) + 1);
                printf("associativity: %u\n\n", (ebx >> 22));
                printf("cache size: %d", cache_size);
                break;

            case(2):
                
                printf("L%u %s cache\n", cache_level, types[ctype]);
                printf("system line size: %u\n", ebx & 0xFFF);
                printf("line partitions: %u\n",((ebx>>12)+1) & 0x3FF);
                printf("associativity: %u\n\n", (ebx >> 22));
                printf("cache size: %d", cache_size);

                break;
            case(3):
                
                printf("L%u %s cache\n", cache_level, types[ctype]);
                printf("system line size: %u\n", ebx & 0xFFF);
                printf("line partitions: %u\n",((ebx>>12)+1) & 0x3FF);
                printf("associativity: %u\n\n", (ebx >> 22));
                printf("cache size: %d", cache_size);

                break;
            default:
                break;
        }
    }
// TLB information (any and all)

    eax = 0x02;
    //TLB info is not returned in specific byte orders
    cpuid(&eax, &ebx, &ecx, &edx);
    int size = (sizeof(eax) + sizeof(ebx) + sizeof(ecx) + sizeof(edx));
    printf("size: %d\n", size);
    int tlb = eax;
    int hex_code = 0;
    int j = 0; 
    for (i = 0; i < size; i++) {
        hex_code = (tlb >> 8*j) & 0xFF;
        switch(hex_code) {
            case(0x01):
                printf("TLB Instruction TLB: 4 KByte pages," \
                       "4-way set associative, 32 entries\n"
                );
                j++;
                break;
            case(0x02):
                printf("TLB Instruction TLB: 4 MByte pages, fully" \
                        "associative, 2 entries"
                );
                j++;
                break;
             
            case(0x76):
                printf("TLB Instruction TLB: 2M/4M pages," \
                        "fully associative, 8 entries\n"
                );
                tlb = ebx;
                j++;
                break;
            case(0x03):
                printf("TLB Data TLB: 4 KByte pages," \
                       "4-way set associative, 64 entries\n"
                );
                j++;
                break;
            case(0x04):
                printf("Data TLB: 4 MByte pages, 4-way set" \
                        "associative, 8 entries"
                );
                j++;
                break;
            case(0x05):
                printf("Data TLB1: 4 MByte pages, 4-way set" \
                        "associative, 32 entries"
                );
                j++;
                break;

            case(0x0B):
                printf("Instruction TLB: 4 MByte pages," \
                        "4-way set associative, 4 entries"
                );
                j++;
                break;
            
            case(0x4F):
                printf("Instruction TLB: 4 KByte pages, 32 entries"
                );
                j++;
                break;
                          
            case(0x63):
                printf("TLB Data TLB: 1 GByte pages," \
                       "4-way set associative, 4 entries\n"
                );
                j++;
                break;
           case(0xF0):
                printf("64-Byte prefetching\n");
                j++;
                break;
            case(0xB5):
                printf("TLB Instruction TLB: 4KByte pages," \
                       "8-way set associative, 64 entries\n"
                );
                j++;
                break;
            case(0xFF):
                printf("Instruction TLB: 4KByte pages," \
                       "8-way set associative, 64 entries\n"
                );
                j++;
                break;
            case(0xC3):
                printf("Shared 2nd-Level TLB: 4 KByte /2 MByte pages," \
                       "6-way associative, 1536 entries. Also 1GBbyte" \
                       "pages, 4-way, 16 entries.\n"
                );
                tlb = 0;
                break;
            case(0x00):
                j++;
                break;
            default:
                break;
        }
    }

    printf("ECX: Null byte");

// Memory hierarchy information


// physical address width

    eax = 0x80000008;
    cpuid(&eax, &ebx, &ecx, &edx);
    printf("\nphysical address width: ");
    printf("%u", eax & 0xFF);

    printf("\nvirtual address width: ");
    printf("%u\n", (eax >> 8) & 0xFF); 
    
// logical address width


// number of logical CPUs



// CPU family

    eax = 0x01;
    
    cpuid(&eax, &ebx, &ecx, &edx);
   
    printf("\nstepping %u\n", eax & 0xF);
    printf("model %u\n", (eax >> 4) & 0xF);
    printf("family %u\n", (eax >> 8) & 0xF);
    printf("processor type %u\n", (eax >> 12) & 0x3);
    printf("extended model %u\n", (eax >> 16) & 0xF);
    printf("extended family %u\n", (eax >> 20) & 0xFF);



//CPU model (number and name)

    printf("\ncheck if brand string is valid\n");
    eax = 0x80000000;
    cpuid(&eax, &ebx, &ecx, &edx);
    if (eax > 0x80000004) {
        printf("\nnecessary instructions included\n");
        printf("eax > 0x80000004");
    }
    else {
        printf("Nope, idiot");
    }

    eax = 0x80000002;

//CPU frequency

    eax = 0x16;
    
    cpuid(&eax, &ebx, &ecx, &edx);
   
    printf("\nProc frequency specs");
    printf("\nBase Frequency (MHz) : %u", eax & 0xFF);
    printf("\nMax Frequency (MHz)  : %u", ebx);
    printf("\nBus Frequency (MHz)  : %u", ecx);
    


//CPU features available
    for (i = 0; i < 7; i++) {
        
        ecx = i;
        eax = 0x07;
        cpuid(&eax, &ebx, &ecx, &edx);
        printf("ECX leaf: %d\n", i);
        
        printf("max input value %u\n", eax & 0xFFFFFFFF);  
        if (ebx & 0x01) {
            printf("Supports RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE\n");
        } else {
            printf("RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE unsupported\n");
        }
        if ((ebx >> 1) & 0x01) {
            printf("ia32_tsc_adjust msr is supported\n");
        } else {
            printf("ia32_TSC_ADJUST MSR unsupported\n");
        }
        printf("BMI1: %u\n", (ebx >> 3) & 0x01);
        printf("HLE: %u\n", (ebx >> 4) & 0x01);
        printf("AVX2: %u\n", (ebx >> 4) & 0x01);

        if ((ebx >> 7) & 0x01) {
            printf("Supports Supervisor-Mode Execution Prevention\n");
        } else {
            printf("Supervisor-Mode Execution Prevention unsupported\n");
        }
        
        printf("BMI2: %u\n", (ebx >> 8) & 0x01);
        
        if ((ebx >> 9) & 0x01) {
            printf("Supports Enhanced REP MOVSB/STOSB\n");
        } else {
            printf("Enhanced REP MOVSB/STOSB unsupported\n");
        }
        
        if ((ebx >> 10) & 0x01) {
            printf("supports INVPCID instruction\n");
        } else {
            printf("INVPCID unsupported\n");
        }
        
        printf("RTM: %u\n", (ebx >> 11) & 0x01);
        
        if ((ebx >> 12) & 0x01) {
            printf("Supports PQM capability\n");
        } else {
            printf("RQM supported\n");
        }
        
        if ((ebx >> 13) & 0x01) {
            printf("FPU CS and FPU DS values deprecated\n");
        } else {
            printf("FPU CS and FPU DS values in tact\n");
        }
        
        if ((ebx >> 14) & 0x01) {
            printf("Supports Intel Memory Protection\n");
        } else {
            printf("Intel memory Protection unsupported\n");
        }
        
        if ((ebx >> 15) & 0x01){
            printf("PQE supported\n");
        } else {
            printf("PQE Unsupported\n");
        }
        
        printf("RDSEED: %u\n", (ebx >> 18) & 0x01);
        printf("ADX: %u\n", (ebx >> 19) & 0x01);
        if ((ebx >> 20) & 0x01) {
            printf("SMAP supported\n");
        } else {
            printf("SMAP unsupported\n");
        }    
        printf("Intel Processor Trace: %u\n", (ebx >> 25) & 0x01);
        
        printf("PREFETCHWT1: %u\n", (ecx & 0x01));
        
        if ((ecx >> 3) & 0x01) {
            printf("PKU supported\n");
        } else {
            printf("PKU Unsupported\n");
        }

        if ((ecx >> 4) & 0x01) {
            printf("OSPKE, has CR4 and RDPKRU/WRPKRU instructions\n");
        } else {
            printf("OSPKE unsupported\n");
        }
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


    return 0;
}

