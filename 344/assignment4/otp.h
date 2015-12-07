
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <ctype.h>

#define TRUE 1
#define FALSE 0


int connect_sock(char **data);
void put_header(int sock, char * header);
void put_msg(char * msg, char * header, char ** args, int sock);
void get_header(int sock, int *isvalid, int *size);
void get_msg(char * msg, int size, int sock);
