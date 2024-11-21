// ClockMain.cpp
#include <iostream>
#include "Clock.h"
using namespace std;
// Advance the clock by one hour with a value parameter
void advanceOneHourVal(Clock myClock)
{
    myClock.advanceOneHour();
}

void advanceOneHourPtr(Clock *myClock)
{
    myClock->advanceOneHour();
}

void advanceOneHourRef(Clock &myClock)
{
    myClock.advanceOneHour();
}

void advanceOneMinuteVal(Clock myClock)
{
    myClock.advanceOneMinute();
}

void advanceOneMinutePtr(Clock *myClock)
{
    myClock->advanceOneMinute();
}

void advanceOneMinuteRef(Clock &myClock)
{
    myClock.advanceOneMinute();
}

void advanceOneSecondVal(Clock myClock)
{
    myClock.advanceOneSecond();
}

// Advance the clock by one hour with a pointer parameter
void advanceOneSecondPtr(Clock *myClock)
{
    myClock->advanceOneSecond();
}

// Advance the clock by one hour with a reference parameter
void advanceOneSecondRef(Clock &myClock)
{
    myClock.advanceOneSecond();
}

int main()
{

    // Create a Clock with ID number 42
    Clock c1(42);
    cout << "Setting the clock to 2:03:04 using normal setters" << endl;
    c1.setHour(2);
    c1.setMinute(3);
    c1.setSecond(4);
    c1.printTime();
    cout << "Advancing the clock one hour with a value parameter" << endl;
    advanceOneHourVal(c1);
    c1.printTime();
    cout << "Advancing the clock one hour with a pointer parameter" << endl;
    advanceOneHourPtr(&c1);
    c1.printTime();
    cout << "Advancing the clock one hour with a reference parameter" << endl;
    advanceOneHourRef(c1);
    c1.printTime();
    cout << "Setting the clock to 8:09:10 with cascading setters ";
    cout << "returning an instance" << endl;
    c1.setHourIns(8).setMinuteIns(9).setSecondIns(10);
    c1.printTime();
    cout << "Setting the clock to 5:06:07 with cascading setters "
         << "returning a pointer" << endl;
    c1.setHourPtr(5)->setMinutePtr(6)->setSecondPtr(7);
    c1.printTime();
    cout << "Setting the clock to 11:12:13 with cascading setters "
         << "returning a reference" << endl;
    c1.setHourRef(11).setMinuteRef(12).setSecondRef(13);
    c1.printTime();

    cout << "Setting the clock to 23:59:59" << endl;
    c1.setHourRef(23).setMinuteRef(59).setSecondRef(59);
    c1.printTime();
    advanceOneSecondRef(c1);
    cout << "Advancing the clock one second" << endl;
    c1.printTime();
}
