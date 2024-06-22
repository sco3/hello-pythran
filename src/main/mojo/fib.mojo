#!/usr/bin/env -S mojo run 


fn fib(n:Int )->Int:
    if n <= 1:
        return n
    else:
        return fib(n-1) + fib(n-2)


fn main ():
    print("result: ",fib(40))
