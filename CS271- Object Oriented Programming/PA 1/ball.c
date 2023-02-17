// CS 271 -PA 1
// Program name:  ball.c
// Marco Andres Gomez Fierro
// 8/23/2021

#include <stdio.h>
#include <math.h>

int main(){

    //Initiating Variables

    double Exte, Int, VolIn, VolOut, TotVol;

    //Displays and Asks for Inputs

    printf( "Input the exterior diameter in inches:\n" );
    scanf( "%lf", &Exte );
    printf( "Input the interior diameter in inches:\n" );
    scanf( "%lf", &Int );

    // Calculations of the Volume of Rubber and Validity of Inner and Outer Volume

    VolIn = ( 4 * ( M_PI * ( pow( ( Int / 2), 3 ) ) ) ) / 3;
    VolOut = ( 4 * ( M_PI * ( pow( ( Exte / 2), 3 ) ) ) ) / 3;
    TotVol = VolOut - VolIn;

    //Prints Results and if its valid

    printf( TotVol > 0 ? "Volume of Rubber needed is %.2lf\n" : "Exterior diameter must be larger than interior diameter.\n" , TotVol );

} //End of Main
