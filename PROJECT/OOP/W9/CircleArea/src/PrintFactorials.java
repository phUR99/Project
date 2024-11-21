import java.util.Scanner;

public class PrintFactorials {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int count = 0;
        int total = 1;
        int max;
        System.out.print("How many factorials to print? ");
        max = input.nextInt();
        while (count < max) {
            System.out.printf("%d! = %d\n", count, total);
            total *= ++count;
        }

    }
}
