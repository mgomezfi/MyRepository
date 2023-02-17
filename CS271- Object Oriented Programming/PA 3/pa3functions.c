// CS 271 -       PA 3
// Program Name:  pa3functions.c
// Author:        Marco Andres Gomez Fierro
// Date:          9/8/2021
// Purpose:       Use a sentinel loop to add together the debits and credits

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

#include "pa3functions.h"


void diagonal ( int number ) {

    while ( number >= 0 ){

        for ( int j = number ; j > 0; j-- )//Inserts Spaces

            printf ( " " );

        printf ( "%d\n", number );

        number--;

    }// end of while loop

} // end of diagonal



void alphabet ( char letterCase, int lettersPerLine ) {

    //Initializes of variables

    char chr;
    int count = 0;
    int capitalization = (int) letterCase;

    if  ( capitalization == 85 && lettersPerLine > 0 ) {   // Conditions for Uppercase Alphabet to print

        for ( int index = 65; index < 91; index++ ){

            count++;
            chr = (char) index;
            printf ( "%c", chr );
            printf( ( count % lettersPerLine) == 0 ? "\n" : "" );

        }//end of for

    }//end of if statement


    else if ( capitalization == 76 && lettersPerLine > 0 ) {  // Conditions for Lowercase Alphabet to print

        for ( int index = 97; index < 123; index++ ){

            count++;
            chr = (char) index;
            printf ( "%c", chr );
            printf( ( count % lettersPerLine) == 0 ? "\n" : "" );

        }//end of for

    }else{   //If conditions arent met, then error message is printed

        printf( "Error" );

    }//end of else

    printf( "\n" );

} //end alphabet


int randomNumber ( int min, int max ) {

    if ( min > max ) {
        printf("Error");
        return 0;
    }//end of if

    int randomNumber;
    randomNumber = rand( ) % (max -min + 1) + min;
    return randomNumber;

}//end of randomNumber



