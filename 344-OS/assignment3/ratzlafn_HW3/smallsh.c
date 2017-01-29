#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define TRUE 1
#define FALSE 0
#define FILE_NAME_SIZE 50

int __cd(char **args);
int __exit(char **args);
int __status(char **args);

/* global flags */
int last_exit   = 0;
int background  = FALSE;
int back_pid    = FALSE;
int redir_out   = FALSE;
int redir_in    = FALSE;

/* buffers to hold the fake stdin, stdout, stderr */
static char outfile[50] = {0};
static char infile[50]  = {0};
static char home[100]    = {0}; 

/* names of the builtin functions */
char *_builtin_names[] = {
    "cd",
    "exit",
    "status"
};
/* Holds function pointers to builtins 
 * Because we're going to be comparing the input strings to the builtins' names
 * The strings will be compared against the above strings
 * If there is a match the function will be called from the same string
 */
int (*_builtins[])(char**) = {
    &__cd,
    &__exit,
    &__status
};
/* Simply prints the home screen
 * Clears visible stdout data
 */ 
void init(void) {
    system("clear");
    getcwd(home, 100);
    puts("Welcome to smallsh");
}
/* reads a line fron the terminal and determines if its valid */
char *read_line(void) {
    char *line = 0;
    size_t size = 0;
    int status;
    status = getline(&line, &size, stdin);
    if (status == -1 || strcmp(line,"\n") ==0) {
        return NULL;
    }
    return line;
}
/* Parses the input line into tokens
 * These tokens are then fed into the shell to be executed
 * strtok is a glibc function that tokenizes a string with delimiters
 * Sets flags for background processes and redirection
 * Detects comment lines
 * Maximum input size is 50 tokens
 */
char **parse(char *line) {
    int size = 50;
    int pos = 0;
    char *token;
    char **tokens = malloc(size * sizeof(char*));
    background = FALSE;
    token = strtok(line, " \t\n\r\a");
    if (token[0] == '#') {
        return NULL; 
    }
    redir_in  = FALSE;
    redir_out = FALSE;
    while (token != NULL) {
        if (strcmp(token, ">") == 0) {
            redir_out = TRUE;
            pos++;
            token = strtok(NULL, " \n\r\t");
            strcpy(outfile, token);
            pos++;
        } else if (strcmp(token, "<") == 0) {
            redir_in = TRUE;
            pos++;
            token = strtok(NULL, " \n\r\t");
            strcpy(infile, token);
            pos++;
        } else {
            tokens[pos] = token;
        }
        if (pos >= size) {
            printf("segmentation fault: smallsh buffer overflow\n\n");
        }
        pos++;
        token = strtok(NULL, " \n\r\t");

    }
    if (tokens[pos-1] != NULL) {
        if (strcmp(tokens[pos-1], "&") == 0) {
            background = TRUE;
            tokens[pos-1] = NULL;
        }
    }
    return tokens;
}
/* cd is done by changing directory with chdir
 * if there are no arguments supplied, then chdir goes to HOME
 */
int __cd(char **args) {
    if (args[1] == NULL) {
        if (chdir(home) != 0) {
            perror("smallsh: ");
        }
    } else {
        if (chdir(args[1]) != 0) {
            perror("smallsh: ");  
        }
    }
    last_exit = 0;
    return last_exit;
}
/* exits the shell */
int __exit(char **args){
    last_exit = 1;
    exit(1);
}
/* returns the last known exit status */
int __status(char **args) {
    printf("exit status %d\n", last_exit);
    last_exit = 0;
    return last_exit;
}
/* This signal handler does the specific operations for each signal
 * SIGCHILD is thrown to the parent if the child returns, this signal should come with a message
 * SIGTERM should come with a terminated status message
 */
void sig_catch(int signal) {
    switch (signal) {
        case SIGHUP:
            break;
        case SIGCHLD:
            if (background) {
                while (waitpid(-1, NULL, WNOHANG) > 0) { }
                printf("background pid %d done: exit code 0\n", getpid()+2); 
                puts(": ");
            }
            break;
        case SIGINT:
            break;         
        case SIGTERM:
            printf("background pid %d is done: terminated by signal %d\n", back_pid, signal);
            break;
        default:
            fprintf(stderr, "Caught unknown signal: %d\n", signal);
            return;
            break;
    }
}
/* calls the signal catcher:
 * for SIGTERM, the process needs to be killed
 * others are handled in the actual catcher
 */
