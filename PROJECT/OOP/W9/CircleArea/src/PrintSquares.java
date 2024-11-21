public class PrintSquares {
    public static void main(String[] args) {
        int count = 1;
        while (count <= 5) {
            System.out.printf("%d squared is %d\n", count, count * count);
            count++;
        }
    }
}
