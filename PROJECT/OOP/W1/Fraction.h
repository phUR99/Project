class Fraction
{
    public:
        Fraction();
        void setTop(int newTop);

        void setBottom(int newBottom);
        int getTop();
        int getBottom();

        void print();
        void printInverted();
        void printDoubled();
        void printSquared();
        void printFloatingPoint();

    private:
        int top, bottom;
};
