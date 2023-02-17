// CS 271 -       PA 6
// Program Name:  pa6.c
// Author:        Marco Andres Gomez Fierro
// Date:          10/04/2021
// Purpose:       Second Source File


#include "textfunctions.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
int main(void) {

    printf( "THIS FILE TEST EACH FUNCTION INDEPENDENTLY, NOT ONE AFTER THE OTHER\n\n");
    char line[80];
    char line1[80];
    int count;
    FILE *cfPtr;
    if ( (cfPtr = fopen( "lines.txt", "r" )) == NULL) {
        puts( "File could not be opened\n");

    }//end of if
    else {
        while ( !feof( cfPtr ) ) {
            fgets( line, 80, cfPtr );
            strcpy(line1, line);
            printf( "Original Line Reads:  %s\n\n", line );

            removePunctuation(line1);
            printf( "After RemovePunctuation() Line Reads:  %s\n\n", line1 );
            strcpy(line1, line);
            stringSort(line1);
            printf( "After stringSort() Line Reads:  %s\n\n", line1 );
            strcpy(line1, line);
            blockPrint(line1);
            printf( "After blockPrint() Line Reads:  %s\n\n", line1 );
            strcpy(line1, line);

        } // end whilefclose ( cfPtr );

    } // end else


}//end of main
