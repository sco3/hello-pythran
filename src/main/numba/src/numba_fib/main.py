#!/usr/bin/env -S time -f %e uv run python

import fib

print (fib.__file__)
print("result: ",fib.fib(40))