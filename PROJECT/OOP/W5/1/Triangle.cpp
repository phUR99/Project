#include <iostream>
#include "Shape.h"
#include "Triangle.h"
using namespace std;

Triangle &Triangle::setHeight(float newHeight)
{
    height = newHeight;
    return (*this);
}
Triangle &Triangle::setWidth(float newWidth)
{
    width = newWidth;
    return (*this);
}
Triangle &Triangle::setBottom(float newBottom)
{
    bottom = newBottom;
    return (*this);
}
Triangle &Triangle::setLeft(float newLeft)
{
    left = newLeft;
    return (*this);
}
float Triangle::getHeight() const
{
    return height;
}
float Triangle::getWidth() const
{
    return width;
}
float Triangle::getBottom() const
{
    return bottom;
}
float Triangle::getLeft() const
{
    return left;
}
float Triangle::getArea() const
{
    return (height * width / 2);
}
void Triangle::setColor(int newColor)
{
    if (newColor != RED)
        cout << "Triangles are always Red" << endl;
    color = RED;
}