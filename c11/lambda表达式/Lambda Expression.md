# Lambda Expression

-- Lecturer: Elss Zion

## Lambda Calculus

1. The inventor of Lambda Calculus

    - Alonzo Church -- Alan Turing's PhD supervisor

    - a mathematician at Princeton University

2. Two different notion of computation

    - Lambda Calculus

        + a functional notion of computation
        + no internal state, pure mathematical functions

    - Turing machines

        + stated-based model of computation
        + Youtube: Turing Machine Explained -- Computerphile

3. Church-Turing hypothesis

    - a function on the natural numbers is computale by a human being following an algorithm, ignoring resource limitaions, if and only if it is computable by a Turing machine

4. Currying -- Uncurrying

    - higher-order functions

    ```
    f(x, y)
    hx(y)
    ```

5. Syntax

    - Abstraction
        ```
        λx.x+1
        λx.λy.x+y
        ```

    - Application
        ```
        λx.x+1 5
        (λx.x+1) 5
        ```

6. What is the point of Lambda Calculus?

    - Can encode any computation
    - The Basis for functional programming language (Haskell)
    - Now in most language

    ```
    TURE = λx.λy.x
    FALSE = λx.λy.y
    NOT = λb. b FALSE TRUE

    /*
        NOT TRUE
        == (λb. b FALSE TRUE) TRUE
        == TRUE FALSE TRUE
        == FALSE
    */
    ```

    ```
    /*
        AND TRUE TURE == TRUE
        AND TRUE FALSE == FALSE
        AND FALSE TURE == FALSE
        AND FALSE FALSE == FALSE
    */

    AND = λb1.λb2. b1 b2 FALSE
    ```

    ```
    /*
        OR TRUE TURE == TRUE
        OR TRUE FALSE == TRUE
        OR FALSE TURE == TURE
        OR FALSE FALSE == FALSE
    */

    OR = λb1.λb2. b1 TRUE b2
    ```

7. Omega combinator

    ```
    Ω = (λx. x x) (λx. x x)
    ```

## C++11 Lambda Expression

1. [=] [&]

    ```
    #include<iostream>         
    using namespace std;       

    int main()                 
    {
        int j = 10;
        auto by_val_lambda = [=]{ return j + 1; };
        auto by_ref_lambda = [&]{ return j + 1; };
        cout<<"by_val_lambda: "<<by_val_lambda()<<endl; // 11
        cout<<"by_ref_lambda: "<<by_ref_lambda()<<endl; // 11

        ++j;                   
        cout<<"by_val_lambda: "<<by_val_lambda()<<endl; // 11
        cout<<"by_ref_lambda: "<<by_ref_lambda()<<endl; // 12

        return 0;              
    }
    ```

2. mutable

    ```
    #include <iostream>
    using namespace std;
    class Test
    {
    public:
        Test();
        int value() const;

    private:
        mutable int v;
    };
    Test::Test()
    {
        v = 1;
    }

    int Test::value() const
    {
        v++;
        return v;
    }
    ```

    ```
    #include<iostream>
    using namespace std;

    int main()
    {
        int val = 0;
        // auto const_val_lambda = [=](){ val = 3; }; wrong!!!

        auto mutable_val_lambda = [=]() mutable{ val = 3; };
        mutable_val_lambda();
        cout<<val<<endl; // 0

        auto const_ref_lambda = [&]() { val = 4; };
        const_ref_lambda();
        cout<<val<<endl; // 4

        auto mutable_ref_lambda = [&]() mutable{ val = 5; };
        mutable_ref_lambda();
        cout<<val<<endl; // 5

        return 0;
    }
    ```

3. as function parameter
    ```
    #include <iostream>
    #include <functional>
    using namespace std;

    void func(function<void (int)>cb)
    {
        for (size_t i = 0; i < 10; i++)
        {
            cb(i);
        }
    }

    int _tmain(int argc, _TCHAR* argv[])
    {
        func([](int i){
            if (i == 5)
            {
                return;
            }
            cout << i << endl;
        });
        return 0;
    }
    ```