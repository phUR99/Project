// Clock.h
// This class describes a Clock
class Clock
{
private:
    int hour;
    int minute;
    int second;
    const int IDnumber; // Each Clock instance has an ID which cannot change
public:
    // Constructor
    Clock(int newID);
    // Normal Setters
    void setHour(int newHour);
    void setMinute(int newMinute);
    void setSecond(int newSecond);
    // Cascading Setters returning an instance
    Clock setHourIns(int newHour);
    Clock setMinuteIns(int newMinute);
    Clock setSecondIns(int newSecond);
    // Cascading Setters returning a pointer
    Clock *setHourPtr(int newHour);
    Clock *setMinutePtr(int newMinute);
    Clock *setSecondPtr(int newSecond);
    // Cascading Setters returning a reference
    Clock &setHourRef(int newHour);
    Clock &setMinuteRef(int newMinute);
    Clock &setSecondRef(int newSecond);
    // Getters
    int getHour() const;
    int getMinute() const;
    int getSecond() const;
    int getIDNumber();
    // Advance one hour
    void advanceOneHour();
    void advanceOneMinute();
    void advanceOneSecond();
    // Printing Methods
    void printTwoDigits(int number) const;
    void printTime() const;
};
