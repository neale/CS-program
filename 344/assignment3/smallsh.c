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

int last_exit  = 0;
int background = FALSE;
int back_pid = FALSE;
int redir_out   = FALSE;
int redir_in = FALSE;
static char outfile[50] = {0};
static char infile[50]  = {0};
static char home[100]    = {0}; 
char *_builtin_names[] = {
    "cd",
    "exit",
    "status"
};
int (*_builtins[])(char**) = {
    &__cd,
    &__exit,
    &__status
};

void init(void) {
    system("clear");
    getcwd(home, 100);
    puts("Welcome to smallsh");
}
char *read_line(void) {
    char *line = 0;
    size_t size = 0;
    int status;
    status = getline(&line, &size, stdin);
    if (status == -1 || strcmp(line,"\n")==0) {
        return NULL;
    }
    return line;
}
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
int __exit(char **args){
    last_exit = 1;
    exit(1);
}
int __status(char **args) {
    printf("exit status %d\n", last_exit);
    last_exit = 0;
    return last_exit;
}
void sig_catch(int signal) {
    int status = 0;
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

int spawn(char **args) {
    int status = 0;
    pid_t pid  = 0;
    pid_t wpid = 0;
    pid_t sid  = 0;
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
        /* dup file descriptors into stdin and stdout dups */
        if ((redir_in == TRUE) || (redir_out == TRUE)) {
            in = open(infile, O_RDONLY);
            out = open(outfile, O_WRONLY | O_TRUNC | O_CREAT, S_IRUSR);
            dup2(in, 0);
            dup2(out, 1);
            close(in);
            close(out); 
        }
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
int pool(char **args) {
    int i = 0;
    int j = 0;
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
int main (int argc, char **argv) {
    init();
    shell();
    return 0;
}
