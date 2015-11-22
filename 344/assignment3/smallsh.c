#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/wait.h>
#include <fcntl.h>

#define TRUE 1
#define FALSE 0
#define FILE_NAME_SIZE 50

int __cd(char **args);
int __exit(char **args);
int __status(char **args);

int last_exit  = 0;
int background = FALSE;
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
        }
        else {
            tokens[pos] = token;
        }
        pos++;
        if (pos >= size) {
            printf("segmentation fault: smallsh buffer overflow\n\n");
        }
        token = strtok(NULL, " \n\r\t");
    }
    tokens[pos] = NULL;
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
    switch (signal) {
        case SIGHUP:
            break;
        case SIGCHLD:
            break;
        case SIGINT:
            break;         
        case SIGTERM:
            perror("background pid %d is done: terminated by signal 15\n");
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
    if (background) {
        sigaction(SIGCHLD, &signal, NULL);
    }
    if (sigaction(SIGTERM, &signal, NULL) == -1) {
        kill(pid, SIGTERM);
    }
    return 1;
}

int spawn(char **args) {
    pid_t pid;
    pid_t wpid;
    int status;
    pid = fork();
    signal_handler(pid);
    int in, out;
    if (pid == 0) {
        if ((redir_in == TRUE) || (redir_out == TRUE)) {
            in = open(infile, O_RDONLY);
            out = open(outfile, O_WRONLY | O_TRUNC | O_CREAT, S_IRUSR);
            dup2(in, 0);
            dup2(out, 1);
            close(in);
            close(out); 
        }
        if (execvp(args[0], args) == -1) {
            perror("smallsh: ");
        }
        last_exit = 1;
        exit(1);
     } else if (pid < 0) {
        perror("smallsh: ");
     } else {
        do {
            wpid = waitpid(pid, &status, WUNTRACED);
        } while (!WIFEXITED(status) && !WIFSIGNALED(status));   
        if (WEXITSTATUS(status) != 0) {
            last_exit = 1;
            return last_exit;   
        }
        //printf("background pid %d is done: exit value 0", pid); 
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
    for (i = 0; args[i] != NULL; i++); 
    for (j = 0; args[i-1][j] != 0; j++);
    if (strcmp(&args[i-1][j-1], "&") == 0) {
        background = TRUE;
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
