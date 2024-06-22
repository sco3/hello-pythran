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

real	0m21.300s
user	0m21.243s
sys	0m0.004s
+ pythran -w src/main/py/fib.py -o src/main/py/fib.so
+ echo Pythran:
Pythran:
+ src/main/py/main.py
/home/dz/prj/hello-pythran/src/main/py/fib.so
result:  102334155

real	0m6.865s
user	0m7.138s
sys	0m0.017s
+ echo C:
C:
+ gcc -O3 -o target/fib-c src/main/c/fib.c
+ target/fib-c
result: 102334155

real	0m0.294s
user	0m0.291s
sys	0m0.001s
+ echo 'Python+C (ctypes):'
Python+C (ctypes):
+ gcc -shared -O3 -fPIC -o target/fib.so src/main/c/fib.c
+ src/main/py/main_ctypes.py
result:  102334155

real	0m0.317s
user	0m0.312s
sys	0m0.003s
+ echo 'Python+C (cffi):'
Python+C (cffi):
+ gcc -O3 -fPIC src/main/c/fib.c -c -o target/fib.o
+ ar rsc target/libfib.a target/fib.o
+ src/main/py/fibc_build.py
+ src/main/py/fibc_main.py
result:  102334155

real	0m0.318s
user	0m0.308s
sys	0m0.009s
+ echo D:
D:
+ dmd -O -of=target/fib-d src/main/d/fib.d
+ target/fib-d
result: 102334155

real	0m0.936s
user	0m0.932s
sys	0m0.002s
+ echo Rust:
Rust:
+ rustc -C opt-level=3 -o target/fib-rs src/main/rust/fib.rs
+ target/fib-rs
result: 102334155

real	0m0.430s
user	0m0.426s
sys	0m0.002s
+ echo V:
V:
+ v -prod -o target/fib-v src/main/v/fib.v
+ target/fib-v
result: 102334155

real	0m0.293s
user	0m0.291s
sys	0m0.001s
+ echo Go:
Go:
+ go build -o target/fib-go src/main/go/fib.go
+ target/fib-go
result: 102334155

real	0m0.658s
user	0m0.649s
sys	0m0.008s
+ echo 'Mojo: run'
Mojo: run
+ src/main/mojo/fib.mojo
result:  102334155

real	0m0.485s
user	0m0.499s
sys	0m0.040s
+ echo 'Mojo: build'
Mojo: build
+ mojo build -o target/fib-mojo src/main/mojo/fib.mojo
+ target/fib-mojo
result:  102334155

real	0m0.343s
user	0m0.337s
sys	0m0.005s
```
