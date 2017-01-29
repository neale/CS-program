/* *******************
 * Assignent 2: CS344
 * Neale Ratzlaff
 * 2 November 2015
 * *******************/

/* 
   I have completely ignored the 80 char per line convention. 
   I am so sorry
   */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/stat.h>
#include <string.h>
#define TRUE   1
#define MARKED 1
#define FALSE  0

/* stat structure boilerplate to check if directory exists */
struct stat st = {0};

/* structure to hold data about the player 
 * as they move through the building 
 */
typedef struct {

    char starting_room[14];
    char current_room[14];
    uint8_t curr;           // holds the number of the current room
    char end_room[14];    
    int steps;              // how many rooms the user has gone through
    char rooms[50][14];     /* The names of the rooms that the user has gone through
                             * I'm assuming the user isn't dumb enough to go back and forth 50 times 
                             */    
} Player;

typedef struct {

    char name[14];                // Room name
    char type[12];                // Room type
    uint8_t connections[6][2];  // Connections container
    uint8_t n;                  // Number of connections

} Room;

/* Fisher-Yates shuffle algorithm,
 * Depending on rand(), it will randomly arrange an array
 * Shuffling an array is the easiest way of generating unique random numbers
 */   
void yates_shuffle(uint8_t * nums, uint8_t size, uint8_t max, uint8_t min) {

    int rn = 0;
    uint8_t i = 0;
    uint8_t temp = 0;

    for (temp = 0, i = min; temp < size; i++, temp++) {
        nums[temp] = i;
    } 
    srand(time(NULL));

    for (i = size-1; i > 0; i--){
        rn = rand() % i;   
        temp = nums[i];
        nums[i] = nums[rn];
        nums[rn] = temp;
    }
}

/* Algorithm to generate purmutations is too slow
 * Instead we will sue a lookup table since there are only
 * 21 different options for each connections
 * Essentially we are generating a undirected acyclic graph, pretty routine
 * Format:
 [ room1, room2, marked ]
 Room 1 and room2 form a connection, 
 The marked keyword is set to MARKED (1) upon being selected as a vaid connection
 */
void generate_connections(Room rooms[8]) {
    uint8_t purmutations[21][3] = {
        {1, 2, FALSE}, {1, 3, FALSE}, {1, 4, FALSE}, {1, 5, FALSE}, {1, 6, FALSE}, {1, 7, FALSE},
        {2, 3, FALSE}, {2, 4, FALSE}, {2, 5, FALSE}, {2, 6, FALSE}, {2, 7, FALSE},
        {3, 4, FALSE}, {3, 5, FALSE}, {3, 6, FALSE}, {3, 7, FALSE}, 
        {4, 5, FALSE}, {4, 6, FALSE}, {4, 7, FALSE}, 
        {5, 6, FALSE}, {5, 7, FALSE},
        {6, 7, FALSE} };

    uint8_t j = 0;
    uint8_t i = 0;
    uint8_t fnum = 0;
    uint8_t snum = 0;
    uint8_t rand_all[21] = {0};

    /* There is nothing obscure here. Its actually the dumbest way to do it right
     * Shuffle the deck, iterate through each room, and check if it has the required amount of rooms
     * when it doesn't, go though the whole deck of connections looking for an unmarked one
     * When it finds a "hallway" that has not been used, use and mark it. 
     * 
     * It also keeps track of how many connections each room has, and how amny connections in total exist
     */

    yates_shuffle(rand_all, 21, 20, 0);
    for (i = 1; i < 8; i++) {
        if (rooms[i].n < 3) {
            j = 0;
            while (rooms[i].n < 3) {
                fnum = purmutations[rand_all[j]][0];
                snum = purmutations[rand_all[j]][1];
                if (purmutations[rand_all[j]][2] != MARKED && ((fnum == i || snum == i))) {
                    memcpy(rooms[fnum].connections[rooms[fnum].n], purmutations[rand_all[j]], 2*sizeof(uint8_t));
                    memcpy(rooms[snum].connections[rooms[snum].n], purmutations[rand_all[j]], 2*sizeof(uint8_t));
                    purmutations[rand_all[j]][2] = MARKED;
                    rooms[fnum].n++;
                    rooms[snum].n++;
                }
                j++;
            }
        }
    }
}
/* Assigns a name to each room in the structure
 * again, all things taken from Mean Girls, you should watch it
 * A range of numbers are shuffled, then names are assigned in that order
 */
