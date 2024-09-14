using namespace std;

class Complex
{
public:
    Complex(float newReal = 0, float newImag = 0);
    void print();
    void setRealAndImag(float newReal, float newImag);
    int getReal();
    int getImag();
    Complex operator+(Complex complex2);
    Complex operator-(Complex complex2);
    Complex operator*(Complex complex2);
    Complex operator/(Complex complex2);
    bool operator==(Complex complex2);

private:
    float real, imag;
};

ostream &operator<<(ostream &output, Complex &complex1);