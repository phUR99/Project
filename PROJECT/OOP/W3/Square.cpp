#include <iostream>
#include "Square.h"
using namespace std;

int Square::count = 0;

Square::Square()
{
    count++;
    setSideLength(count);
    cout << "Creating Square with SideLength " << getSideLength() << endl;
}
Square::Square(const Square &copyFrom)
{
    count++;
    setSideLength(copyFrom.getSideLength());
    cout << "Copying Square with SideLength " << copyFrom.getSideLength() << endl;
}
Square::~Square()
{
    count--;
    cout << "Destroying Square with SideLength " << getSideLength() << endl;
}

Square &Square::operator=(const Square &copyFrom)
{

    setSideLength(copyFrom.getSideLength());
    cout << "Assigning Square with SideLength " << copyFrom.getSideLength() << endl;
    return *this;
}
void Square::setSideLength(float newSideLength)
{
    if (newSideLength >= 0)
        sideLength = newSideLength;
    else
        cout << "Error: sideLength should be >= 0" << endl;
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