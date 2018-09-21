// static_cast的使用： 用隐式和用户定义转换的组合在类型间转换

#include <iostream>
#include <vector>

using namespace std;

class CFather
{
public:
  CFather(){
    m_nTest = 3;
  }

  virtual void foo(){
    cout << "CFather()::void foo()" << endl;
  }

  int m_nTest;
};

class CSon : public CFather
{
  virtual void foo(){
    cout << "CSon::void foo()" << endl;
  }
};


void main()
{
  CSon son;
  CFather father;

  //子类指针或引用转父类指针或引用——》安全
  CFather* pFather = static_cast<CFather*>(&son);
  CFather& pFather2 = static_cast<CFather&>(son);


  //父类指针或引用转子类指针或引用———》不安全
  //CSon* pSon = static_cast<CSon*>(&father);
 // CSon& pSon2 = static_cast<CSon&>(father);


  // void* 到任何类型的强转
  //这里可以是对象、基本数据类型等，都可以
  int n = 3;
  void* ptr = &n;
  int* nPtr = static_cast<int*>(ptr);


  //基本数据类型的初始化转换(int 转float、char等) ---> 隐式转换
  int nTemp = static_cast<int>(3.1415f);
  cout << nTemp << endl;

  int nTemp1 = static_cast<int>('A');
  cout << nTemp1 << endl;


  system("pause");
}