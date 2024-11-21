#include <iostream>
#include "Circle.h"
using namespace std;

int Circle::count = 0;

Circle::Circle()
{
    count++;
    setRadius(count);
    cout << "Creating Circle with Radius " << getRadius() << endl;
}
Circle::Circle(const Circle &copyFrom)
{
    count++;
    setRadius(copyFrom.getRadius());
    cout << "Copying Circle with Radius " << copyFrom.getRadius() << endl;
}
Circle::~Circle()
{
    count--;
    cout << "Destroying Circle with Radius " << getRadius() << endl;
}

Circle &Circle::operator=(const Circle &copyFrom)
{

    setRadius(copyFrom.getRadius());
    cout << "Assigning Circle with Radius " << copyFrom.getRadius() << endl;
    return *this;
}
void Circle::setRadius(float newRadius)
{
    if (newRadius >= 0)
        radius = newRadius;
    else
        cout << "Error: radius should be >= 0" << endl;
}
float Circle::getX() const
{
    return centerX;
}
float Circle::getY() const
{
    return centerY;
}
float Circle::getRadius() const
{
    return radius;
}
float Circle::getArea() const
{
    return radius * radius * PI;
}
int Circle::getCount()
{
    return count;
}