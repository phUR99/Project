/*
getArea method
inside circle class this calculates : pi*r^2
inside square class this calculates : L^2
getArea is overloaded

In c++, operators(<, >, ==, =, ...) can be overloaded
the operator+ has different meanings inside fraction, complex, matrix, string(class)
Fraction f1, f2
f1.setTopBottom(3, 5) f1 -> instance, setTopBottom() -> method, (3, 5) -> parameter
f2.setTopBottom(2, 3)
f3 = f1 + f2; -> f1 + f2 ? same as f1.add(f2), which returns the sum of f1 and f2.
Fraction Fraction::add(Fraction f){
    Fraction newFraction;
    newFraction.setTopBottom(getBottom() + f.getBottom(),
        ...)
    return newFraction;
}
Fraction Fraction::operator<(Fraction f){


}
class ABC{

    xyz C;
}
class XYZ{
    float...

}
A pointer is,
a memory address,
a location in memory
if i want a variable in main to change while being used in a different function then
the variable should be change to a pointer

therefore we might want to create the circle and square inside the constructor
new creates an instance a returns a pointer to that instance
when c1 is removed from memory it does not automatically remove the circle and square from memory

Destructor
the destructor is called when the instance is removed from memory.
XYZ::~XYZ(){
    delete...,
}
delete removes an instance created by new
if c1 passed as a parameter to a function the the circle and square are not copied automatically,
A copy constructor is called when and instance as a parameter

XYZ::XYZ(XYZ x){
     = x.get...();
     = x.get...();
}


*/