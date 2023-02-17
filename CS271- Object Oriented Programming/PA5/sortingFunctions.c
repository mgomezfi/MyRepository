// CS 271 -       PA 5
// Program Name:  sortingFunctions.c
// Author:        Marco Andres Gomez Fierro
// Date:          9/30/2021
// Purpose:       Source file

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

#include "sortingFunctions.h"

int selectionSort ( int * const data, int size ){

    //Initialization of Variables
    int tempo, swapindx, minimum = *(data + 0), count = 0;
    for ( int x = 0; x < size; x++ ){

        minimum = *(data + x);

        for( int y = x; y < size; y++){ //Assumes anything before it is sorted

            count++;

            if( *(data + y) < minimum){//Determines where is the minimum in the unsorted part and catalogs the value and its index value

                minimum = *(data + y);
                swapindx = y;
            }//end of if

        }//end of for

        //Swaps walues of the first index with that of smallest number
        tempo = *(data + x);
        *(data + x) = minimum;
        *(data + swapindx) = tempo;
    }//end of for

    return count;

}//end of selectionSort

int insertionSort ( int * const data, int size ){

    int index, exchange, count = 0;

    for ( int k = 1; k < size; k++ ){   // Goes through each element ( not including the first one, index 0)

        if (  *( data + k)  <  *( data + k - 1 ) ){
            // If the current element in the for loop is less than the previous, it goes through the program to modify array

            count++;

            exchange = *( data + k);

            for ( int l = k - 1; l >= 0; l--){

                // Goes through the elements previous to k

                if ( *( data + l ) < *( data + k )){

                    //If element is < k, then placement is after this elements

                    count++;

                    for ( int m = l + 1; m < size; m++ ){
                        //Moves over elements to make space where the k element is going

                        *( data + ( m + 1 )) = *( data + m );

                    }//end of for

                    *( data + l) = exchange; //Places value

                }//end of if

            }//end of for

        }//end of if

    }//end of for

}//end of insertionSort

void swap ( int * num1, int * num2 ){

    int temporary = *num1; //Holds value temporarily
    *num1 = *num2;
    *num2 = temporary;

}//end of swap


void fillArray( int * const data, int size, int min, int max ){

    srand( time(NULL) );//rand initializer

    for ( int n = 0; n < size; n++ ){// Goes through each array value

        *( data + n) = rand( ) % (max - min + 1) + min;//Assigns random int

    }//end of for

}//end of fillArray


void neatPrint ( int * const data, int size, int numPerLine, int fieldSize ){

    for ( int i = 0; i < size; i++ ){

        printf("%*d ", fieldSize, *(data + i));

        if ( ( i % numPerLine) == ( numPerLine -1 ) )
            printf ( "\n" );

    }//end of for

    printf("\n");

}//end of neatPrint


