public class Strings2 {
    public static void main(String[] args) {
        long startTime = 0, endTime = 0;
        String string1 = new String("hello");
        System.out.printf("\n");
        System.out.printf("string1 is %s\nstring1.length is %d\n\n", string1, string1.length());

        StringBuilder stringBuilder1 = new StringBuilder(string1);
        System.out.printf("stringBuilder 1 is %s\n", stringBuilder1);

        for (int i = 0; i < 16; i++) {

            System.out.printf("length is %d, capacity is %d, insertion time is %d\n,",
                    stringBuilder1.length(), stringBuilder1.capacity(), endTime - startTime);
            startTime = System.nanoTime();
            stringBuilder1.append("Goodbye");
            endTime = System.nanoTime();
        }
        System.out.printf("\n");
        String string2 = stringBuilder1.toString();
        System.out.printf("string2 is %s\nstring2.length is %d\n\n", string2, string2.length());
    }
}
