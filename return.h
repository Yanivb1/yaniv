//return.h

//return values
#include <string>

class ReturnValue{
    protected:
    std::string type;
    
    public:
    // void Run(std::function< void() > Ran,int a){Ran();};
    ReturnValue(std::string type):type(type){};
    // void print(){std::cout << type<<std::endl;}
};

class Success : public ReturnValue{
    public:
    Success():ReturnValue("Success"){};
};

class Error : public ReturnValue{  
    public:
    Error(int line):ReturnValue("Error"){};   
    void Run(){std::cout<<"im here";}
};
