#include <iostream>
#include <regex>

using namespace std;

void search()
{

  //��һ��������ʽ��ֻ����һ�Σ�
  /*regex_search(str, sm, rgx);

  for (auto i : sm)
  {
      cout << i;
  }*/

  string str = "hello, what9 are you2 doing? i'm creazy1 ,hao2 do you do";
  regex rgx(R"(\b\w+\d\b)");

  smatch sm;

  //�ڶ���������ʽ��������
  //str.cbegin()����ַ�������λ��
  //str.cend()����ַ�����βλ��
  //���϶��ǵ�����
  //regex_search(�ַ����׵������� �ַ���β�������� ��������� ������ʽ)

  //��regex_search����Ϊ���ʱ��smatch�����б����˽����string��
  //����ǰ/����ַ������ֱ��Ӧ�Ļ�ȡ����Ϊprefix()��suffix()
  //first�൱��cbegin()
  
  for (auto it = str.cbegin(); regex_search(it, str.cend(), sm, rgx); it = sm.suffix().first) {
      cout << sm.str() << endl;
  }

}

void replace()
{
  string str = "hello, what9 are you2 doing? i'm creazy1 ,hao2 do you do";

  //$1 $2 $n ��ʾ�ڼ���
  //��ϸ�������뿴�ĵ�
  //https://zh.cppreference.com/w/cpp/regex/regex_replace

  //$& ��ʾ�����������ʽ
}




int main()
{
  search();


  //replace();
  //getchar();
  return 0;
}