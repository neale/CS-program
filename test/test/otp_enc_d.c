/***********************
Assignment: 4
Course: CS 344
Executable: otp_enc_d
File Name: otp_enc_d.c
Purpose: Encryption daemon
Author: Spencer Kresge
Due: 8/15/2015
***********************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/socket.h>
#include <signal.h>
#include <fcntl.h>
#include <ctype.h>
#include <netinet/in.h>

typedef struct{
  int sockfd, portno; //initial socket file descriptor and port number.
  struct sockaddr_in serv_addr, cli_addr; //structs for SOCK_SERVER and client address
  socklen_t clilen; //sizeof the client address struct.
} MSOCK_SERVER;

/*Function Prototypes*/
//Sever connection management
void error(const char *msg);
void setup_server_socket(MSOCK_SERVER *SOCK_SERVER, int argc, const char *argv[]);
void make_connections(MSOCK_SERVER *SOCK_SERVER);
void execute(MSOCK_SERVER *SOCK_SERVER, int newsockfd);
void sigchld_handler(int sig);

//packet transmission
void create_enc_packet(char enc_packet[], char enc_header[], char ciphertext[]);
void recv_header(int sockfd, int *valid, int *packet_size);
void send_header(char header[], int sockfd);
void recv_packet(char packet[], int packet_size, int sockfd);
void send_packet(char packet[], int sockfd);

//packet tools
void parse_packet(char packet[], int packet_size, int *input_size, int *key_size, char key[], char input[]);
void create_ciphertext(char key[], char input[], char ciphertext[], int input_size);
int is_legal(char single);

int main(int argc, char const *argv[]){
  MSOCK_SERVER SOCK_SERVER; //create the SOCK_SERVER management struct.
  struct sigaction child; //used to define collection of child processes.

  setup_server_socket(&SOCK_SERVER, argc, argv);

  sigemptyset(&child.sa_mask);
  child.sa_handler = &sigchld_handler;
  child.sa_flags = SA_RESTART;
if (sigaction(SIGCHLD, &child, NULL) == -1)
  error("OTP_ENC_D: sigaction");

  while(1){ //the main server process should run forever until killed.
  make_connections(&SOCK_SERVER);
  }

  return 0;
}

void error(const char *msg){
    perror(msg);
    exit(1);
}

void setup_server_socket(MSOCK_SERVER *SOCK_SERVER, int argc, const char *argv[]){

  if (argc < 2) { //make sure that port number is provided.
      fprintf(stderr," OTP_ENC_D: ERROR, no port provided\n");
      exit(1);
  }
  SOCK_SERVER->sockfd = socket(AF_INET, SOCK_STREAM, 0); //create the socket.
  if (SOCK_SERVER->sockfd < 0){
     error("OTP_ENC_D: ERROR opening socket");
   }
  bzero((char *) &(SOCK_SERVER->serv_addr), sizeof(SOCK_SERVER->serv_addr)); //zero out the serv_addr struct
  SOCK_SERVER->portno = atoi(argv[1]); //convert command line port number into integer.
  SOCK_SERVER->serv_addr.sin_family = AF_INET;
  SOCK_SERVER->serv_addr.sin_addr.s_addr = INADDR_ANY;
  SOCK_SERVER->serv_addr.sin_port = htons(SOCK_SERVER->portno);
  if (bind(SOCK_SERVER->sockfd, (struct sockaddr *) &(SOCK_SERVER->serv_addr), //bind the socket to user specified port number.
           sizeof(SOCK_SERVER->serv_addr)) < 0)
           error("OTP_ENC_D: ERROR on binding");
}

void make_connections(MSOCK_SERVER *SOCK_SERVER){
  int newsockfd;
  listen(SOCK_SERVER->sockfd,5); //wait for incoming clients and queue upto 5 at a time.
  SOCK_SERVER->clilen = sizeof(SOCK_SERVER->cli_addr);
  newsockfd = accept(SOCK_SERVER->sockfd,
              (struct sockaddr *) &(SOCK_SERVER->cli_addr),
              &(SOCK_SERVER->clilen));
  if (newsockfd < 0)
       error("OTP_ENC_D: ERROR on accept");

  //immediately after making connection execute encryption task on client input.
  execute(SOCK_SERVER, newsockfd);
}

