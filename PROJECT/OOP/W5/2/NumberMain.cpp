#include <iostream>
#include "Number.h"
#include "Fraction.h"
#include "complex.h"
using namespace std;

Complex *makeComplex()
{
    Complex *complex1 = new Complex;
    float real, imag;
    cout << "What is the Real Part? ";
    cin >> real;
    cout << "What is the Imaginary Part? ";
    cin >> imag;
    complex1->setReal(real).setImag(imag);
    return complex1;
}
Fraction *makeFraction()
{
    Fraction *frac1 = new Fraction;
    int numer, denom;
    cout << "What is the Numerator? ";
    cin >> numer;
    cout << "What is the Denominator? ";
    cin >> denom;
    frac1->setTop(numer).setBottom(denom).simplify();
    return frac1;
}
int main()
{
    Number *num1;
    int numberType;
    cout << "1) Complex or 2) Fraction ";
    cin >> numberType;
    switch (numberType)
    {
    case 1:
        num1 = makeComplex();

        break;
    case 2:
        num1 = makeFraction();
        break;

    default:
        throw runtime_error("Invalid Number Class");
    }
    num1->print();
    cout << endl;
}