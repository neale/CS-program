#include "otp.h"

int connect_sock(char **data) {

    int sock;
    int port;
    struct sockaddr_in host_addr;
    struct hostent *host;

    port = atoi(data[3]);
    sock = socket(AF_INET, SOCK_STREAM, 0);

    if (sock < 0) {
        fprintf(stderr, "otp_enc: Could not open socket..");
        return -1;
    }

    host = gethostbyname("localhost");

    if (host == NULL) {
        fprintf(stderr, "otp_enc: Could not connect to host..");   
        return -1;
    }

    memset((char *) &host_addr, 0, sizeof(host_addr));
    host_addr.sin_family = AF_INET;
    memcpy((char *) host->h_addr, (char *) &host_addr.sin_addr.s_addr, host->h_length);
    host_addr.sin_port = htons(port);

    if (connect(sock, (struct sockaddr *) &host_addr, sizeof(host_addr)) < 0) {
        fprintf(stderr, "otp_enc: Could not connect to port..\n");
        exit(-1);
    }
    return sock;
}

void put_header(int sock, char * header) {
    int err = 0;
    printf("writing header now ENC\n");
    err = write(sock, header, strlen(header));
    
    if (err < 0) {
        fprintf(stderr, "otp_enc: could not write header to socket..");
        exit(-1);
    }
}

void put_msg(char * msg, char * header, char ** args, int sock) {

    int  i     = 0;
    int  fkey  = 0; 
    int  fdata = 0;
    int  err   = 0;
    char buf[100]       = {0};
    char key[100000]    = {0};
    char data[100000]   = {0};
    char header_msg[10] = {0};
    fdata  = open(args[1], O_RDONLY);
    int data_size = read(fdata, data, 100000);    
    for (i = 0; i < strlen(data); i++){
        if (data[i] == '\n') {
            data[i] = '\0';
            break;
        }
    }    

    fkey   = open(args[2], O_RDONLY);
    int key_size = read(fkey, key, 100000);
    for (i = 0; i < strlen(key); i++){
        if (key[i] == '\n') {
            key[i] = '\0';
            break;
        }
    }    
    memset(msg, 0, 1000000);
    printf("key: %s, data: %s\n", key, data);
    
    int msg_size = strlen(key) + strlen(data) + 1;
    
    snprintf(header_msg, 10, "%i", msg_size);
    snprintf(msg, 1000000, "%s;%s", key, data);
    printf("msg: %s\n", msg); 
    
    printf("getting header msg ENC\n");
    
    for (i = 0; i < 10; i++) {
        if (!isdigit(header_msg[i])) {
            header_msg[i] = ' ';
        }
        header_msg[10] = '\0';
    }
    printf("header message: %s\n", header);
    snprintf(header, 102, "#;%s", header_msg);
    err = 1;
   
    put_header(sock, header);
    printf("read through socket ENC\n");
    do {
        memset(buf, 0, 100);
        memcpy(buf, msg+i, 100);
        i += 100;
        buf[100] = '\0';
        err = write(sock, buf, strlen(buf));
        if (err < 0) {
            fprintf(stderr, "otp_enc: Could not write to socket..\n");
            exit(-1);
        }
    } while(err != 0);

    printf("buf: %s\n", buf); 
    printf("done putting msg ENC\n");
} 

void get_header(int sock, int *isvalid, int *size) {

    int err = 0;
    char checksum[2];
    char msg[10];
    printf("reading sock\n");
    read(sock, checksum, 2);
    if (strcmp(checksum, "#;") == 0) {
        *isvalid = TRUE;
        printf("is valid\n");
    }
    else {
        printf("is not valid\n");
    }     
    err = read(sock, msg, 10);
    msg[err] = '\0';
    *size = atoi(msg);
}

void get_msg(char * msg, int size, int sock) {

    int bytes        = 0;
    int bytes_read   = 0;  
    char buf[100];

    while (bytes_read < size) {
        bytes = 0;
        bytes = read(sock, buf, 100);
        if (bytes < 0) {
            fprintf(stderr, "otp_enc: could not read message..");
            exit(-1);
        }
        buf[bytes] = '\0';
        if (bytes != 0) {

            strcat(msg, buf);
        }    
        bytes_read += bytes;
    }
}
int main(int argc, char **argv){

    int sock = 0;

    char msg[1000000]      = {0};
    char crypt_msg[100000] = {0};
    char header[102]       = {0};

    int  isvalid       = 0;
    int  msg_size      = 0;

    if (argc < 3) {
        fprintf(stderr, "usage: %s [plaintext] [key] <port> \n", argv[0]);
        return -1;
    }

    sock = connect_sock(argv);
    printf("putting messgae ENC\n");
    put_msg(msg, header, argv, sock);
    printf("getting header ENC\n");
    get_header(sock, &isvalid, &msg_size);
    printf("getting message ENC\n");
    get_msg(crypt_msg, msg_size, sock);
    close(sock);
    return 0;
}

