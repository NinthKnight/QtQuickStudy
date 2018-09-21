// static_cast��ʹ�ã� ����ʽ���û�����ת������������ͼ�ת��

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

  //����ָ�������ת����ָ������á�������ȫ
  CFather* pFather = static_cast<CFather*>(&son);
  CFather& pFather2 = static_cast<CFather&>(son);


  //����ָ�������ת����ָ������á�����������ȫ
  //CSon* pSon = static_cast<CSon*>(&father);
 // CSon& pSon2 = static_cast<CSon&>(father);


  // void* ���κ����͵�ǿת
  //��������Ƕ��󡢻����������͵ȣ�������
  int n = 3;
  void* ptr = &n;
  int* nPtr = static_cast<int*>(ptr);


  //�����������͵ĳ�ʼ��ת��(int תfloat��char��) ---> ��ʽת��
  int nTemp = static_cast<int>(3.1415f);
  cout << nTemp << endl;

  int nTemp1 = static_cast<int>('A');
  cout << nTemp1 << endl;


  system("pause");
}