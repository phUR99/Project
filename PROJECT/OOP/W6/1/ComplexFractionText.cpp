#include <iostream>
#include <fstream>
#include <stdexcept>
#include <string>
#include <cstdlib>
#include "Number.h"
#include "Fraction.h"
#include "ComplexFraction.h"

int msgReadInt(string message)
{
    int inputNum;
    cout << message;
    cin >> inputNum;
    return inputNum;
}
void changeComplexFraction(ComplexFraction &compFrac)
{
    Fraction realFrac, imagFrac;
    realFrac.setTop(msgReadInt("Real Numerator:")).setBottom(msgReadInt("Real Denominator:"));
    imagFrac.setTop(msgReadInt("Imaginary Numerator:")).setBottom(msgReadInt("Imaginary Denominator:"));
    compFrac.setReal(realFrac).setImag(imagFrac);
}
int chooseFromMenu()
{
    int menuNum = 0;
    while (menuNum == 0)
    {
        try
        {
            cin >> menuNum;
            if (menuNum < 1 || menuNum > 4)
                throw runtime_error("Invalid menu item");
        }
        catch (runtime_error &ex)
        {
            cout << ex.what() << endl;
            menuNum = 0;
        }
    }
    return menuNum;
}
void writeFractionToFile(ComplexFraction compFrac, char *filename)
{
    ofstream myfile;

    try
    {
        myfile.open(filename, ios::app);
        if (!myfile)
            throw runtime_error("Read_only file");
        myfile << compFrac.getReal().getTop() << " ";
        myfile << compFrac.getReal().getBottom() << " ";
        myfile << compFrac.getImag().getTop() << " ";
        myfile << compFrac.getImag().getBottom() << " ";
        myfile << endl;
        myfile.close();
    }
    catch (runtime_error &e)
    {
        std::cout << e.what() << '\n';
    }
}
Fraction readFractionFromFile(ifstream &myFile)
{
    int top, bottom;
    Fraction myFrac;
    myFile >> top >> bottom;
    myFrac.setTop(top).setBottom(bottom);
    return myFrac;
}
void printAllFraction(char *filename)
{
    ifstream myfile;
    ComplexFraction compFrac;
    Fraction realFrac, imagFrac;
    myfile.open(filename, ios::in);
    if (!myfile)
        throw runtime_error("Error opening file");
    while (!myfile.eof())
    {
        try
        {
            realFrac = readFractionFromFile(myfile);
            imagFrac = readFractionFromFile(myfile);

            compFrac.setReal(realFrac).setImag(imagFrac);

                        if (!myfile.eof())
                compFrac.print();
            cout << endl;
        }
        catch (runtime_error &ex)
        {
            cout << ex.what() << endl;
        }
    }
    myfile.close();
}
void printComplexFraction(ComplexFraction compFrac)
{
    cout << endl;
    cout << "Current Complex Fraction = ";
    compFrac.print();
    cout << endl;
    cout << "____________" << endl;
}
void printMenu()
{
    cout << "1) Change Complex Fraction" << endl;
    cout << "2) Append Complex Fraction to file" << endl;
    cout << "3) Print all Complex Fractions in file" << endl;
    cout << "4) Quit" << endl;
}
void menuAction(int menuChoice, ComplexFraction &compFrac, char *filename)
{
    switch (menuChoice)
    {
    case 1:
        changeComplexFraction(compFrac);
        break;
    case 2:
        writeFractionToFile(compFrac, filename);
        break;
    case 3:
        printAllFraction(filename);
        break;
    case 4:
        exit(0);
    }
}
int main()
{
    ComplexFraction cf1;
    int menuChoice;
    char filename[25] = "ComplexFractions.txt";
    while (1)
    {
        printComplexFraction(cf1);
        printMenu();
        menuChoice = chooseFromMenu();
        menuAction(menuChoice, cf1, filename);
    }
}