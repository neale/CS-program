#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/socket.h>
#include <netinet/in.h>

#define TRUE 1
#define FALSE 0

typedef struct _Host {

    int sock;
    int port;
    socklen_t client_size;

    struct sockaddr_in host_addr;
    struct sockaddr_in client_addr;
} Host;



void put_header(int sock, char * header);
void put_header_msg(char * msg, char * crypt_key, char * data, char * cryptxt, char * header, int size, int sock);
void get_header(int sock, int *isvalid, int *size);
void get_msg(char * msg, int size, int sock);
void parse(char * msg, int msg_size, int * data_size, int * key_size, char * key, char * data);
void signal_handler(int signal);
void deploy(Host * host, int argc, char **argv);
void spawn(Host *host, int fsock);
void connect_out(Host * host);
