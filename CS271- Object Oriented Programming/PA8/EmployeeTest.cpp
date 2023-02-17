// CS 271 -       PA 8
// Program Name:  EmployeeTest.cpp
// Author:        Marco Andres Gomez Fierro
// Date:          10/28/2021
// Purpose:       Source File

#include <string>
#include <iostream>
#include <iomanip>
#include <cstdlib>
#include "Employee.h"
using namespace std;


int main() {

    //Initializes Objects
    Employee employee1( "Michael", "Scott", 5000);
    Employee employee2( "Darryl", "Philbin", 4500);

    //Prints contents of Objects
    cout << "Employee #1 is : " << employee1.getFirstName() << " ";
    cout << employee1.getLastName() << " and he makes $" << employee1.getMonthlySalary() << endl;

    cout << "Employee #2 is : " << employee2.getFirstName() << " ";
    cout << employee2.getLastName() << " and he makes $" << employee2.getMonthlySalary() << endl;


    //Raises of 10%
    employee1.setMonthlySalary( employee1.getMonthlySalary()*1.10 );
    employee2.setMonthlySalary( employee2.getMonthlySalary()*1.10 );

    //Prints contents of Objects
    cout << "Employee #1 is : " << employee1.getFirstName() << " ";
    cout << employee1.getLastName() << " and after a raise he makes $" << employee1.getMonthlySalary() << endl;

    cout << "Employee #2 is : " << employee2.getFirstName() << " ";
    cout << employee2.getLastName() << " and after a raise he makes $" << employee2.getMonthlySalary() << endl << endl;

    //Testing the Data Validation of monthlySalary
    employee1.setMonthlySalary(-1000);
    cout << "**This tests data validation for monthlySalary**" << endl;
    cout << "The salary was set to -1000 and the mutator set it to:        " << employee1.getMonthlySalary() << endl << endl;

    //Testing set Functions
    employee1.setMonthlySalary(5500);
    employee1.setFirstName("Creed");
    employee1.setLastName("Bratton");
    employee2.setFirstName("Dwight");
    employee2.setLastName("Schrute");

    cout << "Employee #1 is : " << employee1.getFirstName() << " ";
    cout << employee1.getLastName() << " and he makes $" << employee1.getMonthlySalary() << endl;

    cout << "Employee #2 is : " << employee2.getFirstName() << " ";
    cout << employee2.getLastName() << " and he makes $" << employee2.getMonthlySalary() << endl;
}//end of main
