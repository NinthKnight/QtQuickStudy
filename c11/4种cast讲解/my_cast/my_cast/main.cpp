
#include <iostream>

using namespace std;


//��ʱ��ʾΪconst��Ա�����������޸Ķ����е��κγ�Ա�� ��const��Ա�����У�
//�Ȳ��ܸı�this��ָ��Ķ���
// Ҳ���ܸı�this������ĵ�ַ��this��������һ��ָ��const���Ͷ����constָ�� ��this��������һ��ָ��const���Ͷ����constָ�롣


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


//�������ܸ��ǳ�����ֵ���ǳ������Ը�������ֵ
void foo1()
{
  const int i = 5;
 //  int j = const_cast<int>(i);  // ������

  const CTest test;
  // CTest test1 = const_cast<CTest> (test);  //������
}


//����ָ�롢����ת��Ϊ�ǳ���ָ�롢����
void foo2()
{
  //ָ��
  const int nTemp = 3;  //����һ��const����

 //��ʱ��ֵ��nTemp��ֵ���ᱻ�޸ģ�nTemp == 4
  int* ptr = const_cast<int*> (&nTemp);
  *ptr = 4;
  cout << nTemp << '\n';


  //����
  int n = 3;
  const int& nRef = n;           //const����
  int& nRef1 = const_cast<int&>(nRef);
  nRef1 = 5;                     //��ʱ n ��ֵ�޸�Ϊ5
}


//��������ָ�롢����תΪ�ǳ�������ָ�롢����
void foo3()
{
  //����ָ��
  const CTest* pTest = new CTest;
  CTest* pTest1 = const_cast<CTest*>(pTest);
  pTest1->m_nTest = 200;  
   
  //ת����ָ��ָ��ԭ���Ķ���
  cout << pTest->m_nTest << '\n';  // 200
  cout << pTest1->m_nTest << '\n'; // 200   
}



void main()
{
  foo2();
  foo3();

  system("pause");
}