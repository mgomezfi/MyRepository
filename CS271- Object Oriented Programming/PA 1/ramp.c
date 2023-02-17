// CS 271 -PA 1
// Program name:  ramp.c
// Marco Andres Gomez Fierro
// 8/23/2021

#include <stdio.h>
#include <math.h>

int main(){

   // Initiates Variables to be Used and Gets Input

   double Rise, Horiz, RLength;

   printf("Input the rise (inches):\n");
   scanf("%lf", &Rise);

   // Calculates Length of Ramp and Its Horizontal Length

   Horiz = 12 * Rise;
   RLength = sqrt( (Horiz * Horiz) + ( Rise * Rise));

   // Determines if ramps requires landing

   printf( Rise > 30 ? "The ramp requires a landing.\n" : "");

   // Displays Horizontal and Ramp Distance

   printf("The Horizontal Distance is: %.1lf feet.\n", Horiz/12);
   printf("The Ramps' Distance is: %.1lf feet.\n", RLength/12);
}// End of Main
