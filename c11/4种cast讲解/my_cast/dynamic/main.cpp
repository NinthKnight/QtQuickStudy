/* 
  dynamic_cast�÷���

  2.1	ֻ����������֮��ת��ʱ��ʹ��dynamic_cast��type-id��������ָ�룬�����û���void*

  2.2	�������Ҫ���麯������Ϊdynamic_cast������ʱ���ͼ�飬��Ҫ����ʱ������Ϣ��
     �������Ϣ�Ǵ洢������麯�����У�ֻ��һ���ඨ�����麯�����Ż����麯����
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


//���μ̳�
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
  CBase& base = der;    //ָ��������
  //����
  CDerived& der1 = dynamic_cast<CDerived&>(base);
  der1.foo();      //ͨ���������õ����麯��  ��ȫ
}


void Test2()
{
  //����ָ��ָ�����ʱ
  CBase* pBase1 = new CBase;
  CDerived* pDer1 = dynamic_cast<CDerived*>(pBase1);

  // pDer1->foo();    //��ʱ������ָ������麯���ᱨ��
}


void Test3()
{
  //����ָ��ָ��������ʱ
  CBase* pBase2 = new CDerived;
  CDerived* pDer2 = dynamic_cast<CDerived*>(pBase2);

  pDer2->foo();    //ͨ��������ָ������麯��    ��ȫ
}


//���ؼ̳С����μ̳У�
void Test4()
{
     // ����������
     CDerived1 der;   
   
     // ����ת�ͣ������� dynamic_cast����������
     CBase2& base2 = dynamic_cast<CBase2&>(der);   
   
     // ����ת��
     CDerived1& der1 = dynamic_cast<CDerived1&>(base2); 
   
     // ����ת��
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