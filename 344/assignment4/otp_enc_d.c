#include "otp_d.h"


void put_header(int sock, char * header) {

    int err = 0;
    err = write(sock, header, sizeof(header));

    if (err < 0) {
        fprintf(stderr, "otp_enc_d: could not write header to socket..");
    }
}
/*
   This function encrypts the plaintext using modular arithmetic.
   It takes the ascii values and shifts them back to A:0 reference. Spaces are unique
   they were not contiguous with the other letters in ascii values. Spaces are
   handled specially by shifting them into the 26th value place.
   */
void put_header_msg(char * msg, char * crypt_key, char * data, char * cryptxt, char * header, int size, int sock) {

    int i     = 0;
    int set   = FALSE;
    int idx   = 0;
    int err   = 0;
    char buf[100]       = {0};
    char header_msg[10] = {0};

    memset(msg, 0, strlen(msg));


    for(idx = 0; i < size; i++){
        set = FALSE;
        
        if((data[i] != ' ') && (crypt_key[i] != ' ')){
            cryptxt[i] = (((data[i] - 65) + (crypt_key[i] - 65)) % 27);
            set = TRUE;
        } 
        if((data[i] == ' ') && (crypt_key[i] != ' ')) {
            cryptxt[i] = (((data[i] - 6) + (crypt_key[i] - 65)) % 27); 
            set = TRUE;
        }
        if((data[i] == ' ') && (crypt_key[i] != ' ')) {
            cryptxt[i] = (((data[i] - 6) + (crypt_key[i] - 65)) % 27); 
            set = TRUE;
        }
        if((data[i] == ' ') && (crypt_key[i] == ' ')){ 
            cryptxt[i] = (((data[i] - 6) + (crypt_key[i] - 6)) % 27);
            set = TRUE;
        }
        if (set) {
            if(cryptxt[i] == 26){
                cryptxt[i] += 6; 
            } else if(cryptxt[i] != 26){
                cryptxt[i] += 65;
            }
        }
    } 
    cryptxt[(size)] = '\0';    

    int msg_size = sizeof(cryptxt);
    snprintf(header_msg, 10, "%i", msg_size);

    for (i = 0; i < 10; i++) {
        if (!isdigit(header_msg[i])) {
            header_msg[i] = ' ';
        }
        header_msg[9] = '\0';
    }
    snprintf(header, 102, "#;%s", header_msg);       
    snprintf(msg, 100000, "%s",  cryptxt);
    
    /* write header */
    err = write(sock, header, sizeof(header));

    if (err < 0) {
        fprintf(stderr, "otp_enc_d: could not write header to socket..");
    }

    err = 1;
    while (err != 0) {
        memcpy(buf, msg+i, 100);
        i += 100;
        buf[99] = '\0';
        err = write(sock, buf, sizeof(buf));
        if (err < 0) {
            fprintf(stderr, "otp_enc_d: Could not write to socket..\n");
        }
    }
} 

void get_header(int sock, int *isvalid, int *size) {

    int err = 0;
    char checksum[2];
    char msg[10] = {0};
    read(sock, checksum, 2);
    if (strcmp(checksum, "#;") == 0) {
        *isvalid = TRUE;
    }
    else {
      fprintf(stderr, "checksum should not be: %s\n", checksum);
    }     
    err = read(sock, msg, 10);
    msg[err] = '\0';
    *size = atoi(msg);
}

void get_msg(char * msg, int size, int sock) {

    int bytes      = 0;
    int bytes_read = 0;   
    char buf[100]  = {0};

    while (bytes_read < size) {

        bytes += read(sock, buf, 2);
        if (bytes < 0) {
            fprintf(stderr, "otp_enc_d: could not read message..");
        }
        buf[bytes] = '\0';
        strcat(msg, buf);
        bytes_read += bytes;
    }
}

void parse(char * msg, int msg_size, int * data_size, int * key_size, char * key, char * data) {

    int i = 0;
    int idx = 0;
    int delim = TRUE;
    int isvalid = FALSE;

    for (i = 0; i < msg_size; i++) {
        if (((msg[i] >= 65) && (msg[i] <= 90)) || (msg[i] == 32)) {
            isvalid = TRUE;
        }
        if (isvalid && msg[i] == ';') {
            delim = TRUE;            
        }
        if (isvalid && delim) {
            data[idx] = msg[i];
            idx++;
            *data_size = idx;
        }
        if (!isvalid) {
            fprintf(stderr, "otp_enc_d: input must be [A - Z] or ' ' \n");
            exit(-1);
        }
    }
}

void signal_handler(int signal) {

    int status = 0;
    while(waitpid(-1, &status, WNOHANG) > 0) { }
        
}

void deploy(Host * host, int argc, char **argv) {

    if (argc < 2) {
        fprintf(stderr, "opt_enc_d: no port given..\n");
    }
    host->sock = socket(AF_INET, SOCK_STREAM, 0);
    if (host->sock < 0) {
        fprintf(stderr, "otp_enc_d: could not open socket..\n");
    }    
    memset((char *) &(host->host_addr), 0, sizeof(host->host_addr));

    host->port = atoi(argv[1]); 

    host->host_addr.sin_family = AF_INET;
    host->host_addr.sin_port = htons(host->port);
    host->host_addr.sin_addr.s_addr = INADDR_ANY;

    if (bind(host->sock, (struct sockaddr *) &(host->host_addr), sizeof(host->host_addr)) < 0) {
        fprintf(stderr, "otp_enc_d: Could not bind..\n");
    }
}

void spawn (Host *host, int fsock) {


    char msg[1000000];
    char crypt_msg[100000];
    char header[100000];
    char key[100000];
    char data[100000];
    int  isvalid = 0;
    int  msg_size = 0;
    int  data_size = 0;
    int  key_size = 0;

    pid_t pid = fork();
    /* child */
    if(pid == 0){ //child process

        pid = getpid();

        close(host->sock);
        get_header(fsock, &isvalid, &msg_size);

        if(!isvalid){
            printf("otp_enc_d: network crosstalk not permitted..\n");
            exit(-1);
        }

        get_msg(msg, msg_size, fsock);
        parse(msg, msg_size, &data_size, &key_size, key, data);

        if(key_size < data_size){
            printf("otp_enc_d: key must be longer than <%d>\n", data_size);
            exit(-1);
        }

        put_header_msg(msg, key, data, crypt_msg, header, data_size, fsock);

        close(fsock);
        exit(-1);

        /* parent */
    } else { 
        close(fsock);
    }
}

void connect_out(Host * host) {
 
    int fsock = 0;
    listen(host->sock, 5);
    host->client_size = sizeof(host->client_addr);
    fsock = accept(host->sock, (struct sockaddr *) &(host->client_addr), &(host->client_size));
    if (fsock < 0) {
        fprintf (stderr, "otp_enc_d: could not connect..\n");
    }
    spawn(host, fsock);
}

int main(int argc, char ** argv) {

    Host host;
    
    deploy(&host, argc, argv);
    
    struct sigaction sig;
    sigemptyset(&sig.sa_mask);
    
    sig.sa_handler = &signal_handler;
    sig.sa_flags   = SA_RESTART;

    if (sigaction(SIGCHLD, &sig, NULL) == -1) {
        fprintf(stderr, "otp_enc_d: uncaught signal");
    }
    
    while(1) {
        connect_out(&host);
    }        
    
    return 0;
}