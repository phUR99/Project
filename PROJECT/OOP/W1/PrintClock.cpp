#include <iostream>
#include "Clock.h"
using namespace std;

int main(){
    Clock clock1;
    clock1.setHour(2);
    clock1.setMinute(45);
    clock1.setSecond(0);
    clock1.print();

    return 0;
}
