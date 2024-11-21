import java.util.Scanner;

public class CircleArea {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        double radius, area, pi = 3.14159265;
        System.out.print("Enter the radius of the circle: ");
        radius = input.nextDouble();
        if (radius < 0)
            System.out.println("Error: The radius is less than 0");
        else {
            area = radius * radius * pi;
            System.out.printf("the area is %f\n", area);
        }

    }
}
