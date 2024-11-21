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
class Queue
{
public:
    Queue();
    ~Queue();
    void enqueue(T newData);
    T dequeue();

private:
    Node<T> *head;
    Node<T> *tail;
};
template <class T>
Queue<T>::Queue()
{
    head = nullptr;
    tail = nullptr;
}
template <class T>
Queue<T>::~Queue() {}

template <class T>
void Queue<T>::enqueue(T newData)
{
    Node<T> *newTail = new Node<T>;
    if (tail)
        tail->setNext(newTail);
    else
        head = newTail;
    newTail->setData(newData);
    tail = newTail;
}
template <class T>
T Queue<T>::dequeue()
{
    T ret = head->getData();
    Node<T> *oldHead = head;
    head = head->getNext();
    delete oldHead;
    return ret;
}
int main()
{
    Queue<int> q1;
    q1.enqueue(5);
    q1.enqueue(7);
    cout << q1.dequeue() << endl;
    cout << q1.dequeue() << endl;
    Queue<Fraction> q2;
    Fraction f1;
    f1.setTop(4).setBottom(11);
    q2.enqueue(f1);
    f1.setTop(7).setBottom(3);
    q2.enqueue(f1);
    q2.dequeue().print();
    cout << endl;
    q2.dequeue().print();
    cout << endl;
    return 0;
}
