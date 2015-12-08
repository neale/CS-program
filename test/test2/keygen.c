#include <stdio.h>
#include <stdlib.h>
#include <time.h>

char alpha[27] = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',' '};

int main(int argc, char ** argv) {
    
    int i = 0;
    int nums = 0;
    char *key;
    srand(time(NULL));

    if (argc != 2) {
        fprintf(stderr, "usage: keygen <length> \n");
        exit(-1);
    }
    
    nums = atoi(argv[1]);
    key = (char*) malloc(nums * sizeof(char));

    for(i = 0; i < nums; i++){
        key[i] = alpha[rand() % 27];
    }
    printf("%s\n", key);
    free(key);
    return 0;
}
