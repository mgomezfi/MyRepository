// CS 271 -       PA 10
// Program Name:  Term.h
// Author:        Marco Andres Gomez Fierro
// Date:          12/1/2021
// Purpose:       Header File

#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <string>
using namespace std;

#ifndef TERM_H
#define TERM_H

class Term
{
    friend ostream &operator<<( ostream &, const Term & );
    friend istream &operator>>( istream &, Term & );

private:
    int coefficient;
    int exponent;
public:
    Term ( int coef = 0, int exp = 0 );
    Term &setCoefficient ( int );
    Term &setExponent ( int );
    int getCoefficient () const;
    int getExponent () const;
    Term operator+ ( const Term & ) const;
    Term operator- ( const Term & ) const;
    Term operator* ( const Term & ) const;
    Term& operator++( );//prefix
    Term operator++( int );//postfix
};//end of class
#endif
