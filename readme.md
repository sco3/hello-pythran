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

real	0m21.442s
user	0m21.382s
sys	0m0.004s
+ pythran -w src/main/py/fib.py -o src/main/py/fib.so
+ echo Pythran:
Pythran:
+ src/main/py/main.py
/home/dz/prj/hello-pythran/src/main/py/fib.so
result:  102334155

real	0m6.648s
user	0m6.932s
sys	0m0.017s
+ echo C:
C:
+ gcc -O3 -o target/fib-c src/main/c/fib.c
+ target/fib-c
result: 102334155

real	0m0.295s
user	0m0.293s
sys	0m0.001s
+ echo 'Python+C (ctypes):'
Python+C (ctypes):
+ gcc -shared -O3 -fPIC -o target/fib.so src/main/c/fib.c
+ src/main/py/main-ctypes.py
result:  102334155

real	0m0.351s
user	0m0.338s
sys	0m0.009s
+ echo D:
D:
+ dmd -O -of=target/fib-d src/main/d/fib.d
+ target/fib-d
result: 102334155

real	0m0.946s
user	0m0.943s
sys	0m0.000s
+ echo Rust:
Rust:
+ rustc -C opt-level=3 -o target/fib-rs src/main/rust/fib.rs
+ target/fib-rs
result: 102334155

real	0m0.411s
user	0m0.409s
sys	0m0.001s
+ echo V:
V:
+ v -prod -o target/fib-v src/main/v/fib.v
+ target/fib-v
result: 102334155

real	0m0.306s
user	0m0.304s
sys	0m0.001s
+ echo Go:
Go:
+ go build -o target/fib-go src/main/go/fib.go
+ target/fib-go
result: 102334155

real	0m0.664s
user	0m0.660s
sys	0m0.003s
+ echo 'Mojo: run'
Mojo: run
+ src/main/mojo/fib.mojo
result:  102334155

real	0m0.485s
user	0m0.504s
sys	0m0.029s
+ echo 'Mojo: build'
Mojo: build
+ mojo build -o target/fib-mojo src/main/mojo/fib.mojo
+ target/fib-mojo
result:  102334155

real	0m0.347s
user	0m0.341s
sys	0m0.005s
```
