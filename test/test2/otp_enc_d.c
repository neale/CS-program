#include <ctype.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

typedef struct {

    int sock;
    int port; 

    struct sockaddr_in host_addr;
    struct sockaddr_in client_addr; 
    socklen_t client_len;

} Host;

#define TRUE 1
#define FALSE 0

void deploy(Host * host, int argc, char ** argv){

    if (argc < 2) { 
        fprintf(stderr, "otp_enc_d: no port provided..\n");
        exit(-1);
    }

    host->sock = socket(AF_INET, SOCK_STREAM, 0);

    if (host->sock < 0){
        fprintf(stderr, "otp_enc_d: could not open socket..\n");
        exit(-1);
    }
    memset((char *) &(host->host_addr), 0, sizeof(host->host_addr));
    host->port = atoi(argv[1]); 

    host->host_addr.sin_family = AF_INET;
    host->host_addr.sin_addr.s_addr = INADDR_ANY;
    host->host_addr.sin_port = htons(host->port);

    if (bind(host->sock, (struct sockaddr *) &(host->host_addr), sizeof(host->host_addr)) < 0)
        fprintf(stderr, "otp_enc_d: could not bind to socket..\n");
        exit(-1);
}
void get_header(int sock, int *isvalid, int *msg_len){
    
    int bytes = 0;
    char header[10];
    char checksum[2];
    
    read(sock, checksum, 2);
 
    if(strcmp(checksum, "#;") == 0) {
        *isvalid = TRUE; 
    }
 
    bytes = read(sock, header, 10);
    header[bytes] = '\0';
    *msg_len = atoi(header); 
}

void signal_handler(int signal){
    
    int status = 0;
    while(waitpid(-1, &status, WNOHANG) > 0) { }
}

void get_msg(char * msg, int msg_len, int sock){
    
    int bytes = 0;
    char buf[100];
    int bytes_total = 0;

    while (bytes_total < msg_len) {
        
        bytes = read(sock, buf, 100);
        bytes_total += bytes;
        if (bytes < 0) {
            fprintf(stderr, "otp_enc_d: could not read from socket..\n");
            exit(-1);
        }

        buf[bytes] = '\0'; //this is super important to maintain data
        if(bytes != 0) {
            strcat(msg, buf); //save the new chars into packet.
        }
    }
}
void put_header(char * header, int sock){
   
    int bytes;
    bytes = write(sock, header, strlen(header));
    if (bytes < 0) {
        fprintf(stderr, "otp_enc_d: could not write to socket..\n");
        exit(-1);
    }
}

void put_msg(char * msg, int sock){

    int i = 0;
    int bytes = 1;
    char buf[100];

    while (bytes != 0) {
        
        memset(buf, 0, 100);
        memcpy(buf, msg+i, 100); 
        i += 100; 
        buf[99] = '\0';
        bytes = write(sock ,buf, strlen(buf));
        if (bytes < 0) { 
            fprintf(stderr, "otp_enc_d: could not write to socket..\n");
            exit(-1);
        }
    } 
}

void parse(char * msg, int msg_len, int *data_len, int * key_len, char * key, char * data){
    
    int i = 0;
    int idx = 0;
    int isvalid = 0;
    int delim = 0;

    for(i = 0; i < msg_len; i++){
        if(((65 <= msg[i]) && (msg[i] <= 90)) || (msg[i] == 32)){
            isvalid = TRUE;
        } else {
            isvalid = FALSE;
        }
        if(isvalid && !delim){
            key[i] = msg[i]; //save key values separate
            *key_len = i+1;
        }
        if(!isvalid && msg[i] == ';'){ //packet delimiter
            delim = TRUE; //set flag to true on ';'
            continue;
        }
        if(isvalid && delim){ //check for legal chars.
            data[idx] = msg[i];
            idx++;
            *data_len = idx;
        }
        if(!isvalid){
            fprintf(stderr, "otp_enc_d: inalid input: must be [A - Z, ' ']..\n");
            exit(-1);
        }
    } 
}

