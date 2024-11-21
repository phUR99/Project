#include <iostream>
#include "ComplexFraction.h"
#include "Number.h"
using namespace std;

ComplexFraction::ComplexFraction(Fraction newReal, Fraction newImag)
{
    setReal(newReal).setReal(newImag);
}

void ComplexFraction::print() const
{
    real.print();
    if (imag.getTop() != 0)
    {
        cout << " + ";
        imag.print();
        cout << "i";
    }
}

ComplexFraction &ComplexFraction::setImag(Fraction newImag)
{
    imag = newImag;
    return *this;
}
ComplexFraction &ComplexFraction::setReal(Fraction newReal)
{
    real = newReal;
    return *this;
}

Fraction ComplexFraction::getImag() const
{
    return imag;
}
Fraction ComplexFraction::getReal() const
{
    return real;
}

ComplexFraction ComplexFraction::operator+(ComplexFraction complex)
{

    ComplexFraction newComplexFraction;
    Fraction newImag = imag + complex.getImag();
    Fraction newReal = real + complex.getReal();
    newComplexFraction.setImag(newImag).setReal(newReal);

    return newComplexFraction;
}
ComplexFraction ComplexFraction::operator-(ComplexFraction complex)
{
    ComplexFraction newComplexFraction;
    Fraction newImag = imag - complex.getImag();
    Fraction newReal = real - complex.getReal();
    newComplexFraction.setImag(newImag).setReal(newReal);

    return newComplexFraction;
}
ComplexFraction ComplexFraction::operator*(ComplexFraction complex)
{
    ComplexFraction newComplexFraction;
    Fraction a = real;
    Fraction b = imag;
    Fraction c = complex.getReal();
    Fraction d = complex.getImag();
    Fraction newReal = a * c - b * d;
    Fraction newImag = b * c + a * d;
    newComplexFraction.setImag(newImag).setReal(newReal);

    return newComplexFraction;
}
ComplexFraction ComplexFraction::operator/(ComplexFraction complex)
{
    ComplexFraction newComplexFraction;
    Fraction a = real;
    Fraction b = imag;
    Fraction c = complex.getReal();
    Fraction d = complex.getImag();
    Fraction newReal = (a * c + b * d) / (c * c + d * d);
    Fraction newImag = (b * c - a * d) / (c * c + d * d);
    newComplexFraction.setImag(newImag).setReal(newReal);

    return newComplexFraction;
}
bool ComplexFraction::operator==(ComplexFraction complex)
{
    return (real == complex.getReal() && imag == complex.getImag());
}
/*
ostream &operator<<(ostream &output, ComplexFraction &frac)
{
    output << frac.getReal() << " + " << frac.getImag() << "i";
    return output;
}
*/