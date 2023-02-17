// CS 271 -       PA 3
// Program Name:  pa3.c
// Author:        Marco Andres Gomez Fierro
// Date:          9/8/2021
// Purpose:       Use a sentinel loop to add together the debits and credits


#include "pa3functions.h"
#include <stdio.h>
int main(void) {

    //Initializing variables
    int Inputf;

    //Diagonal Function test

    while ( Inputf < 1 || Inputf > 9 ){
        printf("Input number between 1 and 9.\n");
        scanf ( "%d" , &Inputf );
    }

    diagonal ( Inputf );


    //Testing alphabet function

    //Parameters U and 5

    alphabet ( 'U' , 5 );

    //Parameters L and 8

    alphabet( 'L', 8 );

    //Parameters X and 10

    alphabet( 'X' , 10 );


    //Testing randomNumbers function

    for ( int y = 99 ; y > -1 ; y-- ){

        printf ( "%5d" , randomNumber ( 100, 200) );
        if ( ( y % 10 ) == 0 )

            printf("\n");

    }

}
