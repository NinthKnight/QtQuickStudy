
#include <iostream>

using namespace std;


//此时表示为const成员函数，不能修改对象中的任何成员， 在const成员函数中，
//既不能改变this所指向的对象，
// 也不能改变this所保存的地址，this的类型是一个指向const类型对象的const指针 ，this的类型是一个指向const类型对象的const指针。


class CTest
{
public:
  CTest() : m_nTest(2){}

  void foo()const{
    cout << "CTest()::void foo()" << endl;
  }

public:
  int m_nTest;
};


//常量不能给非常量赋值，非常量可以给常量赋值
void foo1()
{
  const int i = 5;
 //  int j = const_cast<int>(i);  // 不允许

  const CTest test;
  // CTest test1 = const_cast<CTest> (test);  //不允许
}


//常量指针、引用转化为非常量指针、引用
void foo2()
{
  //指针
  const int nTemp = 3;  //申明一个const常量

 //此时赋值，nTemp的值将会被修改，nTemp == 4
  int* ptr = const_cast<int*> (&nTemp);
  *ptr = 4;
  cout << nTemp << '\n';


  //引用
  int n = 3;
  const int& nRef = n;           //const引用
  int& nRef1 = const_cast<int&>(nRef);
  nRef1 = 5;                     //此时 n 的值修改为5
}


//常量对象指针、引用转为非常量对象指针、引用
void foo3()
{
  //对象指针
  const CTest* pTest = new CTest;
  CTest* pTest1 = const_cast<CTest*>(pTest);
  pTest1->m_nTest = 200;  
   
  //转换后指针指向原来的对象
  cout << pTest->m_nTest << '\n';  // 200
  cout << pTest1->m_nTest << '\n'; // 200   
}



void main()
{
  foo2();
  foo3();

  system("pause");
}