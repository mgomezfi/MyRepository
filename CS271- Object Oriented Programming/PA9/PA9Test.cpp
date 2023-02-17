// CS 271 -       PA 9
// Program Name:  PA9Test.cpp
// Author:        Marco Andres Gomez Fierro
// Date:          11/2/2021
// Purpose:       Source File

#include <string>
#include <iostream>
#include <iomanip>
#include <cstdlib>
#include "WindTurbine.h"
using namespace std;


int main() {

    //Initializes Object
    WindTurbine Turb1( 2500.0 , 225, "horizontal");
    cout << Turb1.toString() << endl;

    //Testing functions with out of bounds parameters

    cout << "***The following is a test of the data validation of the functions***" << endl << endl;
    Turb1.setPowerOutput(10001);
    Turb1.setBladeSpeed(301);
    Turb1.setOrientation("VERTICAL");
    cout << endl << endl;

    //Test of Each individual function

    Turb1.setPowerOutput(6000);
    cout << Turb1.toString() << endl;
    cout << Turb1.getPowerOutput() << endl << endl;
    Turb1.setBladeSpeed(200);
    cout << Turb1.toString() << endl;
    cout << Turb1.getBladeSpeed() << endl << endl;
    Turb1.setOrientation("vertical");
    cout << Turb1.toString() << endl;
    cout << Turb1.getOrientation() << endl << endl;

    //Testing Default arguments of Constructor

    cout << "**Test of Default Arguments of the Constructor**" << endl;
    WindTurbine Turb2;
    cout << Turb2.toString() << endl;
}//end of main
