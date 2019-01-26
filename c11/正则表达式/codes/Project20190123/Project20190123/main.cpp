#include <iostream>
#include <regex>

using namespace std;

void search()
{

  //第一种搜索方式（只搜索一次）
  /*regex_search(str, sm, rgx);

  for (auto i : sm)
  {
      cout << i;
  }*/

  string str = "hello, what9 are you2 doing? i'm creazy1 ,hao2 do you do";
  regex rgx(R"(\b\w+\d\b)");

  smatch sm;

  //第二种搜索方式（遍历）
  //str.cbegin()获得字符串的首位置
  //str.cend()获得字符串的尾位置
  //以上都是迭代器
  //regex_search(字符串首迭代器， 字符串尾迭代器， 结果集对象， 正则表达式)

  //当regex_search返回为真的时候，smatch对象中保存了结果的string以
  //及它前/后的字符串，分别对应的获取函数为prefix()和suffix()
  //first相当于cbegin()
  
  for (auto it = str.cbegin(); regex_search(it, str.cend(), sm, rgx); it = sm.suffix().first) {
      cout << sm.str() << endl;
  }

}

void replace()
{
  string str = "hello, what9 are you2 doing? i'm creazy1 ,hao2 do you do";

  //$1 $2 $n 表示第几组
  //详细的内容请看文档
  //https://zh.cppreference.com/w/cpp/regex/regex_replace

  //$& 表示的是整个表达式
}




int main()
{
  search();


  //replace();
  //getchar();
  return 0;
}