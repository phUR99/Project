#include <iostream>
#include "Square.h"
using namespace std;
float calculateTotalArea(Square *circleArray)
{
    int index;
    float total = 0;
    for (index = 0; index < Square::getCount(); index++)
    {
        cout << "Square" << index << " has an area of "
             << circleArray[index].getArea() << endl;
        total = total + circleArray[index].getArea();
    }
    return total;
}
void resizeSquareNormalParameter(Square circle1)
{
    float sideLength = circle1.getSideLength();
    circle1.setSideLength(sideLength * 2);
}

void resizeSquarePointerParameter(Square *circle1)
{
    float sideLength = circle1->getSideLength();
    circle1->setSideLength(sideLength * 2);
}
void resizeSquareReferenceParameter(Square &circle1)
{
    float sideLength = circle1.getSideLength();
    circle1.setSideLength(sideLength * 2);
}

void resizeSquareArrayNormalParameters(Square *circleArray)
{
    int index;

    cout << "Resizing with Normal Parameters" << endl;
    for (index = 0; index < Square::getCount(); index++)
    {
        resizeSquareNormalParameter(circleArray[index]);
    }
}
void resizeSquareArrayPointerParameters(Square *circleArray)
{
    int index;
    cout << "Resizing with Pointer Parameters" << endl;
    for (index = 0; index < Square::getCount(); index++)
    {
        resizeSquarePointerParameter(&(circleArray[index]));
    }
}

void resizeSquareArrayReferenceParameters(Square *circleArray)
{
    int index;

    cout << "Resizing with Reference Parameters" << endl;
    for (index = 0; index < Square::getCount(); index++)
    {
        resizeSquareReferenceParameter(circleArray[index]);
    }
}

Square createSquare(float newSideLength)
{
    Square newSquare;
    newSquare.setSideLength(newSideLength);
    return newSquare;
}

void replaceSquareArray(Square *circleArray)
{
    int index;
    cout << "Replacing Squares" << endl;
    for (index = 0; index < Square::getCount(); index++)
    {
        circleArray[index] = createSquare(index);
    }
}

int main()
{
    Square *circleArray;
    int numSquares;
    float totalArea;
    cout << "How many Squares to create? ";
    cin >> numSquares;
    circleArray = new Square[numSquares];
    totalArea = calculateTotalArea(circleArray);
    cout << "The circles have a total area of " << totalArea << endl;
    resizeSquareArrayNormalParameters(circleArray);
    totalArea = calculateTotalArea(circleArray);
    cout << "The circles have a total area of " << totalArea << endl;
    resizeSquareArrayPointerParameters(circleArray);
    totalArea = calculateTotalArea(circleArray);
    cout << "The circles have a total area of " << totalArea << endl;
    resizeSquareArrayReferenceParameters(circleArray);
    totalArea = calculateTotalArea(circleArray);
    cout << "The circles have a total area of " << totalArea << endl;
    replaceSquareArray(circleArray);
    totalArea = calculateTotalArea(circleArray);
    cout << "The circles have a total area of " << totalArea << endl;
    delete[] circleArray;
}