void generate_names(Room rooms[8]) {

    char names[10][14] = { "Regina", "BurnBook", "Katy", "Fetch",
                          "CoachCarr", "Gretchen", "Damian", "Aaron", 
                          "Mathletes", "KevinG" };

    uint8_t i = 0;
    uint8_t randname[7] = {0};
    yates_shuffle(randname, 7, 6, 0);
    for (i = 1; i < 8; i++) {    

        memcpy(rooms[i].name, names[randname[i]], sizeof(names[randname[i]]));
    }            
}
/* Assigns a type to each room 
 * Start and end are random as above, then mid is assigned to each other room
 */
void generate_type(Player * neale, Room rooms[8]) {

    uint8_t i = 0;
    char start[12] = "START_ROOM\0";
    char end[9]    = "END_ROOM\0";
    char mid[9]    = "MID_ROOM\0";
    uint8_t endpoints[7] = {0};
    yates_shuffle(endpoints, 7, 7, 1);

    memcpy(rooms[endpoints[0]].type, start, sizeof(start));
    memcpy(neale->starting_room, rooms[endpoints[0]].name, sizeof(rooms[endpoints[0]].name));
    neale->curr = endpoints[0];

    memcpy(rooms[endpoints[1]].type, end, sizeof(end));
    memcpy(neale->end_room, rooms[endpoints[1]].name, sizeof(rooms[endpoints[1]].name));

    for (i = 2; i < 7; i++) {
        memcpy(rooms[endpoints[i]].type, mid, sizeof(mid));
    }
}
/* Temp files are created here in an array. I chose to never reference them 
 * because they aren't visable to someone working on your code. A global structure
 * will always make more sense if you aren't working under odd constraints 
 * FileIO is also rife with signal collisions in C, so working as local as possible is preferred
 * Each File is written with no extension, with its name, type, and connections as per the spec 
 */
void write_files(Room rooms[8]) {

    int i = 0;
    int j = 0;
    uint8_t fnum = 0;
    uint8_t snum = 0;
    FILE *frooms[8] = {0};
    for (i = 1; i < 8; i++) {
        frooms[i] = fopen(rooms[i].name, "wr+");
        fprintf(frooms[i], "ROOM NAME: %s\n", rooms[i].name);
        for (j = 0; j < rooms[i].n; j++) {
            fnum = rooms[i].connections[j][0];
            snum = rooms[i].connections[j][1];
            if (fnum != i) {
                fprintf(frooms[i], "CONNECTION %d: %s\n", j+1, rooms[fnum].name);
            } else if(snum != i){
                fprintf(frooms[i], "CONNECTION %d: %s\n", j+1, rooms[snum].name);
            } 
        }
        fprintf(frooms[i], "ROOM TYPE: %s\n", rooms[i].type); 
        fclose(frooms[i]);
    }
} 
/* I really like this start up screen, like someone reallly wants to get out of her head
 * Otherwise, it assigns the start room to the current room
 */
void start_up_display(Player *neale, Room rooms[8]) {
    puts("\n\n\n\n\n");
    printf("WELCOME TO LINDSEY LOHAN'S MIND \n\n");
    printf(" HOW FAST CAN YOU ESCAPE!!!!11 \n\n");
    printf("    ----------------------   \n" 
            "  |                      |  \n" 
            "  |                      |  \n"
            "  |                      |  \n"
            "  |           O          |  \n"
            "  |          /|-  > >    |  \n"
            "  |           ^          |  \n"
            "  |                      |  \n"
            "  |                      |  \n"
            "   ---------------------- \n\n");
    memcpy(neale->current_room, neale->starting_room, sizeof(neale->starting_room));
}  
/* The end screen reflects the escape back into the outdoors. 
 * The contents of the player object that hold the number of steps taken, 
 * as well as what rooms were entered is also referenced to print a final status
 */
