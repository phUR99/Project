#include <iostream>
#include "Fraction.h"
using namespace std;
// The constructor for Fraction
Fraction::Fraction()
{
    setTop(0);
    setBottom(1);
}
// Setter for numerator
void Fraction::setTop(int newTop)
{
    top = newTop;
}
// Setter for denominator
void Fraction::setBottom(int newBottom)
{
    if (newBottom == 0)
        cout << "Warning: Fraction has a zero denominator" << endl;
    bottom = newBottom;
}
// Getter for numerator
int Fraction::getTop()
{
    return top;
}
// Getter for denominator
int Fraction::getBottom()
{
    return bottom;
}
// Print function for Fraction
void Fraction::print()
{
    cout << getTop() << " / " << getBottom() << endl;
}

void Fraction::printInverted()
{

    cout << getBottom() << " / " << getTop() << endl;
}

void Fraction::printDoubled()
{
    cout << getTop() * 2 << " / " << getBottom() << endl;
}

void Fraction::printFloatingPoint()
{

    cout << (float)top / bottom << endl;
}

void Fraction::printSquared()
{
    cout << getTop() * getTop() << " / " << getBottom() * getBottom() << endl;
}
