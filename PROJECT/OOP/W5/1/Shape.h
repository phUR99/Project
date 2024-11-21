#ifndef SHAPE_H
#define SHAPE_H

const int RED = 1;
const int BLUE = 2;
const int GREEN = 3;
class Shape
{
protected:
    int color;

public:
    virtual void setColor(int newColor);
    void printColor() const;
    virtual float getArea() const = 0;
};

#endif
