import java.util.Scanner;

public class TriangleArea {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        double height, width, area;
        System.out.print("Enter the height of the circle: ");
        height = input.nextDouble();
        System.out.print("Enter the width of the circle: ");
        width = input.nextDouble();
        if (height < 0)
            System.out.println("Error: The height is less than 0");
        else if (width < 0)
            System.out.println("Error: The width is less than 0");
        else {
            area = height * width / 2;
            System.out.printf("the area is %f\n", area);
        }

    }
}
