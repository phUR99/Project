#include "Shape.h"
const float PI = 3.14159;

class Circle : public Shape
{
private:
    float centerX, centerY, radius;
    static int count;

public:
    Circle();
    Circle(const Circle &copyFrom);
    ~Circle();
    Circle &operator=(const Circle &copyFrom);
    Circle &setX(float newX);
    Circle &setY(float newY);
    Circle &setRadius(float newRadius);
    float getX() const;
    float getY() const;

    float getRadius() const;
    float getArea() const;
    static int getCount();
};
