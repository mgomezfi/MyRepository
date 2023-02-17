// CS 271 -       PA 8
// Program Name:  Employee.cpp
// Author:        Marco Andres Gomez Fierro
// Date:          10/28/2021
// Purpose:       Source File


#include "Employee.h"
#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <string>
using namespace std;

Employee::Employee ( string name, string last, float salary) {
    setFirstName( name );
    setLastName( last );
    setMonthlySalary( salary );
}//end of employee

void Employee::setFirstName ( string name){

    firstName = name;

}//end of setFirstName

void Employee::setLastName ( string name){

    lastName = name;

}//end of setLastName

void Employee::setMonthlySalary ( float salary ){

    if ( salary < 0 ){

        monthlySalary = 0;

    }else {

        monthlySalary = salary;

    }//end of if/else validator

}//end of setMonthlySalary

string Employee::getFirstName ( ) const{

    return firstName;

}//end of getFirstName

string Employee::getLastName ( ) const{

    return lastName;

}//end of getLastName

float Employee::getMonthlySalary ( ) const{

    return monthlySalary;

}//end of getmonthlySalary
