#include <iostream>
#include "Shape.h"
using namespace std;

void Shape::setColor(int newColor)
{
    color = newColor;
}
void Shape::printColor() const
{
    switch (color)
    {
    case RED:
        cout << "Red";
        break;
    case BLUE:
        cout << "Blue";
        break;
    case GREEN:
        cout << "Green";
        break;
    default:
        cout << "Black";
    }
}