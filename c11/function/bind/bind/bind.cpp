#include <iostream>
#include <functional>

// 按照顺序输出x, y, x
void print_func(int x, int y, int z)
{
	std::cout << x << " " << y << " " << z << std::endl;
}
std::function<void(int, int, int)> Func;

int main()
{
	Func = std::bind(&print_func, 1, 2, 3);
	Func(4, 5, 6); // 输出： 1 2 3

	Func = std::bind(&print_func, std::placeholders::_2, std::placeholders::_1, 3);
	Func(1, 2, 7); // 输出： 2 1 3

	int n = 10;
	Func = std::bind(&print_func, std::placeholders::_1, std::placeholders::_1, n);
	Func(5, 6, 7); // 输出： 5 5 10

	getchar();
	return 0;
}