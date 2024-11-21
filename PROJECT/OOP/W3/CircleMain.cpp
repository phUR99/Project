#include <iostream>
#include "Circle.h"
using namespace std;
float calculateTotalArea(Circle *circleArray)
{
    int index;
    float total = 0;
    for (index = 0; index < Circle::getCount(); index++)
    {
        cout << "Circle" << index << " has an area of "
             << circleArray[index].getArea() << endl;
        total = total + circleArray[index].getArea();
    }
    return total;
}
void resizeCircleNormalParameter(Circle circle1)
{
    float radius = circle1.getRadius();
    circle1.setRadius(radius * 2);
}

void resizeCirclePointerParameter(Circle *circle1)
{
    float radius = circle1->getRadius();
    circle1->setRadius(radius * 2);
}
void resizeCircleReferenceParameter(Circle &circle1)
{
    float radius = circle1.getRadius();
    circle1.setRadius(radius * 2);
}

void resizeCircleArrayNormalParameters(Circle *circleArray)
{
    int index;

    cout << "Resizing with Normal Parameters" << endl;
    for (index = 0; index < Circle::getCount(); index++)
    {
        resizeCircleNormalParameter(circleArray[index]);
    }
}
void resizeCircleArrayPointerParameters(Circle *circleArray)
{
    int index;
    cout << "Resizing with Pointer Parameters" << endl;
    for (index = 0; index < Circle::getCount(); index++)
    {
        resizeCirclePointerParameter(&(circleArray[index]));
    }
}

void resizeCircleArrayReferenceParameters(Circle *circleArray)
{
    int index;

    cout << "Resizing with Reference Parameters" << endl;
    for (index = 0; index < Circle::getCount(); index++)
    {
        resizeCircleReferenceParameter(circleArray[index]);
    }
}

Circle createCircle(float newRadius)
{
    Circle newCircle;
    newCircle.setRadius(newRadius);
    return newCircle;
}

void replaceCircleArray(Circle *circleArray)
{
    int index;
    cout << "Replacing Circles" << endl;
    for (index = 0; index < Circle::getCount(); index++)
    {
        circleArray[index] = createCircle(index);
    }
}

int main()
{
    Circle *circleArray;
    int numCircles;
    float totalArea;
    cout << "How many Circles to create? ";
    cin >> numCircles;
    circleArray = new Circle[numCircles];
    totalArea = calculateTotalArea(circleArray);
    cout << "The circles have a total area of " << totalArea << endl;
    resizeCircleArrayNormalParameters(circleArray);
    totalArea = calculateTotalArea(circleArray);
    cout << "The circles have a total area of " << totalArea << endl;
    resizeCircleArrayPointerParameters(circleArray);
    totalArea = calculateTotalArea(circleArray);
    cout << "The circles have a total area of " << totalArea << endl;
    resizeCircleArrayReferenceParameters(circleArray);
    totalArea = calculateTotalArea(circleArray);
    cout << "The circles have a total area of " << totalArea << endl;
    replaceCircleArray(circleArray);
    totalArea = calculateTotalArea(circleArray);
    cout << "The circles have a total area of " << totalArea << endl;
    delete[] circleArray;
}
