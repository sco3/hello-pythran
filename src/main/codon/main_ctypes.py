#!/usr/bin/env -S python3


import ctypes
clib=ctypes.CDLL('./fib.so')
clib.fib.argtypes=[ctypes.c_int]
clib.fib.restupes=ctypes.c_int
print("result: ",clib.fib(40))