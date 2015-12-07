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
    err = write(sock, header, sizeof(header));

    if (err < 0) {
        fprintf(stderr, "otp_enc: could not write header to socket..");
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

    memset(msg, 0, 1000000);
    fkey   = open(args[2], O_RDONLY);
    fdata  = open(args[1], O_RDONLY);

    for (i = 0; i < sizeof(key); i++) {
        if (key[i] == '\n') {
            key[i] = '\0';
            break;
        }
    }   

    int msg_size = sizeof(key) + sizeof(data) + 1;
    snprintf(header_msg, 10, "%i", msg_size);
    snprintf(msg, sizeof(msg), "%s;%s", key, data);

    for (i = 0; i < 10; i++) {
        if (!isdigit(header_msg[i])) {
            header_msg[i] = ' ';
        }
        header_msg[9] = '\0';
    }
    snprintf(header, 102, "#;%s", header_msg);
    err = 1;
    while (err != 0) {
        memcpy(buf, msg+i, 100);
        i += 100;
        buf[99] = '\0';
        err = write(sock, buf, sizeof(buf));
        if (err < 0) {
            fprintf(stderr, "otp_enc: Could not write to socket..\n");
        }
    }
} 

void get_header(int sock, int *isvalid, int *size) {

    int err = 0;
    char checksum[2] = {0};
    char msg[10] = {0};
    read(sock, checksum, 2);
    if (strcmp(checksum, "#;") == 0) {
        *isvalid = TRUE;
    }
    err = read(sock, msg, 10);
    msg[err] = '\0';
    *size = atoi(msg);
}

void get_msg(char * msg, int size, int sock) {

    int bytes        = 0;
    int bytes_read   = 0;  
    int checksum[10] = {0};
    char buf[100]    = {0};

    while (bytes_read < size) {

        bytes += read(sock, checksum, 2);
        if (bytes < 0) {
            fprintf(stderr, "otp_enc: could not read message..");
        }
        buf[bytes] = '\0';
        strcat(msg, buf);
        bytes_read += bytes;
    }
}
int main(int argc, char **argv){

    int sock = 0;

    char msg[1000000]      = {0};
    char crypt_msg[100000] = {0};
    char header[102]       = {0};

    int  msg_size      = 0;
    int  isvalid       = 0;

    if (argc < 3) {
        fprintf(stderr, "usage: %s [plaintext] [key] <port> \n", argv[0]);
        return -1;
    }

    sock = connect_sock(argv);
    put_header(sock, header);
    put_msg(msg, header, argv, sock);
    get_header(sock, &isvalid, &msg_size);
    get_msg(crypt_msg, msg_size, sock);
    close(sock);
    return 0;
}

