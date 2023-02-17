// CS 271 -       PA 9
// Program Name:  Windturbine.h
// Author:        Marco Andres Gomez Fierro
// Date:          11/2/2021
// Purpose:       Header File

#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <string>
using namespace std;

#ifndef WINDTURBINE_H
#define WINDTURBINE_H

class WindTurbine {

public:
    WindTurbine( double = 100.0, int = 0, string = "horizontal" );
    void setPowerOutput ( double );
    void setBladeSpeed ( int );
    void setOrientation ( string );
    double getPowerOutput ( ) const;
    int getBladeSpeed ( ) const;
    string getOrientation ( ) const;
    string toString ( );

private:
    double powerOutput;
    int bladeSpeed;
    string orientation;

};//end of class
#endif
