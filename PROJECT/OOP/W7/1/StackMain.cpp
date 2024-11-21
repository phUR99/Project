#include <iostream>
#include "Number.h"
#include "Fraction.h"
#include "ComplexFraction.h"
using namespace std;

template <class T>
class Node
{
public:
    Node<T>();
    T getData();
    void setData(T newData);
    Node *getNext();
    void setNext(Node *next);

private:
    T data;
    Node *next;
};

template <class T>
Node<T>::Node()
{
    next = nullptr;
}

template <class T>
T Node<T>::getData()
{
    return data;
}

template <class T>
void Node<T>::setData(T newData)
{
    data = newData;
}

template <class T>
Node<T> *Node<T>::getNext()
{
    return next;
}

template <class T>
void Node<T>::setNext(Node *newNext)
{
    next = newNext;
}

template <class T>
class Stack
{
public:
    Stack();
    ~Stack();
    void push(T newData);
    T pop();

private:
    Node<T> *head;
};

template <class T>
Stack<T>::Stack()
{
    head = nullptr;
}
template <class T>
Stack<T>::~Stack() {}
template <class T>
void Stack<T>::push(T newData)
{
    Node<T> *newHead = new Node<T>;
    newHead->setNext(head);
    newHead->setData(newData);
    head = newHead;
}

template <class T>
T Stack<T>::pop()
{
    T result = head->getData();
    Node<T> *oldHead = head;
    head = head->getNext();
    delete oldHead;
    return result;
}
int main()
{
    Stack<int> s1;
    s1.push(5);
    s1.push(7);
    cout << s1.pop() << endl;
    cout << s1.pop() << endl;

    Stack<Fraction> s2;
    Fraction f1;
    f1.setTop(4).setBottom(11);
    s2.push(f1);
    f1.setTop(7).setBottom(3);
    s2.push(f1);
    s2.pop().print();
    cout << endl;
    s2.pop().print();
    cout << endl;

    Stack<Number *> s3;
    Fraction f2;
    ComplexFraction cf1;
    f2.setTop(7).setBottom(5);
    cf1.setReal(f1).setImag(f2);
    s3.push(&cf1);
    s3.push(&f2);
    /*
    s3.pop()->print();
    cout << endl;
    s3.pop()->print();
    cout << endl;
    */
    /*
    Fraction *f3 = dynamic_cast<Fraction *>(s3.pop());
    if (!f3)
        cout << "f3 is a null ptr" << endl;
    else
    {
        f3->print();
        cout << endl;
    }
    */
    /*틀린 자료형으로 casting 했을 경우 출력이 안된다*/
    ComplexFraction *cf2 = dynamic_cast<ComplexFraction *>(s3.pop());
    if (!cf2)
        cout << "f3 is a null ptr" << endl;
    else
    {
        cf2->print();
        cout << endl;
    }
    /*
    Number *n1 = s3.pop();
    n1->print();
    cout << endl;
    */
    Stack<Number *> s4;
    Fraction ff1;

    ff1.setBottom(1).setBottom(3);
    s4.push(&ff1);
    ff1.setBottom(2).setBottom(5);
    s4.push(&ff1);
    f1.setBottom(3).setBottom(7);
    s4.push(&ff1);
    Number *ff2 = s4.pop();
    Number *cc2 = s4.pop();
    Number *nn2 = s4.pop();
    s4.push(ff2);
    s4.push(cc2);
    s4.push(nn2);
    Fraction *q1 = dynamic_cast<Fraction *>(s4.pop());
    ComplexFraction *q2 = dynamic_cast<ComplexFraction *>(s4.pop());
    Number *q3 = dynamic_cast<Number *>(s4.pop());
    if (!q1)
        cout << "q1 is a null ptr" << endl;
    else
    {
        q1->print();
        cout << endl;
    }
    if (!q2)
        cout << "q2 is a null ptr" << endl;
    else
    {
        q2->print();
        cout << endl;
    }
    if (!q3)
        cout << "q3 is a null ptr" << endl;
    else
    {
        q3->print();
        cout << endl;
    }
    return 0;
}
