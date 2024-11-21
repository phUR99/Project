/*
superclass <- subclass

*/
class shape
{
    int color;
};
class polygon : public shape
{
    int numSide;
};
class square : public polygon
{
    float sideLength;
};
class circle : public shape
{
    float radius;
};
/*
shape s1;
MEMORY
/////[color]/////
polygon p1;
/////[color, numSide]/////
square s1;
/////[color, numSide, sideLength]/////
circle c1;
/////[color, radius]/////
int* num_1;
s1.setColor(5);
p1.setColor(7);
p1.setNumSide(4);
num_1 = reinterpret_cast<int*> &p1;
Q : cout << *num_1 ? A : 7 [color <- point now, numSide]

modify
class shape{
    float area;
    int color;
}
num_1 = reinterpret_cast<int*> &p1;
Q : cout << *num_1 ? A : 7 [area <- point now, color, numSide]
-> ptr points int, but data is float -> make a wrong output

Give a virtual methods to shape
class shape{
    int color;
    virtual int getColor();
    virtual float getArea();
}
class polygon : public shape(){
    int numSides;
    virtual int getColor();
}
shape is polymorphic :
/////[color, shape, ..polymorphic]///// <- s1, p1
when an instance of a polymorphic class is created
there is an extra ptr created at the beginning of the instance.

int* num_1 = reinterpret_cast<int*> p1;
cout << *num_1 : prints the ptr
shape *s1;
s1 = new circle; (o)
s1->getArea();   (o)

circle *c1 = s1; (error)
circle *c2 = dynamic_cast<circle> s1 (o); (that's why we need dynamic_cast)

dynamic_cast will check the class in memory
s2 & c2 : [color, radius, ... circle]
if the class matches assignment, then the ptr is assigned correctly.
if the class not match, then the ptr is assigned to NULL(0);
shape *s3 = new Triangle;
circle *c3 = dynamic_cast<circle*> s3; (c3 is NULL)

Templates
templates are used to give the ability to combine a class with other possible class

Linked list
[data, ] -> [data, ] -> [data, ]
data could be any type or any class
A template can combine the LinkedList class with the class or type of the data


How to use it
LinkedList<int> myIntList;
LinkedList<circle*> myCircleList;
LinkedList<Fraction> myFractionList;
data can be an int, or a ptr, or an instance or anything
*/
#include <bits/stdc++.h>
using namespace std;
template <typename T>
class Node
{
private:
    T data;
    Node<T *> next;

public:
    T getData();
    void setData(T);
};
/*
Push adds at new Node to a LinkedList
*/

template <typename T>
class LinkedList
{
private:
    Node<T> *head;

public:
    Node<T> *getHead();
    void setHead(Node<T> *newHead);
    void push(T newData);
};

template <typename T>
void LinkedList<T>::push(T newData)
{
    Node<T> *newHead = new Node<T>;
    newHead->setData(newData);
}
/*
destructors, copy constructors and assignment operators.
Most classes which we used did not need these.
Which classes need these methods.

Destructors
whenever an instance is removed from Memory, all its member data is removed from memory automatically without any destructors
But this is SHALLOW deletion.

circle
[color, radius] color and radius are automatically removed from memory
However, if the instance has a ptr, then the ptr is not followed

*/
class TwoShape
{
    shape *s1;
    shape *s2;
};
/*
/////[s1, s2]/////
s1 : [circle]
s2 : [square]
When a TwoShape instance is removed from memory its ptrs are removed
But the targets of the ptrs are not removed --> memory leaked!!!
This creates a MEMORY LEAK unless we create a destructors
*/
// deep deletion
TwoShape::~TwoShape()
{
    if (s1)
        delete s1;
    if (s2)
        delete s2;
}
/*
When an instance is copied a SHALLOW copy is done automatically
TwoShape s1;
s1.setShape1(new circle);
s1.setShape2(new square);
TwoShape s2 = s1; (shallow copy)
Memory
s1 : [circle, square]
s2 : copy the ptr of s1 (pointing same shape of s1) (maybe i don't want)
SHALLOW COPY is done automatically
IF we want a deep copy, then we should create an assignment operator(operator=), and a copy constructors.

*/
