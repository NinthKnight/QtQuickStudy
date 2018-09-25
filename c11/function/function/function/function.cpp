#include <functional>
#include <iostream>
using namespace std;

std::function<int(int)> Functional;

// 普通函数
int TestFunc(int a)
{
	return a;
}

// Lambda表达式
auto lambda = [](int a)->int { return a; };

// 仿函数(functor)（函数对象）
class Functor
{
public:
	int operator()(int a)
	{
		return a;
	}
};

// 1.类成员函数
// 2.类静态函数
class TestClass
{
public:
	int ClassMember(int a) { return a; }
	static int StaticMember(int a) { return a; }
};

int main()
{
	// 普通函数
	Functional = TestFunc;
	int result = Functional(10);
	cout << "普通函数：" << result << endl;

	// Lambda表达式
	Functional = lambda;
	result = Functional(20);
	cout << "Lambda表达式：" << result << endl;

	// 仿函数
	Functor testFunctor;
	Functional = testFunctor;
	result = Functional(30);
	cout << "仿函数：" << result << endl;

	// 类成员函数
	TestClass testObj;
	// 所谓的额外参数，
	// 就是成员函数默认的第一个参数，
	// 也就是指向调用成员函数的对象的this指针
	Functional = std::bind(&TestClass::ClassMember, &testObj, std::placeholders::_1);
	result = Functional(40);
	cout << "类成员函数：" << result << endl;

	// 类静态函数
	Functional = TestClass::StaticMember;
	result = Functional(50);
	cout << "类静态函数：" << result << endl;

	return 0;
}
