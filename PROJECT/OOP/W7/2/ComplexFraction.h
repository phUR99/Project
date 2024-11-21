#include <iostream>
#include "Number.h"
#include "Fraction.h"
using namespace std;

class ComplexFraction : public Number
{
private:
    Fraction real, imag;

public:
    ComplexFraction(Fraction newReal = 0, Fraction newImag = 0);
    virtual void print() const;
    ComplexFraction &setReal(Fraction newReal);
    ComplexFraction &setImag(Fraction newImag);
    Fraction getReal() const;
    Fraction getImag() const;
    ComplexFraction operator+(ComplexFraction complex2);
    ComplexFraction operator-(ComplexFraction complex2);
    ComplexFraction operator*(ComplexFraction complex2);
    ComplexFraction operator/(ComplexFraction complex2);
    bool operator==(ComplexFraction complex2);
};

ostream &operator<<(ostream &output, ComplexFraction &complex1);