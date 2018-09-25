#include <functional>
#include <iostream>
using namespace std;

std::function<int(int)> Functional;

// ��ͨ����
int TestFunc(int a)
{
	return a;
}

// Lambda���ʽ
auto lambda = [](int a)->int { return a; };

// �º���(functor)����������
class Functor
{
public:
	int operator()(int a)
	{
		return a;
	}
};

// 1.���Ա����
// 2.�ྲ̬����
class TestClass
{
public:
	int ClassMember(int a) { return a; }
	static int StaticMember(int a) { return a; }
};

int main()
{
	// ��ͨ����
	Functional = TestFunc;
	int result = Functional(10);
	cout << "��ͨ������" << result << endl;

	// Lambda���ʽ
	Functional = lambda;
	result = Functional(20);
	cout << "Lambda���ʽ��" << result << endl;

	// �º���
	Functor testFunctor;
	Functional = testFunctor;
	result = Functional(30);
	cout << "�º�����" << result << endl;

	// ���Ա����
	TestClass testObj;
	// ��ν�Ķ��������
	// ���ǳ�Ա����Ĭ�ϵĵ�һ��������
	// Ҳ����ָ����ó�Ա�����Ķ����thisָ��
	Functional = std::bind(&TestClass::ClassMember, &testObj, std::placeholders::_1);
	result = Functional(40);
	cout << "���Ա������" << result << endl;

	// �ྲ̬����
	Functional = TestClass::StaticMember;
	result = Functional(50);
	cout << "�ྲ̬������" << result << endl;

	return 0;
}
