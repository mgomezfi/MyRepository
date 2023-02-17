// CS 271 -       PA 4
// Program Name:  pa4.c
// Author:        Marco Andres Gomez Fierro
// Date:          9/23/2021
// Purpose:       Second Source File


#include "arrayFunctions.h"
#include <stdio.h>
int main(void) {

    //Testing printIntArray
    printf( "Testing printIntArray:\n" );
    int array[20] = { 534, 76542, 22, 6, 98, 10, 3, 4, 13, 7432, 434, 5, 2431, 765, 77233, 0, 54, 6543, 65, 9 };
    printIntArray( array, 20);
    printf("\n");

    //Testing printCharArray
    printf( "Testing printCharArray:\n" );
    char arraytest[30] = {'C', 'o', 'm', 'p', 'u', 't', 'e', 'r', ' ', 'S', 'c', 'i', 'e', 'n', 'c', 'e', ' ', 'R', 'o', 'c', 'k', 's', '!', '-', ' ', 'M', 'a', 'r', 'c', 'o'};
    printCharArray( arraytest, 30);
    printf("\n");

    //Testing arrayMin
    printf( "Testing arrayMin:\n" );
    int array1[20] = { 534, 76542, 22, 6, 98, 10, 3, -200, 13, 7432, 434, 5, 2431, 765, 77233, 0, 54, 6543, 65, 9 };
    printf("%5d\n", arrayMin( array1, 20 ));

    //Testing countLetters
    printf( "Testing countLetters (Computer Science Rocks!- Marco):\n%5d\n", countLetters( arraytest, 30 ));

    //Testing numMatches
    printf( "Testing numMatches:\n" );
    int arraym[10] = { 425, 654, 35, 245, 0, 92, -34, 76, 923, -988 };
    int arrayn[10] = { 425, 8, 35, 87, 0, 92, -34, 54, 0, -988 };
    printf ("%d\n", numMatches ( arraym, arrayn, 10));

}
