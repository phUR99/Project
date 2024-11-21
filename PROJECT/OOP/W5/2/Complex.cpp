#include <iostream>
#include "Complex.h"
#include "Number.h"
using namespace std;

Complex::Complex(float newReal, float newImag)
{
    setReal(newReal).setReal(newImag);
}

void Complex::print() const
{
    cout << real << " + " << imag << "i";
}

Complex &Complex::setImag(float newImag)
{
    imag = newImag;
    return *this;
}
Complex &Complex::setReal(float newReal)
{
    real = newReal;
    return *this;
}

int Complex::getImag() const
{
    return imag;
}
int Complex::getReal() const
{
    return real;
}

Complex Complex::operator+(Complex complex)
{

    Complex newComplex;
    float newImag = imag + complex.getImag();
    float newReal = real + complex.getReal();
    newComplex.setImag(newImag).setReal(newReal);

    return newComplex;
}
Complex Complex::operator-(Complex complex)
{
    Complex newComplex;
    float newImag = imag - complex.getImag();
    float newReal = real - complex.getReal();
    newComplex.setImag(newImag).setReal(newReal);

    return newComplex;
}
Complex Complex::operator*(Complex complex)
{
    Complex newComplex;
    float a = real;
    float b = imag;
    float c = complex.getReal();
    float d = complex.getImag();
    float newReal = a * c - b * d;
    float newImag = b * c + a * d;
    newComplex.setImag(newImag).setReal(newReal);

    return newComplex;
}
Complex Complex::operator/(Complex complex)
{
    Complex newComplex;
    float a = real;
    float b = imag;
    float c = complex.getReal();
    float d = complex.getImag();
    float newReal = (a * c + b * d) / (c * c + d * d);
    float newImag = (b * c - a * d) / (c * c + d * d);
    newComplex.setImag(newImag).setReal(newReal);

    return newComplex;
}
bool Complex::operator==(Complex complex)
{
    return (real == complex.getReal() && imag == complex.getImag());
}
ostream &operator<<(ostream &output, Complex &frac)
{
    output << frac.getReal() << " + " << frac.getImag() << "i";
    return output;
}
