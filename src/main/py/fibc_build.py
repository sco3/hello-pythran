#!/usr/bin/env -S python3

import os
import cffi

os.chdir(os.path.dirname(__file__))

ffi = cffi.FFI()
with open("../../main/c/fib.h") as h:
    ffi.cdef(h.read())
    
ffi.set_source(
    "fibc",
    '#include "../../main/c/fib.h"',
    libraries=["fib"],
    library_dirs=["../../../target"],
    extra_link_args=["-Wl,-rpath,../../../target "],
)

ffi.compile(target="fibc.so")

