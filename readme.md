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

real	0m20.996s
user	0m20.942s
sys	0m0.010s
+ pythran -w src/main/py/fib.py -o src/main/py/fib.so
+ echo Pythran:
Pythran:
+ src/main/py/main.py
/home/dz/prj/hello-pythran/src/main/py/fib.so
result:  102334155

real	0m6.754s
user	0m7.040s
sys	0m0.015s
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
+ src/main/py/main-ctypes.py
result:  102334155

real	0m0.322s
user	0m0.317s
sys	0m0.004s
+ echo D:
D:
+ dmd -O -of=target/fib-d src/main/d/fib.d
+ target/fib-d
result: 102334155

real	0m0.934s
user	0m0.930s
sys	0m0.002s
+ echo Rust:
Rust:
+ rustc -C opt-level=3 -o target/fib-rs src/main/rust/fib.rs
+ target/fib-rs
result: 102334155

real	0m0.423s
user	0m0.420s
sys	0m0.001s
+ echo V:
V:
+ v -prod -o target/fib-v src/main/v/fib.v
+ target/fib-v
result: 102334155

real	0m0.297s
user	0m0.296s
sys	0m0.000s
+ echo Go:
Go:
+ go build -o target/fib-go src/main/go/fib.go
+ target/fib-go
result: 102334155

real	0m0.647s
user	0m0.645s
sys	0m0.001s
+ echo 'Mojo: run'
Mojo: run
+ src/main/mojo/fib.mojo
result:  102334155

real	0m0.480s
user	0m0.499s
sys	0m0.039s
+ echo 'Mojo: build'
Mojo: build
+ mojo build -o target/fib-mojo src/main/mojo/fib.mojo
+ target/fib-mojo
result:  102334155

real	0m0.343s
user	0m0.336s
sys	0m0.005s
```
