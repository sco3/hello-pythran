#!/usr/bin/env -S python3

import os
import cffi

dir = os.getcwd()
os.chdir(os.path.dirname(__file__))

ffi = cffi.FFI()
with open(f"{dir}/src/main/c/fib.h") as h:
    ffi.cdef(h.read())

ffi.set_source(
    "fibc",
    f'#include "{dir}/src/main/c/fib.h"',
    libraries=["fib"],
    library_dirs=[f"{dir}/target"],
    extra_link_args=[f"-Wl,-rpath,{dir}/target "],
)

ffi.compile(target="fibc.so")
