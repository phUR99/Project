class Square
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
    // void setCenter(float newX, float newY);
    void setSideLength(float newSideLength);
    float getX() const;
    float getY() const;
    float getSideLength() const;
    float getArea() const;
    static int getCount();
};