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
    unsigned int max_instruction = 0;
/* Get max instruction */

    eax = 0x00;
    cpuid(&eax, &ebx, &ecx, &edx);
    max_instruction = eax;
    printf("\nMax Instruction Value Supported: %x\n\n", eax);

/* Proc vendor name */

    printf("\n********\t Processor Vendor Name \t********\n\n");
    char vendor[13];
    eax = 0;

    cpuid(&eax, &ebx, &ecx, &edx);
 
    memcpy(vendor, (char*)&ebx, 4);
    memcpy(vendor + 4, (char*)&edx, 4);
    memcpy(vendor + 8, (char*)&ecx, 4);
    vendor[12] = 0;   
    
    printf("vendor: %s\n\n", vendor);

    int cache_size = 0;

    char* types[4] = {"Null", "Data", "Instruction", "Unified"};

// CPU family
   
    unsigned int processor = 0;
    
    printf("********\t CPU Family Information \t********\n\n");
    eax = 0x01;
    
    if (0x01 <= max_instruction) {
        
        cpuid(&eax, &ebx, &ecx, &edx);
       
        printf(" \nEAX : %x\n\n", eax);
        printf("\nStepping :%u\n", eax & 0xF);
        printf("Model :%u\n", (eax >> 4) & 0xF);
        printf("Family ID :%u\n", (eax >> 8) & 0xF);
        processor = (eax >> 12) & 0x3;
        printf("Processor Type :%u\n", processor);
        switch(processor) {
            case(0b00):
                printf("Original OEM Processor\n");
                break;
            case(0b01):
                printf("Intel OverDrive® Processor");
                break;
            case(0b10):
                printf("Dual processor (not applicable to Intel486 processors");
                break;
            case(0b11):
                printf("Intel reserved");
                break;
        }
        printf("Extended Model ID :%u\n", (eax >> 16) & 0xF);
        printf("Extended Family ID :%u\n", (eax >> 20) & 0xFF);

        printf("Brand Index : %u\n", ebx & 0xFF);
        printf("CFLUSH cache size : %u\n", (ebx >> 8) & 0xFF);

        printf("\n**Features Supported**\n\n");
     
        if ((ecx >> 30) & 0x01) {
            printf("RDRAND\n");
        }

        if ((ecx >> 29) & 0x01) {
            printf("F16C\n");
        }

        if ((ecx >> 28) & 0x01) {
            printf("AVX\n");
        }

        if ((ecx >> 27) & 0x01) {
            printf("OSXSAVE\n");
        }

        if ((ecx >> 26) & 0x01) {
            printf("XSAVE\n");
        }

        if ((ecx >> 25) & 0x01) {
            printf("AESNI\n");
        }

        if ((ecx >> 24) & 0x01) {
            printf("TSC-Deadline\n");
        }

        if ((ecx >> 23) & 0x01) {
            printf("POPCNT\n");
        }
        
        if ((ecx >> 22) & 0x01) {
            printf("MOVBE\n");
        }
        
        if ((ecx >> 21) & 0x01) {
            printf("x2APIC\n");
        }
        
        if ((ecx >> 20) & 0x01) {
            printf("SSE4_2\n");
        }
        
        if ((ecx >> 19) & 0x01) {
            printf("SSE4_1\n");
        }
        
        if ((ecx >> 18) & 0x01) {
            printf("DCA — Direct Cache Access\n");
        }

        if ((ecx >> 17) & 0x01) {
            printf("PCID — Process-context Identifiers\n");
        }
       
        if ((ecx >> 15) & 0x01) {
            printf("PDCM — Perf/Debug Capability MSR\n");
        }
        
        if ((ecx >> 14) & 0x01) {
            printf("xTPR Update Control\n");
        }
        if ((ecx >> 13) & 0x01) {
            printf("CMPXCHG16B\n");
        }

        if ((ecx >> 12) & 0x01) {
            printf("FMA — Fused Multiply Add\n");
        }

        if ((ecx >> 11) & 0x01) {
            printf("SDBG\n");
        }

        if ((ecx >> 10) & 0x01) {
            printf("CNXT-ID — L1 Context ID\n");
        }

        if ((ecx >> 9) & 0x01) {
            printf("SSSE3 — SSSE3 Extensions\n");
        }

        if ((ecx >> 8) & 0x01) {
            printf("TM2 — Thermal Monitor 2\n");
        }

        if ((ecx >> 7) & 0x01) {
            printf("EIST — Enhanced Intel SpeedStep® Technology\n");
        }
        
        if ((ecx >> 6) & 0x01) {
            printf("SMX - Safe Mode Extensions\n");
        }

        if ((ecx >> 5) & 0x01) {
            printf("VMX — Virtual Machine Extensions\n");
        }

        if ((ecx >> 4) & 0x01) {
            printf("DS-CPL — CPL Qualified Debug Store\n");
        }

        if ((ecx >> 3) & 0x01) {
            printf("MONITOR — MONITOR/MWAIT\n");
        }


        if ((ecx >> 2) & 0x01) {
            printf("DTES64 — 64-bit DS Area\n");
        }


        if ((ecx >> 1) & 0x01) {
            printf("PCLMULQDQ — Carryless Multiplication\n");
        }


        if ((ecx >> 0) & 0x01) {
            printf("SSE3 Extensions\n");
        }
    } else {
        printf("Leaf 2 Not Supported");
    }

