/*
runtime error
throw runtime error("Invalid Shape")

Exception
try - block of code where an error might happen
catch - what to do if there is an error
throw - create an error
try{
    myfile.open("file.txt", ios, in);
    myoutfile.open("file.txt", ios, out);
    myfile << "Hello" << endl;
    myoutfile << "HEllo" << endl;
}
// defend crash
catch(runtime error ex){
    cout << "Error opening file" << endl;
}

function B(){
    myfile.open("file3.txt", ios, int),
    int x << myfile;
}
int main(){
    try {
        function B(){

        }
    }
    catch(runtime error ex){
        cout << "Error opening file" << endl;
        cout << ex.what() << endl;
    }
}
Files
text file - can be read by a human
Contains characters with ASCII Codes 0 ~ 127
binary file - might contain unreadable characters with ASCII Codes 0~255

kinds of file
files are an instance of a class in c++
ifstream file1 (instance of ifstream) ifstream - input file stream class
file1.open(filename, ios::in)

ofstream file2 (instance of ofstream) ofstream - output file stream class
1. file2.open(filename, ios::out)
2. file2.open(filename, ios::app)(append obj to EOF)
file2 << "HELLO"; (sim. cout)
string str1;
file1 >> str1; (sim. cin)
file1.close();
file2.close();

binary files
read and write a binary file
by copying between a block of mem. and the file

mem
////[ block ] ///

file
mem mem.....
need a ptr to the mem block
need the size of the mem block - how many byte??
write from mem block to file
circle c1;
c1.setRadius(5.0);
c2.setXY(25, 32);
mem
///[5.0, 7.5, 3.2] ///
ofstream circleFile;
circleFile.open("circle.bin", ios::out, ios::binary);
circleFile.write(&c1, sizeof(c1)); warning : circle ptr to char ptr -> operation of cast
circleFile.write(reinterpret_cast<char*>&c1, sizeof(c1));
circleFile.close();

reading from a binary file copy from file to a block of mem need to allocate space in mem
before reading from the file;

circle *c2 = new circle or new [sizeof(circle)];

ifstream circleFile;
circleFile.open("circle.bin", ios::in | ios::binary)'
warning //  circleFile.read(c2, sizeof(circle));
no waring //circleFile.read(reinterpret_cast<char*> c2, sizeof(circle));
circleFIle.close();

reinterpret_cast ??
casting - change one type to a different type
integer -> floating point
floating point -> integer
one ptr can be cast to different ptr
new Circle returns a ptr to a circle
shape * s1 = new circle; : circle ptr --> shape ptr;

c++ has 4 diff. kinds of cast
1. static_cast - change data int -> float or float -> int / subclass ptr -> superclass ptr;
2. dynamic_cast - superclass ptr -> subclass ptr
3. reinterpret_cast - any ptr -> any ohter ptr (never changes thr ptr or data)
4. const_cast - remove "const" from a ptr

when to use dynamic_cast
circle *c1 = new circle;
shape  *s1 = c1;
circle *c2 = s1 (error)
circle *c2 = dynamic_cast<circle*> s1 (not error)
const int x = 5;
const int *y = &x; (const ptr)*y = 4(error)
int *z = &x (error) x is constant, ptr must be a const ptr
int *a = y (error)
int *b = const_cast<int*> y (OK)

mem
////[x : 5]///[y]///[b] /// [5 -> 3] ///
*b= 3 (OK)

*/
