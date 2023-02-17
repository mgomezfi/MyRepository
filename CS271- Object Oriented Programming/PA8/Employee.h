// CS 271 -       PA 8
// Program Name:  Employee.h
// Author:        Marco Andres Gomez Fierro
// Date:          10/21/2021
// Purpose:       Header File


#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <string>
using namespace std;

#ifndef EMPLOYEE_H
#define EMPLOYEE_H

class Employee {

public:
    Employee( string, string, float );
    void setFirstName ( string );
    void setLastName ( string );
    void setMonthlySalary ( float );
    string getFirstName ( ) const;
    string getLastName ( ) const;
    float getMonthlySalary ( ) const;

private:
    string firstName;
    string lastName;
    float monthlySalary;

};//end of class
#endif
