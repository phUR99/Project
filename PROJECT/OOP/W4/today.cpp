#include <iostream>
using namespace std;
/*
1. static
2. const
3. this
4. &(ref)
5. cascading function calls
*/
int countCalls()
{
    static int count = 0; // keep its value(not init except first call)
    int nonstatic = 0;    // don't keep its value(init every call)
    count++;
    nonstatic++;
    return count;
}
/*
what does static mean?
In the C language, STATIC variable is used as a local variable inside a function,
but the STATIC variable keeps its value across separate function calls.
*/
// A STATIC variable in a class exist without any instance.
// the STATIC variable is shared by all instance.
// If one instance changes the statice variable all instance can see the change no instance
// is needed assign it.
/*
A class can also have a static method.
A STATIC method can be called without any instance
It can only READ or WRITE static variable in the class.
A STATIC method cannot access non-static variables.
*/
class Circle
{
private:
    float radius, x, y;
    // How many circles exist?
    static int count; // variable inside class, but all instance have same variable.

public:
    int getCount();
    Circle();
    ~Circle();
};
Circle::Circle(/* args */)
{
    count++;
}
class circle
{
private:
    float radius, x, y;

public:
    float getRadius() const;
    float getX() const;
    float getY() const;
};
float circle::getRadius() const
{
    // x = 5; (X);
    return radius;
}
/*
CONST
A CONST is like a variable. but the value is assigned when it is created and the
value can never change after that.
int x = 3;
x = 5 (O);
const int y = 7;
y = 9 (X);
const int z; (X);
ex)
const float PI = 3.14159;
In a class, a member can be declared const

All constructors must initialize all const members
The const member cannot be assigned outside the constructor
A class can have const methods.
A CONST method cannot assign or change any member variable
A CONST method cannot call another method which is not const
Getters are often declared const
*/
class student
{
private:
    const int ID;

public:
    int getID();
    student(int newID) : ID(newID) {} // 초기화 리스트 사용
};

/*
circle c1; //c1 is an instance
circle *c2 //c2 is a ptr no instance exists yet
c2 = new circle, now c2 points to an instance
c1.getRadius(); (o);
c2.getRadius(); (x); (c2 is a ptr, cannot use method directly,)
*c2.getRadius() (x) (. > *)
(*c2).getRadius() (o);
c2->getRAdius() (o)
*/

/*
this
"this" is used int a class it is a ptr to the instance
setRadius(5); == this->setRadius(5);
radius = 5; == this->radius(5);
*/
/*
cascading functions
Date d1;
d1.setDate(11, 4, 7) ?
d1.setYear(11);
d1.setMonth(4);
d1.setDay(7);
d1.setDate(11).setMonth(4).setDay(7);
==((d1.setDate).setMonth).setDay;
How to write a cascading setter method?
Date Date::setYear(int newYear){
    year = newYear;
    return *this; //(return instance)
}
Date * Date::setYear(int newYear){
    year = newYear;
    return this;
}
Date *D2;
d2 = new Date;
d2->setYear()->setMonth()->setDay();
*/
/*
reference
// copy -> not change
void tripleNumber(int n)
{
    n = n * 3;
}
-> n
// ptr/ ref -> can change
void tripleNumber(int &n)
{
    n = n * 3;
}
-> 3n
*/
/*
ref. in cascading methods
Date d3;
d3.setYear().setMonth().setDay();
Date Date::setYear(int newYear){
    year = newYear;
    return *this;
}
Date& Date::setYear(int newYear){
    year = newYear;
    return *this;
}
*/

int main()
{
    cout << countCalls() << endl; // 1 vs 1
    cout << countCalls() << endl; // 2 vs 1
    cout << countCalls() << endl; // 3 vs 1

    return 0;
}
