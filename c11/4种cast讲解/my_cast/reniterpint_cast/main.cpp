
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
 
 // 指针转换到整数
  int nTemp1 = reinterpret_cast<int>(&nTemp);
  cout << hex << nTemp1 << '\n';

 //整数转换回指针
  int* p1 = reinterpret_cast<int*>(nTemp1);
  cout << *p1 << '\n';

  //将整型转为指针
  unsigned int nTemp2 = 0x00500000;
  int* pTemp = reinterpret_cast<int*>(nTemp2);

  //将一个函数转为一个函数指针并转回
  void(*fp1)() = reinterpret_cast<void(*)()>(foo);
  int(*fp2)() = reinterpret_cast<int(*)()>(fp1);

  cout << dec << fp2() << '\n'; // 安全的转换

  system("pause");
}