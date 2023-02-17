// CS 271 -       PA 5
// Program Name:  pa5.c
// Author:        Marco Andres Gomez Fierro
// Date:          9/30/2021
// Purpose:       Source File


#include <stdio.h>
#include <stdlib.h>
#include "sortingFunctions.h"
#define ARRAYSIZE 10
int main (void) {
    // dynamically allocate memory space for an array

    int * arrayPtr = (int *) malloc (ARRAYSIZE * sizeof(int));

    // fill the array with random integers

    fillArray( arrayPtr, ARRAYSIZE, 1, 100 );

    // print the array, 10 elements per line

    neatPrint ( arrayPtr, ARRAYSIZE, 10, 4 );

    // sort the array using selection sort and print the return value

    int selec = selectionSort ( arrayPtr, ARRAYSIZE );
    printf( "Amount of if statements executed in selectionSort: %d\n", selec);

    // print the array, 10 elements per line

    neatPrint ( arrayPtr, ARRAYSIZE, 10, 4 );

    // fill the array again with random integers

    fillArray( arrayPtr, ARRAYSIZE, 1, 100 );

    // print the array

    neatPrint ( arrayPtr, ARRAYSIZE, 10, 4 );

    // sort with insertion sort and print the return value

    int insrtion = insertionSort ( arrayPtr, ARRAYSIZE );
    printf( "Amount of if statements executed in insertionSort: %d\n", insrtion);

    // print the array

    neatPrint ( arrayPtr, ARRAYSIZE, 10, 4 );

}
