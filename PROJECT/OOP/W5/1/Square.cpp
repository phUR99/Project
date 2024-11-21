#include <iostream>
#include "Shape.h"
#include "Square.h"
using namespace std;

int Square::count = 0;

Square::Square()
{
    count++;
}
Square::Square(const Square &copyFrom)
{
    count++;
}
Square::~Square()
{
    count--;
}

Square &Square::operator=(const Square &copyFrom)
{

    setSideLength(copyFrom.getSideLength());
    cout << "Assigning Square with SideLength " << copyFrom.getSideLength() << endl;
    return *this;
}
Square &Square::setSideLength(float newSideLength)
{
    if (newSideLength >= 0)
        sideLength = newSideLength;
    else
        cout << "Error: sideLength should be >= 0" << endl;
    return (*this);
}
Square &Square::setCenterX(float newX)
{
    centerX = newX;
    return (*this);
}
Square &Square::setCenterY(float newY)
{
    centerY = newY;
    return (*this);
}
float Square::getX() const
{
    return centerX;
}
float Square::getY() const
{
    return centerY;
}
float Square::getSideLength() const
{
    return sideLength;
}
float Square::getArea() const
{
    return sideLength * sideLength;
}
int Square::getCount()
{
    return count;
}