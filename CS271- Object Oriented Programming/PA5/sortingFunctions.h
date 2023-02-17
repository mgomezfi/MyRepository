// CS 271 -       PA 5
// Program Name:  sortingFunctions.h
// Author:        Marco Andres Gomez Fierro
// Date:          9/30/2021
// Purpose:       Header File

#ifndef SORTINGFUNCTIONS_C
#define SORTINGFUNCTIONS_C

//  prototype - contains the header
//  information for a function

   int selectionSort ( int * const data, int size );
   int insertionSort ( int * const data, int size );
   void swap ( int * num1, int * num2 );
   void fillArray( int * const data, int size, int min, int max );
   void neatPrint ( int * const data, int size, int numPerLine, int fieldSize );
#endif
