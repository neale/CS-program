#include <stdio.h>
#include <stdlib.h>
#include <time.h>

char alpha[27] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 
    'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 
    'Y', 'Z', ' ' };

int main(int argc, char **argv) {

    int count, i;
    char * key;

    if (argc != 2) {
        fprintf(stderr, "usage: keygen <keylength>\n");
        return(-1);
    }

    srand(time(NULL));
    count = atoi(argv[1]);
    key = (char *) calloc(count, sizeof(char));

    for (i = 0; i < count; i++) {
        key[i] = alpha[rand() % 27];
    }
    printf("%s\n", key);
    free(key);
    return 0;
}

