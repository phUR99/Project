
/*
 * JAVA variable
 * native types
 * pointers
 * string
 * array
 * 
 * Scanner class
 * the scanner class is used to read input from the keyboard or from a text file
 */
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class TODAY {
    public static void main(String[] args) {
        Scanner input;
        input = new Scanner(System.in);
        int num;
        num = input.nextInt();
        // num = input.nextFloat(); (error)
        float x;
        x = input.nextFloat();
        // x = input.nextDouble() (error)
        x = (float) input.nextDouble();
        x = input.nextInt();
        double d;
        d = input.nextDouble();
        d = input.nextInt();

        String word;
        word = input.next();
        String line;
        line = input.nextLine();
        /*
         * STRINGS AND CHARS
         * char c++ vs JAVA (1 byte ASCII VS 2 bytes unicode)
         * wchar 2 bytes unicode (not in JAVA)
         * 
         */
        char c;
        // c = input.nextChar();
        /*
         * Strings int c and c++ are an array of char
         * Java strings are also array of char
         * Strings in Java are immutable
         * immutable : the data im memory cannot be changed
         * A string in Java is always an instance of the String class
         */
        String str1; // pointer, not instance
        str1 = new String("Hi");
        str1 = "HI";
        str1 = "HELLO";
        // 3 instance were created at 3 different places in memory
        String name1 = "DAVID";
        String name2 = "WAGNER";
        // concat 2 string and create a new instance
        name1 = name1 + name2;
        System.out.println(name1);
        String str_1 = "abc", str_2 = "xyz";
        String str_3 = str_1;
        str_1 = str_1 + str_2;
        System.out.println(str_1); // abcxyz
        System.out.println(str_3); // abc
        // abc |||| xyz |||| abcxyz
        str_3 = str_2;
        /*
         * "abc" is automatically removed by garbage collector
         * 
         */
        StringBuilder str_4;
        str_4 = new StringBuilder("JAVA");
        StringBuilder str_5 = str_4;
        str_4.append(str_3);
        StringBuilder name;
        name = new StringBuilder("d");
        name.append("a");
        name.append("v");
        name.append("i");
        name.append("d");
        System.out.println(name);
        int[] myArray = { 5, 8, 7, 3 };
        int[] myArray2 = new int[56];
        // System.out.println(Arrays.length(myArray));
        /*
         * The length of an Array cannot be change after the array is created
         * ArrayList allows you to create an Array can change its length
         */
        ArrayList<Integer> ArrayList1;
        ArrayList1 = new ArrayList<Integer>();
        ArrayList1.add(3);
        ArrayList1.add(9);
        ArrayList1.add(8);
        ArrayList1.add(0);
        /*
         * Exception in Java
         * Exceptions were part of Java since the beginning of the Language c++ copied
         * the idea
         * Exceptions in Java are their own class
         * to throw an exception an instance of the exception must be createed
         */
        int month = input.nextInt();
        if (month >= 12 || month < 1)
            throw new Exception("Invalid month");
    }
}
