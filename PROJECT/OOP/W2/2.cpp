#include <bits/stdc++.h>

using namespace std;
/*
validation : validation is  a guarantee that the data inside an instance
will always be valid instance incorrect data isn't permitted;
*/
/*
when a new instance is created, what should its data be?
Example : all clock instance should start at 12::00::00;
*/
/*
overloading : in cpp, we can create multiple methods with the same name,
but they must have different parameters this includes multiple constructor;
*/
class Clock
{
public:
    // Clock(); // constructor : constructor is a method which is performed when a new instance is created;
    // Clock(int h);
    //  Clock(int m); not allow : same parameter;
    // Clock(int h, int m);
    Clock(int h, int m, int s);
    void setHour(int newHour);
    void setMinute(int newMinute);
    void setSecond(int newSecond);
    int getHour();
    int getSecond();
    int getMinute();
    ~Clock();

private:
    int hour, minute, second;
};
/*
// DRY code
Clock::Clock()
{
    hour = 12;
    minute = 0;
    second = 0;
}
Clock::Clock(int h)
{
    setHour(h);
    minute = 0;
    second = 0;
}
Clock::Clock(int h, int m)
{
    setHour(h);
    setMinute(m);
    second = 0;
}
Clock::Clock(int h, int m, int s)
{
    // don't repeat code, reuse ordinary code;
    // DRY : don't repeat yourself
    setHour(h);
    setMinute(m);
    setSecond(s);
}
*/
// this one constructor replaces all previously written constructors
Clock::Clock(int h = 12, int m = 0, int s = 0)
{
    setHour(h);
    setMinute(m);
    setSecond(s);
}

Clock::~Clock()
{
}
int Clock::getHour()
{
    return hour;
}
int Clock::getMinute()
{
    return minute;
}
int Clock::getSecond()
{
    return second;
}
void Clock::setHour(int newHour)
{
    // validation
    if (newHour > 23 || newHour < 0)
    {
        cout << "error\n";
        hour = 12;
    }
    else
        hour = newHour;
}
void Clock::setMinute(int newMinute)
{
    // validation
    if (newMinute > 59 || newMinute < 0)
    {
        cout << "error\n";
        minute = 0;
    }
    else
        minute = newMinute;
}
void Clock::setSecond(int newSecond)
{
    // validation
    if (newSecond > 59 || newSecond < 0)
    {
        cout << "error\n";
        second = 0;
    }
    else
        second = newSecond;
}
class Fraction
{
public:
    int getBottom()
    {
        return this->bottom;
    }
    void setBottom(int newBottom)
    {
        if (!newBottom)
            cout << "error\n"; // print error message;
        else
            this->bottom = newBottom;
    }

private:
    int top;
    int bottom;
};

int main()
{
    Fraction f1;
    /*
    f1.top = 1;
    f1.bottom = 0; // don't allow it
    */
    f1.setBottom(23);
    cout << f1.getBottom() << '\n';

    Clock c1, c2(23, 12, 15), c3(15), c4(8, 56);
    Clock c5(42, 4124, 414144); // incorrect data
    /*
    if constructor directly assigns the data from a parameter then the data might become incorrect;
    so constructor need to use validation.
    */

    cout << setw(2) << setfill('0') << c1.getHour() << "::"
         << setw(2) << setfill('0') << c1.getMinute() << "::"
         << setw(2) << setfill('0') << c1.getSecond() << '\n';

    cout << setw(2) << setfill('0') << c2.getHour() << "::"
         << setw(2) << setfill('0') << c2.getMinute() << "::"
         << setw(2) << setfill('0') << c2.getSecond() << '\n';

    cout << setw(2) << setfill('0') << c3.getHour() << "::"
         << setw(2) << setfill('0') << c3.getMinute() << "::"
         << setw(2) << setfill('0') << c3.getSecond() << '\n';

    cout << setw(2) << setfill('0') << c4.getHour() << "::"
         << setw(2) << setfill('0') << c4.getMinute() << "::"
         << setw(2) << setfill('0') << c4.getSecond() << '\n';

    cout << setw(2) << setfill('0') << c5.getHour() << "::"
         << setw(2) << setfill('0') << c5.getMinute() << "::"
         << setw(2) << setfill('0') << c5.getSecond() << '\n';

    // class has no constructor -> print any number;
    // class has constructor -> print init value;
    return 0;
}