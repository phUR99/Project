using namespace std;

class Fraction
{
public:
    Fraction(int newTop = 0, int newBottom = 1);
    void print();
    void setTopAndBottom(int newTop, int newBottom);
    int getTop();
    int getBottom();
    void simplify();
    Fraction operator+(Fraction frac2);
    Fraction operator-(Fraction frac2);
    Fraction operator*(Fraction frac2);
    Fraction operator/(Fraction frac2);
    bool operator==(Fraction frac2);
    bool operator>(Fraction frac2);
    bool operator<(Fraction frac2);

private:
    int top, bottom;
};

ostream &operator<<(ostream &output, Fraction &frac1);
int GreatestCommonDenominator(int num1, int num2);