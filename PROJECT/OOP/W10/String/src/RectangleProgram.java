import java.util.Scanner;

public class RectangleProgram {
    static Rectangle myRectangle;
    static char commandLetter;
    static double newLocation;

    static void printRectangleDetails() {
        System.out.println("Rectangle Info:");
        System.out.printf("Left = %f, Right = %f, Bottom = %f, Top = %f\nWidth = %f, Height = %f, Area = %f\n",
                myRectangle.getLeft(), myRectangle.getRight(), myRectangle.getBottom(), myRectangle.getTop(),
                myRectangle.getWidth(), myRectangle.getHeight(), myRectangle.getArea());
    }

    static void printMenu() {
        System.out.println("T) Change Top");
        System.out.println("B) Change Bottom");
        System.out.println("L) Change Left");
        System.out.println("R) Change Right");
        System.out.println("Q) Quit");

    }

    static void getCommand() {
        Scanner input = new Scanner(System.in);

        System.out.print("What do you want to do? : ");
        String c = input.nextLine();
        commandLetter = c.charAt(0);

    }

    static void getNewLocation() {
        Scanner input = new Scanner(System.in);
        if (commandLetter == 'T') {
            System.out.print("What should be the top become? : ");
        } else if (commandLetter == 'B') {
            System.out.print("What should be the bottom become? : ");
        } else if (commandLetter == 'L') {
            System.out.print("What should be the left become? : ");
        } else if (commandLetter == 'R') {
            System.out.print("What should be the right become? : ");
        }
        newLocation = input.nextDouble();
    }

    static void updateRectangle() throws Exception {
        if (commandLetter == 'T') {
            myRectangle.setBottomTop(myRectangle.getBottom(), newLocation);
        } else if (commandLetter == 'B') {
            myRectangle.setBottomTop(newLocation, myRectangle.getTop());
        } else if (commandLetter == 'L') {
            myRectangle.setLeftRight(newLocation, myRectangle.getRight());
        } else if (commandLetter == 'R') {
            myRectangle.setLeftRight(myRectangle.getLeft(), newLocation);
        }
    }

    public static void main(String[] args) throws Exception {
        myRectangle = new Rectangle();
        while (true) {
            printRectangleDetails();
            printMenu();
            getCommand();
            if (commandLetter == 'Q')
                break;
            getNewLocation();
            updateRectangle();
        }
    }
}
