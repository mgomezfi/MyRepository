// CS 271 -       PA 9
// Program Name:  WindTurbine.cpp
// Author:        Marco Andres Gomez Fierro
// Date:          11/2/2021
// Purpose:       Source File


#include "WindTurbine.h"
#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <string>
using namespace std;

WindTurbine::WindTurbine ( double p, int b, string o) {

    setPowerOutput( p );
    setBladeSpeed( b );
    setOrientation( o );

}//end of WindTurbine


void WindTurbine::setPowerOutput ( double p ){

    if ( p >= 1.0 && p <= 10000.0 ){ //Data Validation

        powerOutput = p;

    } else

        cout << "Power Output Value is invalid. Must be from 1 to 10,000" << endl;

}//end of setFirstName

void WindTurbine::setBladeSpeed ( int b ){

    if ( b >= 0 && b <= 300 ){ //Data Validation

        bladeSpeed = b;

    }else

        cout << "Blade Speed Value is invalid. Must be from 0 to 300" << endl;

}//end of setLastName

void WindTurbine::setOrientation ( string o ){

    if ( o == "vertical" || o == "horizontal" ){ //Data Validation

        orientation = o;

    }else {

        cout << "Value for Orientation is invalid, it must be either vertical or horizontal (case sensitive)" << endl;

    }//end of if/else validator

}//end of setMonthlySalary

double WindTurbine::getPowerOutput ( ) const{

    return powerOutput;

}//end of getFirstName

int WindTurbine::getBladeSpeed ( ) const{

    return bladeSpeed;

}//end of getLastName

string WindTurbine::getOrientation ( ) const{

    return orientation;

}//end of getmonthlySalary

string WindTurbine::toString ( ) {

    string toStr = "WindTurbine: powerOutput = " + to_string( powerOutput ) + " kW bladeSpeed = " + to_string( bladeSpeed ) + " orientation = " + orientation;
    return toStr;

}



