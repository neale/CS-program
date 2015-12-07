/***********************
Assignment: 4
Course: CS 344
Executable: keygen
File Name: keygen.c
Purpose: OTP key generation
Author: Spencer Kresge
Due: 8/15/2015
***********************/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

char letters[27] = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',' '};

int main(int argc, char const *argv[]) {
  int count, i;
  char *key_stream;

  if (argc != 2) {
     fprintf(stderr,"usage keygen keylength\n");
     exit(0);
  }
  srand( time(NULL) ); //initialize the random number generator with a truely dynamic seed.
  count = atoi(argv[1]); //convert the string into integer.
  key_stream = (char*) calloc(count, sizeof(char));

//choose random numbers between 0 and 26 to reference the above array. repeat keylength times.
  for(i=0; i< count; i++){
    key_stream[i] = letters[rand() % 27];
  }
  //print the key_stream to stdout.
  printf("%s\n",key_stream);
  free(key_stream);
  return 0;
}
