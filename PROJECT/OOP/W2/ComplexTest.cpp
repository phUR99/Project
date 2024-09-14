#include <iostream>
#include "UnitTest.h"
#include "Complex.h"
#include "ComplexTest.h"
using namespace std;

void ComplexTest::ConstructorTest()
{
    Complex complex1, complex2(3), complex3(4, 5);
    UnitTest::assertEquals(complex1.getReal(), 0.0, "Complex");
    UnitTest::assertEquals(complex1.getImag(), 0.0, "Complex");
    UnitTest::assertEquals(complex2.getReal(), 3.0, "Complex");
    UnitTest::assertEquals(complex2.getImag(), 0.0, "Complex");
    UnitTest::assertEquals(complex3.getReal(), 4.0, "Complex");
    UnitTest::assertEquals(complex3.getImag(), 5.0, "Complex");
}
void ComplexTest::setRealAndImagTest()
{
    Complex complex1;
    complex1.setRealAndImag(3, 8);
    UnitTest::assertEquals(complex1.getReal(), 3.0, "setRealAndImag");
    UnitTest::assertEquals(complex1.getImag(), 8.0, "setRealAndImag");
}
void ComplexTest::getRealTest()
{
    Complex complex1;
    complex1.setRealAndImag(5, 9);
    UnitTest::assertEquals(complex1.getReal(), 5.0, "getReal");
}
void ComplexTest::getImagTest()
{
    Complex complex1;
    complex1.setRealAndImag(5, 9);
    UnitTest::assertEquals(complex1.getImag(), 9.0, "getImag");
}
void ComplexTest::operatorPlusTest()
{
    Complex complex1(1, 2), complex2(3, 4), complex3;
    complex3 = complex1 + complex2;
    UnitTest::assertEquals(complex3.getReal(), 4.0, "operator+");
    UnitTest::assertEquals(complex3.getImag(), 6.0, "operator+");
}
void ComplexTest::operatorMinusTest()
{
    Complex complex1(5, 7), complex2(3, 4), complex3;
    complex3 = complex1 - complex2;
    UnitTest::assertEquals(complex3.getReal(), 2.0, "operator-");
    UnitTest::assertEquals(complex3.getImag(), 3.0, "operator-");
}
void ComplexTest::operatorTimesTest()
{
    Complex complex1(7, 3), complex2(3, 4), complex3;
    complex3 = complex1 * complex2;
    UnitTest::assertEquals(complex3.getReal(), 9.0, "operator*");
    UnitTest::assertEquals(complex3.getImag(), 37.0, "operator*");
}
void ComplexTest::operatorDivTest()
{
    Complex complex1(7, 6), complex2(5, 4), complex3;
    complex3 = complex1 / complex2;
    UnitTest::assertEquals(complex3.getReal(), 59.0 / 41.0, "operator/");
    UnitTest::assertEquals(complex3.getImag(), 2.0 / 41.0, "operator/");
}
void ComplexTest::operatorEqualTest()
{
    Complex complex1(1, 2), complex2(3, 4), complex3(1, 2);
    UnitTest::assert(complex1 == complex3, "operator==");
    UnitTest::assert(!(complex1 == complex2), "operator==");
}

int main()
{
    ComplexTest::ConstructorTest();
    ComplexTest::setRealAndImagTest();
    ComplexTest::getRealTest();
    ComplexTest::getImagTest();
    ComplexTest::operatorPlusTest();
    ComplexTest::operatorMinusTest();
    ComplexTest::operatorTimesTest();
    ComplexTest::operatorDivTest();
    ComplexTest::operatorEqualTest();
    UnitTest::printTestResult();
    return 0;
}