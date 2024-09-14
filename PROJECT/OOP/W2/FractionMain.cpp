#include <iostream>
#include "Fraction.h"
using namespace std;
int main()
{

    Fraction fraction1, fraction2, fraction3;
    int top, bottom;

    fraction1.setTopAndBottom(35, 105);
    fraction2.setTopAndBottom(57, 38);
    fraction3 = fraction1 + fraction2;

    top = fraction3.getTop();
    bottom = fraction3.getBottom();

    cout << "35/10 reduces to ";
    fraction1.print();
    cout << endl;
    cout << "35/10 reduces to " << fraction1 << endl;
    cout << "57/38 reduces to " << fraction2 << endl;
    cout << "35/105 + 57/38 = " << top << "/" << bottom << endl;
    return 0;
}