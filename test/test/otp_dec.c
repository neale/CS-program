/***********************
Assignment: 4
Course: CS 344
Executable: otp_dec
File Name: otp_dec.c
Purpose: Decryption client
Author: Spencer Kresge
Due: 8/15/2015
***********************/
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <ctype.h>

//Function Prototypes
int make_connection(char *argv[]);
void error(const char *msg);
void strip_newline(char buffer[]);

//packet transmission
void create_packet(char packet[], char header[], char *argv[]);
void send_header(int sockfd, char header[]);
void recv_packet(char packet[], int packet_size, int sockfd);
void send_packet(char packet[], int sockfd);
void recv_header(int sockfd, int *valid, int *packet_size);


void error(const char *msg)
{
    perror(msg);
    exit(0);
}

int main(int argc, char *argv[])
{
    int sockfd, n;
    char packet[1000000];
    char enc_packet[100000];
    char header[102];
    int enc_packet_length = 0;
    int enc_valid = 0;
    n=1;
    if (argc < 3) {
       fprintf(stderr,"usage %s plaintext key port\n", argv[0]);
       exit(0);
    }

    sockfd = make_connection(argv); //establish the socket connection
    create_packet(packet, header, argv);
    send_header(sockfd, header);
    send_packet(packet, sockfd);
    recv_header(sockfd, &enc_valid, &enc_packet_length);
    recv_packet(enc_packet, enc_packet_length, sockfd);
    printf("%s\n",enc_packet); //print the ciphertext to stdout.

    close(sockfd);
    return 0;
}

void send_header(int sockfd, char header[]){
  int n;
  n = write(sockfd,header,strlen(header));
  if (n < 0)
       error("OTP_DEC: ERROR writing to socket");
}

void recv_header(int sockfd, int *valid, int *packet_size){
  char id[2];
  int n = 0;
  char packet_size_s[10];
  read(sockfd, id, 2);
  if(strcmp(id, "$;") == 0){
    *valid = 1; //return valid as true.
  }
  n = read(sockfd,packet_size_s, 10);
  packet_size_s[n] = '\0';
  *packet_size = atoi(packet_size_s);
}

void recv_packet(char packet[], int packet_size, int sockfd){
  int num_read = 0;
  int n;
  char buffer[100];
  do{

    n=0;
  n = read(sockfd,buffer,100);
  num_read += n;
  if (n < 0) error("OTP_DEC: ERROR reading from socket");
  buffer[n] = '\0';
  if(n != 0) strcat(packet, buffer);
  }while(num_read < packet_size);
}

void send_packet(char packet[], int sockfd){
  int n;
  int i = 0;
  char buffer[100];

  do{
    n = 0;
    bzero(buffer, 100);
    memcpy(buffer, packet+i, 100);
    i += 100;
    buffer[100] = '\0';
  n = write(sockfd,buffer,strlen(buffer));
  if (n < 0)
       error("OTP_DEC: ERROR writing to socket");
     }while(n != 0);
}

void create_packet(char packet[], char header[], char *argv[]){
  int key_fd, input_fd, i;
  char key[100000];
  char input[100000];
  char packet_size_s[10];
  int key_size, input_size, packet_size;

  bzero(packet, 1000000);
  key_fd = open(argv[2], O_RDONLY);
  input_fd = open(argv[1], O_RDONLY);

  key_size = read(key_fd, key, 100000);
  strip_newline(key);

  input_size = read(input_fd, input, 100000);
  strip_newline(input);

  packet_size = strlen(key) + strlen(";") + strlen(input);
  snprintf(packet_size_s, 10, "%i", packet_size);
  snprintf(packet, 1000000, "%s;%s",key, input );

  for(i=0; i< 10; i++){
    if(!isdigit(packet_size_s[i])){
      packet_size_s[i] = ' ';
    }
    packet_size_s[10] = '\0';
  }
  snprintf(header, 102, "$;%s", packet_size_s);
}

int make_connection(char *argv[]){ //return socket fd
  int sockfd, portno;
  struct sockaddr_in serv_addr;
  struct hostent *server;

  portno = atoi(argv[3]);
  sockfd = socket(AF_INET, SOCK_STREAM, 0);
  if (sockfd < 0)
      error("OTP_DEC: ERROR opening socket");
  server = gethostbyname("localhost");
  if (server == NULL) {
      fprintf(stderr,"OTP_DEC: ERROR, no such host\n");
      exit(0);
  }
  bzero((char *) &serv_addr, sizeof(serv_addr));
  serv_addr.sin_family = AF_INET;
  bcopy((char *)server->h_addr,
       (char *)&serv_addr.sin_addr.s_addr,
       server->h_length);
  serv_addr.sin_port = htons(portno);
  if (connect(sockfd,(struct sockaddr *) &serv_addr,sizeof(serv_addr)) < 0){
      fprintf(stderr,"OTP_DEC: ERROR connecting, bad port: %i\n", portno);
      exit(2);
    }
  return sockfd;
}

void strip_newline(char buffer[]){
	int i;

	for(i=0; i<strlen(buffer); i++){
		if(buffer[i] == '\n'){
			buffer[i] = '\0'; //replace the newline char with the null char.
			return;
		}
	}
}
