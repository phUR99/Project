#include "Number.h"
using namespace std;

class Complex : public Number
{
private:
    float real, imag;

public:
    Complex(float newReal = 0, float newImag = 0);
    virtual void print() const;
    Complex &setReal(float newReal);
    Complex &setImag(float newImag);
    int getReal() const;
    int getImag() const;
    Complex operator+(Complex complex2);
    Complex operator-(Complex complex2);
    Complex operator*(Complex complex2);
    Complex operator/(Complex complex2);
    bool operator==(Complex complex2);
};

ostream &operator<<(ostream &output, Complex &complex1);