// L1 instruction cache size (with line info)
    
    printf("\n********\t Memory Heirarchy \t********\n\n");
    if (0x04 <= max_instruction) {
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
                    printf("system line size: %u\n", (ebx & 0xFF) + 1);
                    printf("line partitions: %u\n",((ebx>>12) & 0x3FF) + 1);
                    printf("associativity: %u\n", (ebx >> 22) + 1);
                    printf("cache size: %d\n\n", cache_size);
                    break;

                case(2):
                    
                    printf("L%u %s cache\n", cache_level, types[ctype]);
                    printf("system line size: %u\n", (ebx & 0xFFF) + 1);
                    printf("line partitions: %u\n",((ebx>>12) & 0x3FF) + 1);
                    printf("associativity: %u\n", (ebx >> 22) + 1);
                    printf("cache size: %d\n\n", cache_size);

                    break;

                case(3):
                    
                    printf("L%u %s cache\n", cache_level, types[ctype]);
                    printf("system line size: %u\n", (ebx & 0xFFF) + 1);
                    printf("line partitions: %u\n",((ebx>>12) & 0x3FF) + 1);
                    printf("associativity: %u\n", (ebx >> 22) + 1);
                    printf("cache size: %d\n\n", cache_size);

                    break;
                default:
                    break;
            }
        }
    } else {
        printf("Deterministic Cache Leaf Not Supported\n");
    }

// TLB information (any and all)
    
    printf("\n********\t TLB Information \t********\n\n");
    
    unsigned int tlb = 0;
    unsigned int hex_code = 0;
    eax = 0x02;
    
    if (0x02 <= max_instruction) {
    //TLB info is not returned in specific byte orders
        
        cpuid(&eax, &ebx, &ecx, &edx);
        
        tlb = eax;
        unsigned int tlb_data[4] = {eax, ebx, ecx, edx};
        /* loops enough through all four registers */
        for (i = 0; i < 4; i++) {
            
            tlb = tlb_data[i];
            printf("Register map : %x\n\n", tlb); 
            
            /* loops each individual one */
            for(int k = 0; k < sizeof(tlb); k++) { 
                
                hex_code = (tlb >> 8*k) & 0xFF;
                
                switch(hex_code) {


                    case(0x01):
                        if ((tlb & 0xF) == 0x1) {
                            printf("ignore 01 byte at least significant bit position\n");
                            break;
                        } else {
                            printf("TLB Instruction TLB: 4 KByte pages," \
                                   "4-way set associative, 32 entries\n"
                            );
                        }
                        break;
                    
                    case(0x02):
                        printf("TLB Instruction TLB: 4 MByte pages, fully" \
                               "associative, 2 entries\n"
                        );
                        break;
                     
                    case(0x76):
                        printf("TLB Instruction TLB: 2M/4M pages," \
                                "fully associative, 8 entries\n"
                        );
                        break;
                    case(0x03):
                        printf("TLB Data TLB: 4 KByte pages," \
                               "4-way set associative, 64 entries\n"
                        );
                        break;
                    case(0x04):
                        printf("Data TLB: 4 MByte pages, 4-way set" \
                                "associative, 8 entries\n"
                        );
                        break;
                    case(0x05):
                        printf("Data TLB1: 4 MByte pages, 4-way set" \
                                "associative, 32 entries\n"
                        );
                        break;

                    case(0x0B):
                        printf("Instruction TLB: 4 MByte pages," \
                                "4-way set associative, 4 entries\n"
                        );
                        break;
                    
                    case(0x4F):
                        printf("Instruction TLB: 4 KByte pages, 32 entries\n"
                        );
                        break;
                                  
                    case(0x63):
                        printf("TLB Data TLB: 1 GByte pages," \
                               "4-way set associative, 4 entries\n"
                        );
                        break;
                   
                    case(0xF0):
                        printf("64-Byte prefetching\n");
                        break;
             
                    case(0xB5):
                        printf("TLB Instruction TLB: 4KByte pages," \
                               "8-way set associative, 64 entries\n"
                        );
                        break;
             
                    case(0xFF):
                        printf("CPUID leaf 2 does not report cache" \
                               "descriptor information,\n"
                        );
                        break;
             
                    case(0xC3):
                        printf("Shared 2nd-Level TLB: 4 KByte /2 MByte pages, " \
                               "6-way associative, 1536 entries. Also 1 GByte " \
                               "pages, 4-way, 16 entries.\n"
                        );
                        break;
             
                    case(0x00):
                        break;
                    
                    default:
                        break;
                }
            }
        }
    } else {
        printf("TLB Information Leaf Not Supported\n");
    }