void gen_msg(char * crypt_msg, char * crypt_header, char * ciphertxt){
    int i = 0; 
    int cmsg = 0;
    char chead[10];

    cmsg = strlen(ciphertxt); 
    snprintf(chead, 10, "%i", cmsg);

    for(i = 0; i < 10; i++){
        if(!isdigit(chead[i])) { 
            chead[i] = ' ';
        }
        chead[9] = '\0';
    }
    snprintf(crypt_header, 102, "#;%s", chead);
    snprintf(crypt_msg, 100000, "%s", ciphertxt);
}

void gen_cipher(char * key, char * data, char * ciphertxt, int data_len){
    
    int i = 0;

    for(i = 0; i < data_len; i++) {

        if((data[i] != ' ') && (key[i] != ' ')){
            ciphertxt[i] = (((data[i] - 65) + (key[i] - 65)) % 27);
            if(ciphertxt[i] == 26){
                ciphertxt[i] += 6; 
            } else if(ciphertxt[i] != 26){
                ciphertxt[i] += 65;
            }
        }

        if((data[i] == ' ') && (key[i] != ' ')){
            ciphertxt[i] = (((data[i] - 6) + (key[i] - 65)) % 27); //lots of ascii shifting
            if(ciphertxt[i] == 26){
                ciphertxt[i] += 6; //get to ascii value for a SPACE.
            } else if(ciphertxt[i] != 26){
                ciphertxt[i] += 65; //lots of ascii shifting
            }
        }

        if((data[i] != ' ') && (key[i] == ' ')){
            ciphertxt[i] = (((data[i] - 65) + (key[i] - 6)) % 27);
            if(ciphertxt[i] == 26){
                ciphertxt[i] += 6; //get to ascii value for a SPACE.
            } else if(ciphertxt[i] != 26){
                ciphertxt[i] += 65; //lots of ascii shifting
            }
        }

        if((data[i] == ' ') && (key[i] == ' ')){ //always looking for spaces to handle
            ciphertxt[i] = (((data[i] - 6) + (key[i] - 6)) % 27);
            if(ciphertxt[i] == 26){
                ciphertxt[i] += 6; //get to ascii value for a SPACE.
            } else if(ciphertxt[i] != 26){
                ciphertxt[i] += 65; //lots of ascii shifting
            }
        }
    } 
    ciphertxt[data_len] = '\0';
}

void spawn(Host * host, int sock){

    pid_t pid = fork();
   
    int isvalid = 0;
    int key_len = 0;
    int msg_len = 0;
    int data_len = 0;

    char msg[1000000];
    char crypt_msg[100000];
    char crypt_header[100];
    char data[100000];
    char key[100000];
    char ciphertxt[100000];

    if(pid == 0){ //child process
        
        pid = getpid();

        close(host->sock); //close the listening sockfd.

        get_header(sock, &isvalid, &msg_len);

        if(!isvalid){
            printf("OTP_ENC_D: ERROR PROGRAM MISMATCH! otp_enc_d cannot connect to otp_dec\n");
            exit(-1);
        }

        get_msg(msg, msg_len, sock);
        parse(msg, msg_len, &data_len, &key_len, key, data);

        if(key_len < data_len){
            printf("otp_enc_d: key size must be larger than <%d>\n", data_len);
            exit(-1);
        }

        gen_cipher(key, data, ciphertxt, data_len);
        gen_msg(crypt_msg, crypt_header, ciphertxt);
        put_header(crypt_header, sock);
        put_msg(crypt_msg, sock);
        

        close(sock);
        exit(-1);
    } else { 
        close(sock);
    }
}

void connect_out(Host * host){
    
    int sock = 0;
    
    listen(host->sock, 5);
    host->client_len = sizeof(host->client_addr);
    sock = accept(host->sock, (struct sockaddr *) &(host->client_addr), &(host->client_len));
    
    if (sock < 0)
        fprintf(stderr, "otp_enc_d: could not accept conn..\n");
        exit(-1);

    spawn(host, sock);
}


int main(int argc, char ** argv){
    
    Host host; 
    struct sigaction sig; //used to define collection of child processes.

    deploy(&host, argc, argv);

    sigemptyset(&sig.sa_mask);
    sig.sa_handler = &signal_handler;
    sig.sa_flags = SA_RESTART;
    if (sigaction(SIGCHLD, &sig, NULL) == -1) {
        fprintf(stderr, "otp_enc_d: signal not caught..\n");
        exit(-1);
    }
    while(1){ 
        connect_out(&host);
    }

    return 0;
}


