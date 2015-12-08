#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/socket.h>
#include <fcntl.h>
#include <netdb.h>
#include <ctype.h>
#include <netinet/in.h>

void put_header(int sock, char * header){
    
    int bytes;
    
    bytes = write(sock, header, strlen(header));
    if (bytes < 0)
        fprintf(stderr, "OTP_ENC: ERROR writing to socket");
        exit(-1);
}

void get_header(int sock, int *isvalid, int *msg_len){
    
    int bytes = 0;
    char header[10];
    char checksum[2];
    
    read(sock, checksum, 2);
    if(strcmp(checksum, "#;") == 0){
        *isvalid = 1; //return valid as true.
    }
    else {
        fprintf(stderr, "invalid");
    }
    bytes = read(sock, header, 10);
    header[bytes] = '\0';
    *msg_len = atoi(header);
}

void get_msg(char * msg, int msg_len, int sock){
    
    int bytes = 0;
    int bytes_total = 0;
    char buf[100];
    while (bytes_total < msg_len) {

        bytes = read(sock , buf, 100);
        if (bytes < 0) {
            fprintf(stderr, "otp_enc: could not read socket..");
            exit(-1);
        }
        buf[bytes] = '\0';

        if(bytes != 0) {
            strcat(msg, buf);
        }
        bytes_total += bytes;
    }
}

void put_msg(char * msg, int sock){
    
    int i = 0;
    int bytes = 1;
    char buf[100];

    while (bytes != 0) {
        memset(buf, 0, 100);
        memcpy(buf, msg+i, 100);
        buf[99] = '\0';
        bytes = write(sock, buf, strlen(buf));
        if (bytes < 0)
            fprintf(stderr, "otp_enc: could not write to socket..");
            exit(-1);
        i += 100;
        bytes = 0;
    }
}

void make_msg(char * msg, char * header, char ** argv){

    int i = 0;
    int fkey = 0;
    int fdata = 0;
    char key[100000];
    char data[100000];
    char header_msg[11];

    memset(msg, 0, 1000000);
    fkey = open(argv[2], O_RDONLY);
    int key_size = read(fkey, key, 100000);
    
    for(i = 0; i < strlen(key); i++){
        if(key[i] == '\n'){
            key[i] = '\0'; //replace the newline char with the null char.
            break;
        }
    }
    fdata = open(argv[1], O_RDONLY);
    int data_size = read(fdata, data, 100000);
    
    for(i = 0; i < strlen(data); i++){
        if(data[i] == '\n'){
            data[i] = '\0'; //replace the newline char with the null char.
            break;
        }
    }

    int msg_len = strlen(key) + strlen(";") + strlen(data);
    snprintf(header_msg, 10, "%i", msg_len);
    snprintf(msg, 1000000, "%s;%s",key, data);

    for(i = 0; i < 10; i++){
        if(!isdigit(header_msg[i])){
            header_msg[i] = ' ';
        }
        header_msg[10] = '\0';
    }
    snprintf(header, 102, "#;%s", header_msg);
}

int make_connection(char ** args){ //return socket fd
    
    int sock = 0; 
    int port = 0;
    
    struct sockaddr_in host_addr;
    struct hostent *host;

    sock = socket(AF_INET, SOCK_STREAM, 0);
    port = atoi(args[3]);
    
    if (sock < 0) {
        fprintf(stderr, "otp_enc: could not open socket..\n");
        exit(-1);
    }
    host = gethostbyname("localhost");
    
    if (host == NULL) {
        fprintf(stderr, "otp_enc: no such host..\n");
        exit(-1);
    }
    memset((char *) &host_addr, 0, sizeof(host_addr));
    host_addr.sin_family = AF_INET;
    memcpy((char *)host->h_addr, (char *)&host_addr.sin_addr.s_addr, host->h_length);
    host_addr.sin_port = htons(port);
    
    if (connect(sock, (struct sockaddr *) &host_addr, sizeof(host_addr)) < 0){
        fprintf(stderr, "otp_enc: could not connect, bad port: %i\n", port);
        exit(-1);
    }

    return sock;
}

int main(int argc, char ** argv) {

    int n = 0;
    int sock = 0;
    int isvalid = 0;
    int crypt_msg_len = 0;
    
    char msg[1000000];
    char crypt_msg[100000];
    char header[102];

    if (argc < 3) {
        fprintf(stderr,"usage : [plaintext file] [key] <port>\n");
        exit(-1);
    }

    sock = make_connection(argv); 

    make_msg(msg, header, argv);

    put_header(sock, header);
    put_msg(msg, sock);
    
    get_header(sock, &isvalid, &crypt_msg_len);
    get_msg(crypt_msg, crypt_msg_len, sock);
    
    printf("%s\n",crypt_msg);

    close(sock);
    return 0;
}

