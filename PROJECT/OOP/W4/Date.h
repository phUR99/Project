// Date.h
// This class describes a Date
class Date
{
private:
    int year;
    int month;
    int day;

public:
    // Constructor
    Date();
    // Normal Setters
    void setYear(int newYear);
    void setMonth(int newMonth);
    void setDay(int newDay);
    // Cascading Setters returning an instance
    Date setYearIns(int newYear);
    Date setMonthIns(int newMonth);
    Date setDayIns(int newDay);
    // Cascading Setters returning a pointer
    Date *setYearPtr(int newYear);
    Date *setMonthPtr(int newMonth);
    Date *setDayPtr(int newDay);
    // Cascading Setters returning a reference
    Date &setYearRef(int newYear);
    Date &setMonthRef(int newMonth);
    Date &setDayRef(int newDay);
    // Getters
    int getYear() const;
    int getMonth() const;
    int getDay() const;
    int getIDNumber();
    // Advance one hour
    void advanceOneYear();
    void advanceOneMonth();
    void advanceOneDay();
    // Printing Methods
    void printTwoDigits(int number) const;
    void printDate() const;
};
