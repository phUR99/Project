
import java.util.Arrays;

public class Arrays1 {
    public static void main(String[] args) {
        int[] myArray = { 8, 3, 4, 9, 1 };
        System.out.println("myArray = " + Arrays.toString(myArray));
        Arrays.sort(myArray);
        System.out.println("myArray = " + Arrays.toString(myArray));
        System.out.println("Found number 8 at location " + Arrays.binarySearch(myArray, 8));
        int[] yourArray = new int[6];

        System.arraycopy(myArray, 2, yourArray, 0, 3);
        System.out.println("myArray = " + Arrays.toString(myArray));
        System.out.println("yourArray = " + Arrays.toString(yourArray));
        System.arraycopy(myArray, 2, yourArray, 3, 3);
        System.out.println("myArray = " + Arrays.toString(myArray));
        System.out.println("yourArray = " + Arrays.toString(yourArray));
    }
}
