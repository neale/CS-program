#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

//modes
#define RW O_RDWR //readwrite
#define R_ONLY O_RDONLY //read only
#define BINARY O_BINARY //open binary
#define APPEND O_APPEND //append file

//permissions
#define SET_READ_O S_IRUSR   //Set read rights for the owner to true.
#define SET_WRITE_O S_IWUSR   //Set write rights for the owner to true.
#define SET_EXEC_O S_IXUSR   //Set execution rights for the owner to true.
#define SET_READ_G S_IRGRP   //Set read rights for the group to true.
#define SET_WRITE_G S_IWGRP   //Set write rights for the group to true.
#define SET_EXEC_G S_IXGRP   //Set execution rights for the group to true.
#define SET_READ_E S_IROTH   //Set read rights for other users to true.
#define SET_WRITE_E S_IWOTH   //Set write rights for other users to true.
#define SET_EXEC_E S_IXOTH   //Set execution rights for other users to trui

