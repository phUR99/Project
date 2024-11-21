#include <iostream>
#include "Date.h"
using namespace std;

int main()
{
    Date d1;
    cout << "Setting the date to 2024/02/17 (Korean Style) using cascading setters" << endl;
    d1.setYearRef(2024).setMonthRef(2).setDayRef(17);
    d1.printDate();
    cout << "Advancing the date one month" << endl;
    d1.advanceOneMonth();
    d1.printDate();
    cout << "Happy St. Patrick's Day!!" << endl
         << endl;
    cout << "Setting the date to 12/31/2024 (US Style) using cascading setters" << endl;
    d1.setMonthRef(12).setDayRef(31).setYearRef(2024);
    d1.printDate();
    cout << "Advancing the date one day" << endl;
    d1.advanceOneDay();
    d1.printDate();
    cout << "Happy New Year!!" << endl;
}
