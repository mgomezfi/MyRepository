// CS 271 -       PA 10
// Program Name:  Term.cpp
// Author:        Marco Andres Gomez Fierro
// Date:          12/1/2021
// Purpose:       Source File


#include "Term.h"
#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <string>
using namespace std;

ostream &operator<<( ostream &output, const Term &t ){
    output << t.coefficient << "x^" << t.exponent;
    return output;

}//end of <<

istream &operator>>( istream &input, Term &t ){

    int coef, exp;
    input >> coef >> exp;
    t.setCoefficient( coef );
    t.setExponent( exp );
    return input;

}//end of >>

Term &Term::setCoefficient( int coef ){

    coefficient = coef;
    return *this;

}//end of setCoefficient

Term &Term::setExponent( int exp ){

    exponent = exp;
    return *this;

}//end of setExponent

Term::Term ( int coef, int exp ){

    exponent = exp;
    coefficient = coef;

}//end of Term constructor

int Term::getCoefficient ( ) const{

    return coefficient;

}//end of getCoefficient

int Term::getExponent ( ) const{

    return exponent;

}//end of getExponent

Term Term::operator+( const Term& secterm ) const {

    if ( exponent == secterm.exponent ){

        return Term( coefficient + secterm.coefficient, exponent );

    }//end of if
        return Term( 0, 0 );

}//end of operator +

Term Term::operator-( const Term& secterm ) const {

    if ( exponent == secterm.exponent ){

        return Term( coefficient - secterm.coefficient, exponent );

    }//end of if
        return Term( 0, 0 );

}//end of operator -

Term Term::operator*( const Term& secterm ) const {

    return Term( coefficient * secterm.coefficient, exponent + secterm.exponent );

}//end of operator *

Term& Term::operator++( )  {

    setCoefficient( coefficient + 1 );
    return *this;

}//end of prefix ++

Term Term::operator++( int dummy ) {

    Term temp = *this;
    setCoefficient( coefficient + 1 );
    return temp;

}//end of postfix ++
