#include "Shape.h"

class Square : public Shape
{
private:
    float centerX;
    float centerY;
    float sideLength;
    static int count;

public:
    // Constructor, Copy Constructor, Destructor, and Assignment Operator Square();
    Square();
    Square(const Square &copyFrom);
    ~Square();
    Square &operator=(const Square &copyFrom);

    // Setters and Getters
    Square &setSideLength(float newSideLength);
    Square &setCenterX(float newX);
    Square &setCenterY(float newY);
    float getX() const;
    float getY() const;
    float getSideLength() const;
    float getArea() const;
    static int getCount();
};