import java.util.Scanner;

public class FractionValue {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int numerator, denominator;
        System.out.print("Enter the numerator: ");
        numerator = input.nextInt();
        System.out.print("Enter the denominator: ");
        denominator = input.nextInt();
        if (denominator == 0)
            System.out.printf("%d / %d = Infinity\n", numerator, denominator);
        else {
            double newFraction = (double) numerator / denominator;
            System.out.printf("%d / %d = %f", numerator, denominator, newFraction);
        }

    }
}
