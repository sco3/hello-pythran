Pythran example
===
   Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz
---

```
+ echo Python:
Python:
+ src/main/py/main.py
/home/dz/prj/hello-pythran/src/main/py/fib.py
result:  102334155

real	0m21.067s
user	0m21.010s
sys	0m0.009s
+ pythran -w src/main/py/fib.py -o src/main/py/fib.so
+ echo Pythran:
Pythran:
+ src/main/py/main.py
/home/dz/prj/hello-pythran/src/main/py/fib.so
result:  102334155

real	0m6.684s
user	0m6.968s
sys	0m0.016s
+ echo C:
C:
+ gcc -O3 -o target/fib-c src/main/c/fib.c
+ target/fib-c
result: 102334155

real	0m0.290s
user	0m0.288s
sys	0m0.001s
+ echo 'Python+C (ctypes):'
Python+C (ctypes):
+ gcc -shared -O3 -fPIC -o target/fib.so src/main/c/fib.c
+ src/main/py/main_ctypes.py
result:  102334155

real	0m0.315s
user	0m0.310s
sys	0m0.004s
+ echo 'Python+C (cffi):'
Python+C (cffi):
+ gcc -O3 -fPIC src/main/c/fib.c -c -o target/fib.o
+ ar rsc target/libfib.a target/fib.o
+ src/main/py/fibc_build.py
+ src/main/py/fibc_main.py
result:  102334155

real	0m0.311s
user	0m0.304s
sys	0m0.006s
+ echo D:
D:
+ dmd -O -of=target/fib-d src/main/d/fib.d
+ target/fib-d
result: 102334155

real	0m0.937s
user	0m0.933s
sys	0m0.001s
+ echo Rust:
Rust:
+ rustc -C opt-level=3 -o target/fib-rs src/main/rust/fib.rs
+ target/fib-rs
result: 102334155

real	0m0.405s
user	0m0.402s
sys	0m0.002s
+ echo V:
V:
+ v -prod -o target/fib-v src/main/v/fib.v
+ target/fib-v
result: 102334155

real	0m0.304s
user	0m0.302s
sys	0m0.000s
+ echo Go:
Go:
+ go build -o target/fib-go src/main/go/fib.go
+ target/fib-go
result: 102334155

real	0m0.645s
user	0m0.642s
sys	0m0.003s
+ echo 'Mojo: run'
Mojo: run
+ src/main/mojo/fib.mojo
result:  102334155

real	0m0.526s
user	0m0.568s
sys	0m0.036s
+ echo 'Mojo: build'
Mojo: build
+ mojo build -o target/fib-mojo src/main/mojo/fib.mojo
+ target/fib-mojo
result:  102334155

real	0m0.341s
user	0m0.334s
sys	0m0.005s
```
