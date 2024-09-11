#include <iostream>
#include "Fraction.h"
using namespace std;
int main()
{
    Fraction fraction1;
    int top, bottom;
    cout << "Enter the numerator: ";
    cin >> top;
    cout << "Enter the denominator: ";
    cin >> bottom;
    fraction1.setTop(top);
    fraction1.setBottom(bottom);
    fraction1.print();
    cout << "Inverted: ";
    fraction1.printInverted();
    cout << "Doubled: ";
    fraction1.printDoubled();
    cout << "Squared: ";
    fraction1.printSquared();
    cout << "Floating Point: ";
    fraction1.printFloatingPoint();
}
