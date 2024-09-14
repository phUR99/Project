using namespace std;

static bool testFailed = 0;
const bool reportFailure = 1;
const bool reportSuccess = 1;

class UnitTest
{
public:
    static void assert(bool testValue, const string testString);
    static void assertEquals(int num1, int num2, const string testString);
    static void assertEquals(float value1, float value2, const string testString);
    static void printTestResult();
};