void execute(MSOCK_SERVER *SOCK_SERVER, int newsockfd){

  pid_t pid = fork();
  char packet[1000000];
  char enc_packet[100000];
  char enc_header[100];
  char input[100000];
  char key[100000];
  char ciphertext[100000];
  int valid, packet_size, input_size, key_size;
  valid = 0; //init to false
  packet_size = 0;
  input_size = 0;
  key_size = 0;

  if(pid == 0){ //child process
    pid = getpid();

    close(SOCK_SERVER->sockfd); //close the listening sockfd.

    recv_header(newsockfd, &valid, &packet_size);

    if(!valid){
      printf("OTP_ENC_D: ERROR PROGRAM MISMATCH! otp_enc_d cannot connect to otp_dec\n");
      exit(1);
    }

    recv_packet(packet, packet_size, newsockfd);
    parse_packet(packet, packet_size, &input_size, &key_size, key, input);

    if(key_size < input_size){
      printf("OTP_ENC_D: ERROR KEY TOO SHORT!\n");
      exit(1);
    }

    create_ciphertext(key, input, ciphertext, input_size);
    create_enc_packet(enc_packet, enc_header, ciphertext);
    send_header(enc_header, newsockfd);
    send_packet(enc_packet, newsockfd);

    close(newsockfd); //close the socket file descriptor when done with it.
    exit(0);
  } else { //parent process
    close(newsockfd); //close the socket file descriptor when done with it.
    //dont bother waiting for childen. They are collected asynchronously.
  }
}

void recv_header(int sockfd, int *valid, int *packet_size){
  char id[2];
  int n = 0;
  char packet_size_s[10];
  read(sockfd, id, 2);
  if(strcmp(id, "#;") == 0){ //check to make sure enc and dec dont mix!!!
    *valid = 1; //return valid as true.
  }
  n = read(sockfd,packet_size_s, 10);
  packet_size_s[n] = '\0';
  *packet_size = atoi(packet_size_s); //return the packet size using the pointer.
}

void sigchld_handler(int sig){
  /*
  Anytime a process finishes what the client asked for it will return SIG_CHLD
  to the parent process. The "daemon" or "server" process can then collect these
  finished processes and let others connect with a new process. These finished
  processes are handled immediately when the parent or server receives the
  SIG_CHLD signal.
  */
  int status;
  //flag is needed to check for process completion without blocking/hanging the main process.
  int options = WNOHANG;

//This very simply collects all finished processes. It checks without hanging the main process
    while(waitpid(-1, &status, options) > 0);

}

void recv_packet(char packet[], int packet_size, int sockfd){
  int num_read = 0;
  int n;
  char buffer[100];

  do{
    n=0; //reinit n to 0. it would get overwritten anyways, but useful for debug.
    //remember 1 byte = 1 char.
  n = read(sockfd,buffer,100); //read blocks of 100 bytes at a time.
  num_read += n; //track how much has been read in.
  if (n < 0) error("OTP_ENC_D: ERROR reading from socket");
  buffer[n] = '\0'; //this is super important to maintain data
  if(n != 0) strcat(packet, buffer); //save the new chars into packet.
  }while(num_read < packet_size); //loop until entire packet has been read in.
}

void send_header(char header[], int sockfd){
  int n;
  n = write(sockfd,header,strlen(header)); //no loop since header is very small.
  if (n < 0)
       error("OTP_ENC_D: ERROR writing to socket");
}

void send_packet(char packet[], int sockfd){
  int n;
  int i = 0;
  char buffer[100];

  do{
    n = 0;
    bzero(buffer, 100); //make sure buffer is totally blank.
    memcpy(buffer, packet+i, 100); //grab next chunk of 100 bytes, from address "packet+i"
    i += 100; //keep stepping through the address space for the packet.
    buffer[100] = '\0';
  n = write(sockfd,buffer,strlen(buffer));
  if (n < 0) //no chars written.
       error("OTP_ENC_D: ERROR writing to socket");
  }while(n != 0); //continue to write until all of packet is sent.
}

