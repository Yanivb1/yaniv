//talbels.cpp
#include <vector>
#include <iostream>
#include "return.h"

int LINE_NUMBER = 1;

template <class T>
class Table{
    std::vector<T> vec;
    public:
        ReturnValue Insert(T element);
        ReturnValue Remove(T element);
        bool Contain(T element);
        int Tsize();
};

template <class T>
ReturnValue Table<T>::Insert(T element){
    if(std::find(vec.begin(), vec.end(), element) != vec.end()) {
        return Error(LINE_NUMBER);
    }
    vec.push_back(element);
    return Success();
}

template <class T>
ReturnValue Table<T>::Remove(T element){
    if(std::find(vec.begin(), vec.end(), element) == vec.end()) {
        return Error(LINE_NUMBER);
    }
    vec.erase(std::remove(vec.begin(), vec.end(), element), vec.end());
    return Success();
}

template <class T>
int  Table<T>::Tsize(){
    return vec.size();
}

template <class T>
bool Table<T>::Contain(T element){
    return std::find(vec.begin(), vec.end(), element) != vec.end();
}

int main(){
    Table<int> a;
    
    ReturnValue ret = a.Insert(5);
    // ret.print();
    // ret.Run(func,1);
    ReturnValue ret1 = a.Insert(5);
    // ret1.print();
    // ret1.Run(func,2);
    std::cout << a.Tsize() <<std::endl;
    std::cout << a.Contain(5)<<std::endl;
    ReturnValue ret2 = a.Remove(5);
    // ret2.print();
    // ret2.Run(func,3);
    std::cout << a.Contain(5)<<std::endl;
    std::cout << a.Tsize();

    return 1;
}