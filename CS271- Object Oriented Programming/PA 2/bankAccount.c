// CS 271 -       PA 2
// Program Name:  bankAccount.c
// Author:        Marco Andres Gomez Fierro
// Date:          9/2/2021
// Purpose:       Use a sentinel loop to add together the debits and credits

#include <stdio.h>
#include <math.h>

int main() {

   //Initializing Variables

   float inputV, dbtTotl, crdtTotl;

   //Asks For First Number

   printf( "Input a credit/debit:\n");

   scanf( "%f", &inputV ); //First Input

   //Sentinel Loop (Including getting the Input Value)

   while ( inputV != 0 ) {

       if ( inputV > 0){   //if statements determine if its credit or debit

           crdtTotl = crdtTotl + inputV;

       }else if (inputV < 0){

           dbtTotl = dbtTotl + (-1 * inputV);

       }   //end of if statements

       printf( "Input a credit/debit or enter 0 to end:\n");
       scanf( "%f", &inputV );

   }   //end of Sentinel Loop

   printf("Total debits          $  %.2f\n", dbtTotl);
   printf("Total credits         $  %.2f\n", crdtTotl);

}   //end of main
