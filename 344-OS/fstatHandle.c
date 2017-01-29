#include "open.h"

int main(){

  struct stat stats; 
  struct stat *inStat;
   
  char* path = "out.txt";
  int fd = 0;
  int i = 0;
  int *buf = (int*)(malloc(sizeof(int)));
  inStat = &stats;
  fd = open(path, (APPEND || RW), O_CREAT);
  fstat(fd, &stats);
  printf("%d\t %d\t", inStat->st_dev, inStat->st_ino);
  /*check if directory or file*/
  if(S_ISREG(stats.st_mode)){
    fprintf(stdout, path + "is a reqular file");
  }



  return 0;
}


