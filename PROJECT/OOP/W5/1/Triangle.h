#include "Shape.h"

class Triangle : public Shape
{
private:
    float height;
    float width;
    float bottom;
    float left;

public:
    Triangle &setHeight(float newHeight);
    Triangle &setWidth(float newWidth);
    Triangle &setBottom(float newBottom);
    Triangle &setLeft(float newLeft);
    float getHeight() const;
    float getWidth() const;
    float getBottom() const;
    float getLeft() const;
    float getArea() const;
    virtual void setColor(int newColor);
};
