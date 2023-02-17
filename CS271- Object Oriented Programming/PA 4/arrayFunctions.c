// CS 271 -       PA 4
// Program Name:  arrayFunctions.c
// Author:        Marco Andres Gomez Fierro
// Date:          9/23/2021
// Purpose:       First source file

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

#include "arrayFunctions.h"

void printIntArray ( int array[], int sizearray ){

    for ( int i = 0; i < sizearray; i++ ){  //Goes through each array element and prints it
        printf ( "%6d", array[i] );
        if ( ( i % 10) == 9 )               //Creates new line if theres 10 digits
            printf ( "\n" );
    }//end of for

}//end of printIntArray

void printCharArray ( char arrayc[] , int sizearrayc ){

    for ( int i = 0; i < sizearrayc; i++ ){ //Goes through each element in array

        printf ( "%c ", arrayc[i] );
        if ( ( i % 10) == 9 )               //Creates new line if theres 10 digits in the line
            printf ( "\n" );
    }//end of for

}//end of printCharArray

int arrayMin ( int minarray[] , int sizearraymin ){

    //Initializing Variables

    int minima = minarray[0];

    for ( int i = 0; i < sizearraymin; i++ )//Goes through each element in the array
        if ( minima > minarray[i] )         //Tests if the array element is the lowest number
            minima = minarray[i];

    return minima;                          //Returns value (int)

}//end of arrayMin


int countLetters ( char arrayct[], int sizearrayl){

    //Initializing Variables

    int count = 0;

    for ( int i = 0; i < sizearrayl; i++ )
        if ( ( arrayct[i] >= 'A' && arrayct[i] <= 'Z' ) || ( arrayct[i] >= 'a' && arrayct[i] <= 'z' ))   //Counts amount of letters
            count++;

    return count;                           //Returns value (int)

}//end of countLetters


int numMatches ( int array1[], int array2[], int sizing ){

    //Initializing Variables

    int count = 0;

    for ( int i = 0; i < sizing; i++ )
        if ( array1[i] == array2[i] )
            count++;


    return count;                           //Returns value (int)

}//end of numMatches


