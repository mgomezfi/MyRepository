// CS 271 -       PA 6
// Program Name:  textfunctions.c
// Author:        Marco Andres Gomez Fierro
// Date:          10/04/2021
// Purpose:       Source file

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
#include <string.h>

#include "textfunctions.h"

void removePunctuation( char * myString){// Removes everything except digits, spaces, letters, and NULLS

    //Initilization

    int length = strlen(myString), asciicomp, count = 0;
    char newString[length];

    //for loop that checks if char is a letter, digits, or spaces. If it is it is added to a new string that is then coppied

    for ( int i = 0; i < length-1; i++){

        if ( isalnum(myString[i]) ){

            *(newString+count) = *(myString+i);
            count++;

        }//end of if

    }//end of first for

    //Indicates end of string
    newString[count+1] = '\0';

    strcpy( myString, newString);
}//end of removePunctuation

void stringSort( char * sortingstring){

    //Initialization

    int length = strlen(sortingstring), count = 0;
    char newString[length];

    //Removes the spaces in the string

    for ( int i = 0; i < length; i++){

        if ( toascii(sortingstring[i]) != 32){

            *(newString+count) = *(sortingstring+i);
            count++;

        }//end of if

    }//end of first for

    //Indicates end of string
    newString[count+1] = '\0';
    strcpy( sortingstring, newString);

    //////////Sorting of String

    //More Initialization
    length = strlen(sortingstring);

    int min = toascii(sortingstring[0]), test = 0;
    char temp;

    for (int j = 0; j < length-1; j++){
        min = j;

        for( int k = j+1; k < length; k++){
            test = k;

            if( toascii(sortingstring[test]) < toascii(sortingstring[min]))//Determines if its less than the smallest digit that hasnt been checked
                min = test;

        }//end of for

        //Swapping of index values
        temp = sortingstring[min];
        sortingstring[min] = sortingstring[j];
        sortingstring[j] = temp;
    }//end of for




}//end of stringSort

void blockPrint ( const char * blockStr){

    //Variable initialization
    int lengt = strlen(blockStr);
    char previous = '\0';

    for ( int g = 0; g < lengt; g++){

        if ( previous != blockStr[g])//If its the same as prev. char, then it is printed with it
            printf("\n");

        printf("%c", blockStr[g]);

        previous = blockStr[g];
    }//end of for

    printf("\n");



}//end of blockPrint



void wordPrint ( const char * sortingstring){

    //Variable Initialization
    int lengthstr = strlen(sortingstring);

    //Goes through each char in string and determines if there is a space
    for( int h = 0; h < lengthstr; h++){

        if( isspace(sortingstring[h])){//Prints new line if its a space
            printf("\n");
        }else{
            printf("%c", sortingstring[h]);
        }//end of if

    }//end of for

    printf("\n");
}//end of wordPrint