// physical address width

    printf("\n********\t Address Width \t********\n\n");
    eax = 0x80000008;
    cpuid(&eax, &ebx, &ecx, &edx);
    printf("\nphysical address width: ");
    printf("%u", eax & 0xFF);

    printf("\nvirtual address width: ");
    printf("%u\n", (eax >> 8) & 0xFF); 
    
// number of logical CPUs

    printf("\n********\t Logical CPUs \t********\n\n");
    
    int cpu_level = 0;
    unsigned int shift = 0;
    if (0x0B <= max_instruction) {

        for (i = 0; i < 7; i++){

            ecx = i;
            eax = 0x0B;
            cpuid(&eax, &ebx, &ecx, &edx);
            cpu_level = (ecx >> 8) & 0xFF; 
            switch (cpu_level) {

                case(0):
                    break;

                case(1):

                    shift = eax & 0xF;
                    printf("SMT level type\n");
                    printf("logical cores at this level " \
                            "(diagnostics) : %u\n", ebx & 0xFF
                    );
                    printf("level number %d\n", cpu_level);
                    printf("logical cores x2APIC ID : %u\n\n",(edx>>shift));
                    break;

                case(2):
                    
                    shift = eax & 0xF;
                    printf("Core level type\n");
                    printf("logical cores at this level " \
                           "(diagnostics) : %u\n", ebx & 0xFF
                    );
                    printf("level number %d\n", cpu_level);
                    printf("logical cores x2APIC ID : %u\n\n",(edx>>shift));
                    break;

                default:
                    break;
            }
        }
    } else {
        printf("Extended Topology Leaf Not Supported\n");
    }

    //CPU model (number and name)

    eax = 0x80000000;
    cpuid(&eax, &ebx, &ecx, &edx);
        
    if (eax >= 0x80000004) {
        printf("Brand String Supported\n");
    } else {
        printf("Brand String Not Supported");
    }


//CPU frequency
    
    printf("\n********\t Frequency Information \t********\n\n");
    eax = 0x16;
    if (eax <= max_instruction) {

        cpuid(&eax, &ebx, &ecx, &edx);
       
        printf("Proc frequency specs\n");
        printf("Base Frequency (MHz) : %u\n", eax & 0xFF);
        printf("Max Frequency (MHz)  : %u\n", ebx);
        printf("Bus Frequency (MHz)  : %u\n", ecx);
    } else {
        
        printf("Frequency Information Leaf not Supported\n");
    }

//CPU features available
    printf("\n********\t CPU Features \t********\n\n");
    for (i = 0; i < 1; i++) {  
        ecx = i;
        eax = 0x07;
        cpuid(&eax, &ebx, &ecx, &edx);
        printf("max input value %u\n", eax);  
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

    printf("\nCPU Brand String\n");
    
    eax = 0x80000002;
    cpuid(&eax, &ebx, &ecx, &edx);
     
    char brand1[17] = {0};
    memcpy(brand1, (char*)&eax, 4);
    memcpy(brand1 + 4, (char*)&ebx, 4);
    memcpy(brand1 + 8, (char*)&ecx, 4);
    memcpy(brand1 + 12, (char*)&edx, 4);
    brand1[16] = 0;   
    printf("%s", brand1);

    eax = 0x80000003;
    cpuid(&eax, &ebx, &ecx, &edx);
 
    char brand2[17] = {0};
    memcpy(brand2, (char*)&eax, 4);
    memcpy(brand2 + 4, (char*)&ebx, 4);
    memcpy(brand2 + 8, (char*)&ecx, 4);
    memcpy(brand2 + 12, (char*)&edx, 4);
    brand2[16] = 0;   
    printf("%s", brand2);
 
    eax = 0x80000004;
    cpuid(&eax, &ebx, &ecx, &edx);
 
    char brand3[17] = {0};
    memcpy(brand3, (char*)&eax, 4);
    memcpy(brand3 + 4, (char*)&ebx, 4);
    memcpy(brand3 + 8, (char*)&ecx, 4);
    memcpy(brand3 + 12, (char*)&edx, 4);
    brand3[16] = 0;   
    printf("%s\n", brand3);
    
    return 0;
}