void parse_packet(char packet[], int packet_size, int *input_size, int *key_size, char key[], char input[]){
  int i;
  int flag = 0; //set to false.
  int k = 0; //needed for input index

  for(i=0; i < packet_size; i++){
    if(is_legal(packet[i]) && !flag){
       key[i] = packet[i]; //save key values separate
       *key_size = i+1;
     }
    if(!is_legal(packet[i]) && packet[i] == ';'){ //packet delimiter
      flag = 1; //set flag to true on ';'
      continue;
    }
    if(is_legal(packet[i]) && flag){ //check for legal chars.
       input[k] = packet[i];
       k++;
       *input_size = k;
     }
    if(! is_legal(packet[i])){
      printf("OTP_ENC_D: ERROR NOT LEGAL INPUT\n");
      exit(1);
    }
  } //forloop
}

int is_legal(char single){
  //only CAPITAL letters and spaces are legal chars within packet.
  if(((65 <= single) && (single <= 90)) || (single == 32)){
    return 1; //return true.
  }
  return 0; //return false.
}

void create_enc_packet(char enc_packet[], char enc_header[], char ciphertext[]){
  int i, enc_packet_size;
  char enc_packet_size_s[10];

  enc_packet_size = strlen(ciphertext); //find packet_size
  snprintf(enc_packet_size_s, 10, "%i", enc_packet_size); //string format packet_size

  for(i=0; i< 10; i++){
    if(!isdigit(enc_packet_size_s[i])){ //isdigit is part of ctype.h
      //padding is necessary to maintain accuracy of read/write ops in socket
      enc_packet_size_s[i] = ' ';
    }
    enc_packet_size_s[10] = '\0'; //string termination.
  }
  //string format the ID bytes and the packet_size into the header.
  snprintf(enc_header, 102, "#;%s", enc_packet_size_s);
  //string format the encrypted plaintext into the packet.
  snprintf(enc_packet, 100000, "%s",ciphertext);
}

void create_ciphertext(char key[], char input[], char ciphertext[], int input_size){
  /*
  This function encrypts the plaintext using modular arithmetic.
  It takes the ascii values and shifts them back to A:0 reference. Spaces are unique
  they were not contiguous with the other letters in ascii values. Spaces are
  handled specially by shifting them into the 26th value place.
  */
  int i;

  for(i=0; i<(input_size); i++){

    if((input[i] != ' ') && (key[i] != ' ')){
      ciphertext[i] = (((input[i] - 65) + (key[i] - 65)) % 27);
      if(ciphertext[i] == 26){
        ciphertext[i] += 6; //get to ascii value for a SPACE.
      } else if(ciphertext[i] != 26){
        ciphertext[i] += 65; //lots of ascii shifting
      }
    }

    if((input[i] == ' ') && (key[i] != ' ')){
      ciphertext[i] = (((input[i] - 6) + (key[i] - 65)) % 27); //lots of ascii shifting
      if(ciphertext[i] == 26){
        ciphertext[i] += 6; //get to ascii value for a SPACE.
      } else if(ciphertext[i] != 26){
        ciphertext[i] += 65; //lots of ascii shifting
      }
    }

    if((input[i] != ' ') && (key[i] == ' ')){
      ciphertext[i] = (((input[i] - 65) + (key[i] - 6)) % 27);
      if(ciphertext[i] == 26){
        ciphertext[i] += 6; //get to ascii value for a SPACE.
      } else if(ciphertext[i] != 26){
        ciphertext[i] += 65; //lots of ascii shifting
      }
    }

    if((input[i] == ' ') && (key[i] == ' ')){ //always looking for spaces to handle
      ciphertext[i] = (((input[i] - 6) + (key[i] - 6)) % 27);
      if(ciphertext[i] == 26){
        ciphertext[i] += 6; //get to ascii value for a SPACE.
      } else if(ciphertext[i] != 26){
        ciphertext[i] += 65; //lots of ascii shifting
      }
    }
  } //for loop
ciphertext[(input_size)] = '\0';
}