void end_room_display(Player *neale) {
    int i = 0;
    puts("\n\n\n\n\n");
    printf("    ----------------------   \n" 
            "  | *   | *   *    *     |  \n" 
            "  |    -O-     *     *   |  \n"
            "  |  *  |   *     *      |  \n"
            "  |           o          |  \n"
            "  |          -|-         |  \n"
            "  |___________^__________|  \n"
            "  |                      |  \n"
            "  |                      |  \n"
            "   ---------------------- \n\n");
    
    printf("YOU HAVE FOUND THE END ROOM. CONGRATULATIONS! \n\n");
    printf("YOU TOOK %d STEPS. YOUR PATH TO VICTORY WAS: \n\n", neale->steps);    
    for (i = 0; i < neale->steps; i++) {
        printf("%s\n", neale->rooms[i]);
    }
    return;
}
/* This is the main loop of the game. Here we have achieved some sort of haggard OO C coding
 * The current location is printed, with all the connections associated with it
 * The prompt is then displayed and blocks until correct user input is given. 
 * each time user input fails to be valid, an error is displayed and the prompt repeated.
 * If the user chooses the correct option, the program starts the exit routine
 */ 
void PLAYYYYY(Player * neale, Room rooms[8]) {

    int i = 0;
    int j = 0;
    char addr[40];
    char * room1;
    char * room2;
    char curr[14];
    char opt[6][14] = {{0}};
    uint8_t escape = FALSE;
    int k = 0;
    while(1) {

        memcpy(curr, neale->current_room, sizeof(neale->current_room));
        /* look up the current room in the Room structure */
        for (i = 0; i < 7; i++) {
            if (!strcmp(neale->current_room, rooms[i].name)) {
                neale->curr = i;
            }
        }
        printf("\n\nCURRENT LOCATION: %s\n", neale->current_room);
        printf("POSSIBLE CONNECTIONS: ");
        /* Get all the connections to the room, make sure the connection
           is to another room, not itself, then add to an array for later reference
         */
        for (j = 0; j < rooms[neale->curr].n; j++) {
            room1 = rooms[rooms[neale->curr].connections[j][0]].name;
            room2 = rooms[rooms[neale->curr].connections[j][1]].name;
            if (!strcmp(room1, rooms[neale->curr].name)) { 
                printf("%s, ", room2);
                strcpy(opt[j], room2);
            } else {
                printf("%s, ", room1);
                strcpy(opt[j], room1);
            } 
        }
        /* flag variable for loop */
        escape = FALSE;

        /* get user input for next step */
        printf("\nWHERE TO? >");
        scanf("%s", addr);
        /* repeat until input is valid, once it is, add to steps, 
           change current room, and check if it wins */
        for(i = 0; i < rooms[neale->curr].n; i++) {
            if (!strcmp(addr, opt[i])) {
                memcpy(neale->current_room, opt[i], sizeof(opt[i]));
                neale->steps++;
                memcpy(neale->rooms[k], opt[i], sizeof(opt[i]));
                k++;
                escape = TRUE;
                if (!strcmp(opt[i], neale->end_room)) {
                    return;
                }
                break;
            }
        } 
        /* error message on invalid user input */
        if (!escape) {
            printf("\n\nHUH? I DON’T UNDERSTAND THAT ROOM. TRY AGAIN.\n\n");
        }
    }
}

int main(int argc, char **argv) {

    int i = 0;
    char dirname[22];
    int pid = getpid();
    /* Structure of Lohan's mind */
    Room rooms[8] = {{{0}}};
    Player neale  = {{0}}; // satisfy the almighty compiler
    char username[16] = "ratzlafn.rooms.";
    generate_names(rooms);        //build the rooms
    generate_connections(rooms);  //build the connections
    generate_type(&neale, rooms); //give types to rooms

    /* create the directory to house the temp files */
    sprintf(dirname, "%s%d", username, pid);
    if (stat(dirname, &st) == -1) {
        mkdir(dirname, 0777);
    }
    /* cd into the created directory */
    chdir(dirname);
    write_files(rooms);           //write generated data to files
    start_up_display(&neale, rooms); //start the game
    PLAYYYYY(&neale, rooms);         //middle game
    end_room_display(&neale);        //end game
    
    /* exit with code 0 */
    return 0;
}
