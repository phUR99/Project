#include <iostream>
#include "Shape.h"
#include "Circle.h"
using namespace std;

int Circle::count = 0;

Circle::Circle()
{
    count++;
}
Circle::Circle(const Circle &copyFrom)
{
    count++;
}
Circle::~Circle()
{
    count--;
}

Circle &Circle::operator=(const Circle &copyFrom)
{

    setRadius(copyFrom.getRadius());
    cout << "Assigning Circle with Radius " << copyFrom.getRadius() << endl;
    return *this;
}
Circle &Circle::setRadius(float newRadius)
{
    if (newRadius >= 0)
        radius = newRadius;
    else
        cout << "Error: radius should be >= 0" << endl;
    return (*this);
}
Circle &Circle::setX(float newX)
{
    centerX = newX;
    return (*this);
}
Circle &Circle::setY(float newY)
{
    centerY = newY;
    return (*this);
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