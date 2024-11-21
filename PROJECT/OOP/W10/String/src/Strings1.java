public class Strings1 {

    public static void main(String[] args) {
        String string1 = "hello ";
        String string2 = "Goodbye ";
        String string3 = string1;
        string1 = string1 + string2;
        System.out.println("string1 is " + string1);
        System.out.println("string2 is " + string2);
        System.out.println("string3 is " + string3);
        System.out.println();

        StringBuilder stringBuilder1 = new StringBuilder("Hello ");
        StringBuilder stringBuilder2 = new StringBuilder("Goodbye ");
        StringBuilder stringBuilder3 = stringBuilder1;
        stringBuilder1.append(stringBuilder2);
        System.out.println("stringBuilder1 is " + stringBuilder1);
        System.out.println("stringBuilder2 is " + stringBuilder2);
        System.out.println("stringBuilder3 is " + stringBuilder3);
    }
}