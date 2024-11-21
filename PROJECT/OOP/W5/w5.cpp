/*
inheritance
one class can be a subclass of another class
subclass means subset


egg -> food
noodle -> food

don't repeat yourself(DRY)

this code isn't DRY because the same code appears in both boil method

ex) circle <= shape
ex) square <= shape

circle -> shape
square -> shape
make a SUPERCLASS shape
shape -> color
... circle -> radius, x, y
... rectangle -> top, bottom, left, right...
*/
class shape
{
private:
    int color;

public:
    void setColor();
    int getColor() const;
};
class Circle : public shape
{
private:
    float radius, xCenter, yCenter;

public:
    void setRadius();
    void setXY();
    float getRadius() const;
    float getX() const;
    float getY() const;
};
/*
Circle inherits from shape
an instance of the circle class can use all the methods and data from both circle
and shape class
*/
class Rectangle : public shape
{
private:
public:
};
/*
do i want to have the ability to create an instance of shape?

i want to get the area of a shape
Circle : PI * radius * radius
Rectangle : (right - left) * (bottom - top);

in c++
you can create the superclass in two ways
- allow an instance to be created
- forbid any instance from being created
if we do not allow an instance to be created then the class is called an ABSTRACT CLASS
*/
class SHAPE
{
public:
    float getArea(); // for every kind of shape i can always get the area.
    // every subclass of shape must create the getArea();
};
/*
Polymorphism
if a class is polymorphic, then a superclass can change into a subclass.
instance of shape
//////[color]////// other data..
cannot change an instance of a shape to an instance of a circle
However a ptr to a shape an change into a ptr to a circle

Shape *s2\
/////[color]////
/////[subclass_parameter]
s2 = new circle
s2->getArea();
s2 = new Rectangle;
s2->getArea();
When getArea is called there are extra instructions performed to check
which class it is in c++ getArea is a VIRTUAL method
*/
/*
getArea is a virtual method
it can be run inherit class
I may want to forbid getArea in the shape class
then change getArea to a PURE VIRTUAL METHOD
*/

// ABSTRACT CLASS
class SHAPPE
{
public:
    // pure virtual method
    virtual float getArea() = 0;
};
/*
if a class has any pure virtual method then i cannot create an instance
if a class has any pure virtual method then it is an ABSTRACT class, i cannot
create an instance of this class


shape *s1
s1 = new shape (error)
s1->getArea(error)
s1 = new circle(o)
s1->getArea()(o)
s1 = new square(o)
s1->getArea()(o)
Any subclass of shape must have a getArea()
method of must als declare getArea as a PURE VIRTUAL METHOD
shape <- round shape <- circle, eclipse
///getArea is pure virtual
////// getArea is pure virtual
///////// getArea instructions
*/