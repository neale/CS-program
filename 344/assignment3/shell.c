#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/wait.h>

#define TRUE 1
#define FALSE 0


int __cd(char **args);
int __ls(char **args);
int __exit(char **args);
int __status(char **args);

int last_exit = 0;

char *_builtin_names[] = {
    "__ls",
    "__cd",
    "__exit",
    "__status"
};
int (*_builtins[])(char**) = {
    &__ls,
    &__cd,
    &__exit,
    &__status
};
void init(void) {
    system("cls");
    puts("Welcome to Enterm\n");
}
char *read_line(void) {
    char *line = 0;
    size_t size = 0;
    getline(&line, &size, stdin);
    printf("%s\n\n", line);
    return line;
}
char **parse(char *line) {
    int size = 50;
    int pos = 0;
    char *token;
    char **tokens = malloc(size * sizeof(char*));

    token = strtok(line, " \t\n\r");
    while (token != NULL) {
        tokens[pos] = token;
        pos++;
        if (pos >= size) {
            printf("Sefmentation Fault: EnTerm Buffer overflow\n\n");
        }
        token = strtok(NULL, " \n\r\t");
    }
    tokens[pos] = NULL;
    return tokens;
}
int spawn(char **args) {
    pid_t pid;
    pid_t wpid;
    int status;
    pid = fork();
    if (pid == 0) {
        if (execvp(args[0], args) == -1) {
            perror("child init");
        }
        exit(1);
    } else if (pid < 0) {
        perror("child error");
    } else {
        do {
            wpid = waitpid(pid, &status, WUNTRACED);
        } while (!WIFEXITED(status) && !WIFSIGNALED(status));    
    }
    last_exit = 1;
    return last_exit;
}
int __cd(char **args) {
    if (args[1] == NULL) {
        fprintf(stderr, "EnTerm: expected argument to \"cd\"\n");
    } else {
        if (chdir(args[1]) != 0) {
            perror("EnTerm");  
        }
    }
    last_exit = 1;
    return last_exit;
}
int __ls(char **args) {
    DIR *d;
    struct dirent *dir;
    char *lsdir = args[1];
    if (lsdir == NULL) {
        d = opendir(".");
    } else {
        d = opendir(lsdir);
    }
    if (d) {
        while ((dir = readdir(d)) != NULL) {
            printf ("%s\n", dir->d_name);
        }
    } else {
        perror("ls error");
    }
    last_exit = 1;
    return last_exit;
}
int __exit(char **args){
    return 0;
}
/*int _builtin_status(char **args) {

}*/
int pool(char **args) {
    int i = 0;
    if (args[0] == NULL) {
        last_exit = 1;
        return last_exit;
    }
    for (i = 0; i < 4; i++) {
        if(strcmp(args[0], _builtin_names[i]) == 0) {
            return (*_builtins[i])(args);
        }
    }
    return spawn(args);
}
void shell(void) {
    int status = 1;
    while(status) {
        puts(": ");
        char *line;
        char **args;
        line = read_line();
        args = parse(line);
        status = pool(args);
        free(line);
        free(args);
    }
}

int main (int argc, char **argv) {

    init();
    shell(); 
    return 0;
}


