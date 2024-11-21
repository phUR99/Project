import java.util.ArrayList;

public class Arrays2 {
    public static void main(String[] args) {
        int i;
        ArrayList<Integer> myNumbers = new ArrayList<Integer>();
        ArrayList<String> myNames = new ArrayList<String>();

        System.out.println("myNumbers = " + myNumbers);
        myNumbers.add(10);
        System.out.println("myNumbers = " + myNumbers);
        for (i = 0; i < 10; i++) {
            myNumbers.add(i);
        }
        System.out.println("myNumbers = " + myNumbers);
        for (i = 0; i < 10; i++) {
            myNumbers.add(0, i);
        }
        System.out.println("myNumbers = " + myNumbers);
        for (i = 0; i < 10; i++) {
            myNames.add("Hi " + i);
        }
        System.out.println("myNames = " + myNames);
    }
}
