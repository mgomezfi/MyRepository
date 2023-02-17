// CS 271 -       PA 10
// Program Name:  TermTest.cpp
// Author:        Marco Andres Gomez Fierro
// Date:          12/1/2021
// Purpose:       Source File

#include <string>
#include <iostream>
#include <iomanip>
#include <cstdlib>
#include "Term.h"
using namespace std;


int main() {

    Term k(2,3);
    Term r;
    cout << "Input the coefficient and exponent of r" << endl;
    cin >> r;
    cout << "The sum of k (" << k << ") and r ("<< r << ") is " <<(k + r) << endl;
    cout << "The subtraction of k (" << k << ") and r ("<< r << ") is " <<(k - r) << endl;
    cout << "The multiplication of k (" << k << ") and r ("<< r << ") is " <<(k * r) << endl;
    cout << "Test prefix ++ on r: " << endl << ++r << endl;
    cout << "Test postfix ++ on r: " << endl << r++ << endl << " after printing again... " << r << endl;

}//end of main
