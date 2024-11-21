const float PI = 3.14159;

class Circle
{
private:
    float centerX, centerY, radius;
    static int count;

public:
    Circle();
    Circle(const Circle &copyFrom);
    ~Circle();
    Circle &operator=(const Circle &copyFrom);

    void setCenter(float newX, float newY);
    void setRadius(float newRadius);
    float getX() const;
    float getY() const;
    float getRadius() const;
    float getArea() const;
    static int getCount();
};
