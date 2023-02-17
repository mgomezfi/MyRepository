include <iostream>
using namespace std;
int main( ) {
   int int1, int2, int3;
   float avrg;
   cout << "Input 3 integer values: ";
   cin >> int1 >> int2 >> int3;

   // print the average of the 3 integers
   cout << "The average is ";

   avrg = ( float )( int1 + int2 + int3 )/(3.0);

   cout << avrg << endl;
} // end main
