#!/usr/bin/env -S python3


import ctypes
clib=ctypes.CDLL('./libmatcher.so')
clib.match_one.argtypes=[ctypes.c_char_p, ctypes.c_char_p]
clib.match_one.restupes=ctypes.c_int
print("result: ",clib.match_one(b"aa", b"*aa*"))