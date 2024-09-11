class Clock
{
    private:
        int hour, minute, second;
    public:
        Clock();
        void setHour(int newHour);
        void setMinute(int newMinute);
        void setSecond(int newSecond);
        int getHour();
        int getMinute();
        int getSecond();
        void print();

    };
