#include "open.h"

int main(){

  /* initialize all variables to null as needed */
  FILE *fp = fp;
  int fd;
  int i; //iteration variable
  char* path = "out.txt";  
  char create = "";
  int* buf = (int*)(malloc(sizeof(int)));
  int numBytes = 0;
  int modRights = 0;
  char permissions = "";
  char* permissionOptions = "";
  int numbytes = 0; 
  /* open file */
  fd = open(path, (RW | APPEND));
  /* deal with the return from opening */

  if(fd == -1){
    fprintf(stderr, "couldn't open the file\n"); 
    fprintf(stdout, "do you want to create it?  [y] [n]\t\t");
    scanf("%c", &create);
    fprintf(stdout, "\ncreating file...");
    if(create == 'y'){
      fd = open(path, (RW | APPEND | O_CREAT), (SET_WRITE_E | SET_READ_E | SET_EXEC_E));
      printf("%s created\n\n", path);
    }
    else if(create == 'n'){
      fprintf(stdout, "exiting...\n");
      return 0;
    }
    else{
      fprintf(stdout, "not a valid option"); 
      return 0;
    }
  }

  else printf("opened file successfully\n");

  int countBytes = read(fd, buf, numBytes);
  if(countBytes == -1){
    /* error handler */
    switch(errno){

      /* collision handler */
      case(EINTR):
        while(errno == EINTR || (countBytes == -1)){
          fprintf(stderr, "some async call occured, trying again");
          sleep(1);
          countBytes = read(fd, buf, numbytes);
        }
        break;

        /* permissions handler */
      case(EPERM):
        while(permissions == NULL){
          printf("Access Denied\ndo you want to update reading permissions?: [y] [n]");
          scanf("%c", &permissions);
          if(permissions == 'y'){
            modRights = fchmod(fd, SET_READ_E);
            if(modRights == -1){
              if(errno == EBADF) printf("Error in file open, bad file descriptor");
              else if(errno == EPERM) printf("Need admin rights to change permissions");
              else if(errno == EROFS) printf("Read-only fs\nExiting...");
              exit(EXIT_FAILURE);
            }
            printf("permissions updated, now read-access\nreopening...\n");
          }
          else if(permissions == 'n'){
            printf("closing file and exiting\n");
            close(fd);
            exit(EXIT_FAILURE);
          }
          else{
            printf("input not recognized\n");
            permissions = NULL;
          }
        }
        countBytes = read(fd, buf, numbytes);
        if(countBytes == -1) printf("permissions could not be changed, contact administrator...\n");
        break;

        /* bad file descriptor handler */
      case(EBADF):
        fprintf(stderr, "bad file descriptor, trying one more time to open, then quitting...\n");
        close(fd);
        fd = open(path, (RW | APPEND));
        countBytes = read(fd, buf, numBytes);
        if(countBytes == -1){
          printf("file still can't be verified, check conflicting processes\n");
          exit(EXIT_FAILURE);
        }
        break;

      default: 
        fprintf(stderr, "some weird funky-ass error occured\n");
        break;
    }
  }
  else fprintf(stderr, "file is being read from\n");
  /* closing */
  if(close(fd) == -1){
    fprintf(stderr, "could not close the file\n");
  }
  else printf("closed file successfully\n");

  return 0;
}

