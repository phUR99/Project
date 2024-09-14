#include <iostream>
#include "Complex.h"
using namespace std;

Complex::Complex(float newReal, float newImag)
{
    setRealAndImag(newReal, newImag);
}

void Complex::print()
{
    cout << real << " + " << imag << "i";
}
void Complex::setRealAndImag(float newReal, float newImag)
{
    real = newReal;
    imag = newImag;
}
int Complex::getImag()
{
    return imag;
}
int Complex::getReal()
{
    return real;
}

Complex Complex::operator+(Complex complex)
{

    Complex newComplex;
    float newImag = imag + complex.getImag();
    float newReal = real + complex.getReal();
    newComplex.setRealAndImag(newReal, newImag);

    return newComplex;
}
Complex Complex::operator-(Complex complex)
{
    Complex newComplex;
    float newImag = imag - complex.getImag();
    float newReal = real - complex.getReal();
    newComplex.setRealAndImag(newReal, newImag);

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
    newComplex.setRealAndImag(newReal, newImag);

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
    newComplex.setRealAndImag(newReal, newImag);

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
