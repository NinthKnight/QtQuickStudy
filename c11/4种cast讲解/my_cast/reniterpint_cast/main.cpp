
#include <iostream>
#include <vector>
#include <stdlib.h>

using namespace std;

int foo()
{ 
  return 10; 
}

void main()
{
 
 // ָ��ת��������
  int nTemp1 = reinterpret_cast<int>(&nTemp);
  cout << hex << nTemp1 << '\n';

 //����ת����ָ��
  int* p1 = reinterpret_cast<int*>(nTemp1);
  cout << *p1 << '\n';

  //������תΪָ��
  unsigned int nTemp2 = 0x00500000;
  int* pTemp = reinterpret_cast<int*>(nTemp2);

  //��һ������תΪһ������ָ�벢ת��
  void(*fp1)() = reinterpret_cast<void(*)()>(foo);
  int(*fp2)() = reinterpret_cast<int(*)()>(fp1);

  cout << dec << fp2() << '\n'; // ��ȫ��ת��

  system("pause");
}