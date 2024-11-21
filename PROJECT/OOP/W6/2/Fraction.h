#ifndef FRACTION_H
#define FRACTION_H

#include "Number.h"
using namespace std;

class Fraction : public Number
{
public:
    Fraction(int newTop = 0, int newBottom = 1);
    virtual void print() const;
    void setTopAndBottom(int newTop, int newBottom);
    Fraction &setTop(int newTop);
    Fraction &setBottom(int newBottom);
    int getTop() const;
    int getBottom() const;
    Fraction &simplify();
    Fraction operator+(Fraction frac2);
    Fraction operator-(Fraction frac2);
    Fraction operator*(Fraction frac2);
    Fraction operator/(Fraction frac2);
    bool operator==(Fraction frac2);
    bool operator>(Fraction frac2);
    bool operator<(Fraction frac2);

private:
    int top, bottom;
};

ostream &operator<<(ostream &output, Fraction &frac1);
int GreatestCommonDenominator(int num1, int num2);

#endif