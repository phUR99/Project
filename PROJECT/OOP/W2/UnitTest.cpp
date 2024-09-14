#include <iostream>
#include <cmath>
#include "UnitTest.h"
using namespace std;

void UnitTest::assert(bool testValue, const string testString)
{
    testFailed = testFailed || !testValue;
    if (testValue && reportSuccess)
    {
        cout << "Test Passed: " << testString << endl;
    }
    if (!testValue && reportFailure)
    {
        cout << "Test ***** FAILED *****: " << testString << endl;
    }
}
void UnitTest::assertEquals(int num1, int num2, const string testString)
{
    assert(num1 == num2, testString);
}
void UnitTest::assertEquals(float value1, float value2, const string testString)
{
    assert(abs(value1 - value2) < 0.0001, testString);
}
void UnitTest::printTestResult()
{
    if (testFailed)
    {
        cout << "Test FAILED\n";
    }
    else
    {
        cout << "All tests PASSED\n";
    }
}