/*
 * C++ is ans extension of C
 * C programs work in a c++ compiles
 * C++ combines OOP code with non-OOP Code main is not inside a class
 * 
 * JAVA is designed to be an OOP Language from the Beginning
 * Only OOP code 
 * One main function must be inside a class
 * 
 * C++ gives a high level of control over memory
 * Memory can be directly read and written at a memory address using pointers
 * 
 * JAVA menages its own memory
 * You cannot directly read or write memory
 * 
 * C++ programs are compiled to object file and then to an executable file 
 * hello.cpp -> hello.obj -> hello.exe
 * The executable file can be directly run in the OS
 * 
 * JAVA programs are complied to byte code
 * Byte code can be quickly translated to any assembly language or machine code for any OS
 * windows/macOs/linux
 * 
 * JAVA byte code is the same for any os there exists a java virtual machine(JVM)
 * for each OS which can run JAVA byte code
 * hello.java -> hello.class(byte code) -> JVM
 *
 * In C++, we need to allocate and release memory in the code with new & delete, constructor & destructor
 * in JAVA, memory is automatically released the JVM does garbage collection
 * 
 * In JAVA, we have constructors but no destructors
 * We use 'new' but not 'delete' if the JVM notices a block of memory is not being used anymore
 * the garbage collector will release the memory
 */
// File name must be the same as the class name
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");
        int num = 5;
        double x, y;
        // x = num; (OK)
        // num = x; (ERROR : hierarchy)
        // NATIVE types in JAVA (a -> b -> c -> d -> e -> f)
        /*
         * You can assign from right to left
         * You cannot assign from left to right
         * unless you use an explicit cast
         * double x = 3.5;
         * int num;
         * num = x; (error)
         * num = (int) x; (OK)
         * IF you lose information in an assignment float -> int or double -> float or
         * int
         * -> short on explicit must be used
         */
        // byte 8 : 4 : 8 : 4 : 2 : 1
        double a;
        float b;
        long c;
        int d;
        short e;
        byte f;
        /*
         * In JAVA, you cannot use any variable which was never assigned
         * int x;
         * float y = x (ERROR)
         * Variable x cannot be read before it is written
         * The compiler gives an error there is any possibly
         * that variable was read before it was written
         * if (y > 4)
         * x = num;
         * else
         * x = num + 1;
         * y = x; (error)
         * 
         * circle c1; <- JAVA creates a pointer
         * c1 = new circle(); <- creates an instance
         * The only way to create an instance in JAVA is with "new"
         * 
         * circle c1 = new circle();
         * circle c2 = c1; (c1 and c2 both point the same instance)
         * 
         * variables in JAVA are either class pointer or native types
         */

        /*
         * Printing in JAVA
         * 
         * System.out.print("hello");
         * prints hello and stays on the same line
         * 
         * System.out.println("hello");
         * prints hello and goes to the next line
         * 
         * System.out.printf(null, args)
         * prints using C style printf
         * int x = 5;
         * System.out.printf("x is %d", x);
         */
    }
}
