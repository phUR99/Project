#include <iostream>
#include <iomanip>
#include "Date.h"
using namespace std;
// Constructor for Date
Date::Date()
{
    setYear(0);
    setDay(0);
    setMonth(0);
}
void Date::setYear(int newYear)
{
    if (newYear < 0)
        cout << "Error setting Year" << endl;
    else
        year = newYear;
}
void Date::setDay(int newDay)
{
    if (newDay <= 0 || newDay > 31)
        cout << "Error setting day" << endl;
    else
        day = newDay;
}
void Date::setMonth(int newMonth)
{
    if (newMonth <= 0 || newMonth > 12)
        cout << "Error setting month" << endl;
    else
        month = newMonth;
}

Date Date::setYearIns(int newYear)
{
    setYear(newYear);
    return (*this);
}
Date Date::setMonthIns(int newMonth)
{
    setMonth(newMonth);
    return (*this);
}
Date Date::setDayIns(int newDay)
{
    setDay(newDay);
    return (*this);
}
// Cascading Setters which return a pointer
Date *Date::setMonthPtr(int newMonth)
{
    setMonth(newMonth);
    return this;
}
Date *Date::setYearPtr(int newYear)
{
    setYear(newYear);
    return this;
}
Date *Date::setDayPtr(int newDay)
{
    setDay(newDay);
    return this;
}
// Cascading Setter which return a reference
Date &Date::setYearRef(int newYear)
{
    setYear(newYear);
    return (*this);
}
Date &Date::setMonthRef(int newMonth)
{
    setMonth(newMonth);
    return (*this);
}
Date &Date::setDayRef(int newDay)
{
    setDay(newDay);
    return (*this);
}
// Getters
int Date::getYear() const
{
    return year;
}
int Date::getDay() const
{
    return day;
}
int Date::getMonth() const
{
    return month;
}

// Advance one Year
void Date::advanceOneYear()
{
    setYear(year + 1);
}
// Advance one month

void Date::advanceOneMonth()
{
    int newMonth = month + 1;
    if (newMonth >= 13)
    {
        newMonth = 1;
        advanceOneYear();
    }
    setMonth(newMonth);
}
void Date::advanceOneDay()
{
    int newDay = day + 1;
    if (newDay >= 32)
    {
        newDay = 1;
        advanceOneMonth();
    }
    setDay(newDay);
}

// Printing methods
void Date::printTwoDigits(int number) const
{
    cout << setw(2) << setfill('0') << number;
}
void Date::printDate() const
{
    printTwoDigits(year);
    cout << "/";
    printTwoDigits(month);
    cout << "/";
    printTwoDigits(day);
    cout << endl;
}
