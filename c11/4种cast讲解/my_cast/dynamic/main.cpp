/* 
  dynamic_cast用法：

  2.1	只有在派生类之间转换时才使用dynamic_cast，type-id必须是类指针，类引用或者void*

  2.2	基类必须要有虚函数，因为dynamic_cast是运行时类型检查，需要运行时类型信息，
     而这个信息是存储在类的虚函数表中，只有一个类定义了虚函数，才会有虚函数表
*/

#include <iostream>

using namespace std;

class CBase 
{
public:

  virtual void foo(){
    cout << "CBase()::void foo()" << endl;
  }

  void foo_1(){
    cout << "CBase()::void foo_1()" << endl;
  }
};

class CDerived : public CBase
{
public:
  virtual void foo(){
    cout << "CDerived::void foo()" << endl;
  }

  void foo_2(){
    cout << "CDerived::void foo_2()" << endl;
  }
};


//菱形继承
class A 
{
public:
  virtual void foo(){}
};

class CBase2 : virtual public A
{
public:
  virtual void foo(){
    cout << "CBase()::void foo()" << endl;
  }
};

class CBase1 : virtual public A
{
public:

  virtual void foo(){
    cout << "CBase1()::void foo()" << endl;
  }
};

class CDerived1 : public CBase2,
                  public CBase1

{
public:
  virtual void foo(){
    cout << "CDerived1::void foo()" << endl;
  }
};



void Test1()
{
  CDerived der;
  CBase& base = der;    //指向派生类
  //引用
  CDerived& der1 = dynamic_cast<CDerived&>(base);
  der1.foo();      //通过子类引用调用虚函数  安全
}


void Test2()
{
  //基类指针指向基类时
  CBase* pBase1 = new CBase;
  CDerived* pDer1 = dynamic_cast<CDerived*>(pBase1);

  // pDer1->foo();    //此时派生类指针调用虚函数会报错
}


void Test3()
{
  //基类指针指向派生类时
  CBase* pBase2 = new CDerived;
  CDerived* pDer2 = dynamic_cast<CDerived*>(pBase2);

  pDer2->foo();    //通过派生类指针调用虚函数    安全
}


//多重继承、菱形继承：
void Test4()
{
     // 最终派生类
     CDerived1 der;   
   
     // 向上转型，可以用 dynamic_cast，但不必须
     CBase2& base2 = dynamic_cast<CBase2&>(der);   
   
     // 向下转型
     CDerived1& der1 = dynamic_cast<CDerived1&>(base2); 
   
     // 侧向转型
     CBase1& base1 = dynamic_cast<CBase1&>(base2);      
}



void main()
{
  Test1();
  Test2();
  Test3();
  Test4();

  system("pause");
}