#include <iostream>
#include <iomanip>
#include "Clock.h"
using namespace std;
// Constructor for Clock
Clock::Clock(int newID) : IDnumber(newID)
{
    setHour(12);
    setMinute(0);
    setSecond(0);
}

void Clock::setHour(int newHour)
{
    if (newHour < 0 || newHour > 23)
        cout << "Error setting hour" << endl;
    else
        hour = newHour;
}
void Clock::setSecond(int newSecond)
{
    if (newSecond < 0 || newSecond > 59)
        cout << "Error setting second" << endl;
    else
        second = newSecond;
}
void Clock::setMinute(int newMinute)
{
    if (newMinute < 0 || newMinute > 59)
        cout << "Error setting minute" << endl;
    else
        minute = newMinute;
}

Clock Clock::setHourIns(int newHour)
{
    setHour(newHour);
    return (*this);
}
Clock Clock::setMinuteIns(int newMinute)
{
    setMinute(newMinute);
    return (*this);
}
Clock Clock::setSecondIns(int newSecond)
{
    setSecond(newSecond);
    return (*this);
}
// Cascading Setters which return a pointer
Clock *Clock::setMinutePtr(int newMinute)
{
    setMinute(newMinute);
    return this;
}
Clock *Clock::setHourPtr(int newHour)
{
    setHour(newHour);
    return this;
}
Clock *Clock::setSecondPtr(int newSecond)
{
    setSecond(newSecond);
    return this;
}
// Cascading Setter which return a reference
Clock &Clock::setHourRef(int newHour)
{
    setHour(newHour);
    return (*this);
}
Clock &Clock::setMinuteRef(int newMinute)
{
    setMinute(newMinute);
    return (*this);
}
Clock &Clock::setSecondRef(int newSecond)
{
    setSecond(newSecond);
    return (*this);
}
// Getters
int Clock::getHour() const
{
    return hour;
}
int Clock::getSecond() const
{
    return second;
}
int Clock::getMinute() const
{
    return minute;
}

// Advance one hour
void Clock::advanceOneHour()
{
    setHour((hour + 1) % 24);
}
// Advance one minute

void Clock::advanceOneMinute()
{
    int newMinute = minute + 1;
    if (newMinute >= 60)
    {
        newMinute = 0;
        advanceOneHour();
    }
    setMinute(newMinute);
}
void Clock::advanceOneSecond()
{
    int newSecond = second + 1;
    setSecond(newSecond % 60);
    if (newSecond >= 60)
    {
        newSecond = 0;
        advanceOneMinute();
    }
    setSecond(newSecond);
}

// Printing methods
void Clock::printTwoDigits(int number) const
{
    cout << setw(2) << setfill('0') << number;
}
void Clock::printTime() const
{
    cout << "Clock number" << IDnumber << " : ";
    printTwoDigits(hour);
    cout << ".";
    printTwoDigits(minute);
    cout << ":";
    printTwoDigits(second);
    cout << endl;
}