int signal_handler(int pid) {
    struct sigaction signal;
    signal.sa_handler = &sig_catch;
    sigfillset(&signal.sa_mask);
    sigaction(SIGHUP, &signal, NULL);
    sigaction(SIGINT, &signal, NULL);
    sigaction(SIGCHLD, &signal, NULL);
    if (sigaction(SIGTERM, &signal, NULL) == -1) {
        kill(pid, SIGTERM);
    }
    return 1;
}
/* Handles all the shell calls that aren't builtin
 * the function looks for signals, 
 * forks and then execs the program
 * Background processes and redirection are also handled here
 */
int spawn(char **args) {
    int status = 0;
    pid_t pid  = 0;
    pid_t back_pid = 0;
    pid = fork();
    if (background) {
        back_pid = getpid();
        signal_handler(back_pid);
    }
    signal_handler(pid);
    int in, out, err;
    /* Child process */
    if (pid == 0) {
        /* dup file descriptors into stdin and stdout dups 
         * and close when done
         */
        if ((redir_in == TRUE) || (redir_out == TRUE)) {
            in = open(infile, O_RDONLY);
            out = open(outfile, O_WRONLY | O_TRUNC | O_CREAT, S_IRUSR);
            dup2(in, 0);
            dup2(out, 1);
            close(in);
            close(out); 
        }
        /* if the process is supposed to be run in the background:
         * pipe everything to /dev/null
         * get the new PID
         * catch signals (SIGCHILD in particular)
         * close duplicated files when done
         */
        if (background) {
            back_pid = getpid();
            printf("background pid is %d\n: ", back_pid);
            fflush(stdin);
            fflush(stdout);
            in  = open("/dev/null", O_RDONLY);
            out = open("/dev/null", O_RDWR);
            err = open("/dev/null", O_RDWR);
            dup2(in, 0);
            dup2(out, 1);
            dup2(err, 2);
            close(in);
            close(out); 
            close(err); 
            signal_handler(back_pid);
        }
        /* exec with the tokens */
        if (execvp(args[0], args) == -1) {
            perror("smallsh: ");
        }
        last_exit = 1;
        exit(1);
     /* error */
     } else if (pid < 0) {
        perror("smallsh: ");
     /* Parent process */
     } else {
        do {
            /* wait for child to return, dont want to wait in background*/
            if (background) {
                waitpid(pid, &status, WNOHANG);
            } else {
                waitpid(pid, &status, WUNTRACED);
            }
        } 
        while (!WIFEXITED(status) && !WIFSIGNALED(status));   
        /* check for exit status to feed to __status command */
        if (WEXITSTATUS(status) != 0) {
            last_exit = 1;
            return last_exit;   
        }
    }
    last_exit = 0;
    return last_exit;
}
/* pool recieves the string from the tokenizer
 * It checks to see if any of the tokens match a function pointer
 * It executes the builtin, or it sends the command to the exec function
 */
int pool(char **args) {
    int i = 0;
    if (args[0] == NULL) {
        last_exit = 0;
        return last_exit;
    } 
    for (i = 0; i < 3; i++) {
        if(strcmp(args[0], _builtin_names[i]) == 0) {
            return (*_builtins[i])(args);
        }
    }
    return spawn(args);
}
/* The main shell loop, the function:
 * Catches waiting signals
 * parses the input string
 * then executes the commands
 * Repeat
 */
void shell(void) {
    int status = 1;
    while(status != -1) {
        signal_handler(getpid());
        printf(": ");
        char *line;
        char **args;
        line = read_line();
        if (line != NULL) {
            args = parse(line);
            if (args) {
                status = pool(args);
            }
        }
    }
}
/* The entry point doesn't accomplish much 
 * It prints the init screen
 * and then enters the shell
 * The program exits when the shell exits
 */
int main (int argc, char **argv) {
    init();
    shell();
    return 0;
}
