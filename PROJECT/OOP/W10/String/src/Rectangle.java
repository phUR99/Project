
public class Rectangle {
    private double top, bottom, left, right;

    public void setBottomTop(double newBottom, double newTop) throws Exception {
        if (newBottom > newTop) {
            System.out.println("Error: Bottom and Top in wrong order");
            throw new Exception();
        }
        top = newTop;
        bottom = newBottom;
    }

    public void setLeftRight(double newLeft, double newRight) throws Exception {
        if (newLeft > newRight) {
            System.out.println("Error: Left and Right in wrong order");
            throw new Exception();
        }
        left = newLeft;
        right = newRight;
    }

    public void setTop(double newTop) throws Exception {
        if (newTop < bottom) {
            System.out.println("Error: Bottom and Top in wrong order");
            throw new Exception();
        }
        top = newTop;
    }

    public void setBottom(double newBottom) throws Exception {
        if (top < newBottom) {
            System.out.println("Error: Bottom and Top in wrong order");
            throw new Exception();
        }
        bottom = newBottom;
    }

    public void setLeft(double newLeft) throws Exception {
        if (newLeft > right) {
            System.out.println("Error: Left and Right in wrong order");
            throw new Exception();
        }
    }

    public void setRight(double newRight) throws Exception {
        if (left > newRight) {
            System.out.println("Error: Left and Right in wrong order");
            throw new Exception();
        }
    }

    public Rectangle(double left, double right, double top, double bottom) throws Exception {
        setBottomTop(bottom, top);
        setLeftRight(left, right);
    }

    public Rectangle() throws Exception {
        this(1, 2, 2, 1);
    }

    public double getTop() {
        return top;
    }

    public double getBottom() {
        return bottom;
    }

    public double getLeft() {
        return left;
    }

    public double getRight() {
        return right;
    }

    public double getHeight() {
        return top - bottom;
    }

    public double getWidth() {
        return right - left;
    }

    public double getArea() {
        return getWidth() * getHeight();
    }

    public boolean insideRectangle(double x, double y) {
        return (x >= left && x <= right && y <= top && y >= bottom);
    }

}
