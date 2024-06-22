Pythran example
===
   Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz
 

```
+ echo Python:
Python:
+ src/main/py/main.py
/home/dz/prj/hello-pythran/src/main/py/fib.py
result:  102334155

real	0m21.213s
user	0m21.144s
sys	0m0.010s
+ pythran -w src/main/py/fib.py -o src/main/py/fib.so
+ echo Pythran:
Pythran:
+ src/main/py/main.py
/home/dz/prj/hello-pythran/src/main/py/fib.so
result:  102334155

real	0m6.971s
user	0m7.252s
sys	0m0.014s
+ echo C:
C:
+ gcc -O3 -o target/fib-c src/main/c/fib.c
+ target/fib-c
result: 102334155

real	0m0.296s
user	0m0.294s
sys	0m0.000s
+ echo 'Python+C (ctypes):'
Python+C (ctypes):
+ gcc -shared -O3 -fPIC -o target/fib.so src/main/c/fib.c
+ src/main/py/main_ctypes.py
result:  102334155

real	0m0.323s
user	0m0.315s
sys	0m0.006s
+ echo 'Python+C (cffi):'
Python+C (cffi):
+ gcc -O3 -fPIC src/main/c/fib.c -c -o target/fib.o
+ ar rsc target/libfib.a target/fib.o
+ src/main/py/fibc_build.py
+ src/main/py/fibc_main.py
result:  102334155

real	0m0.314s
user	0m0.305s
sys	0m0.007s
+ echo D:
D:
+ dmd -O -of=target/fib-d src/main/d/fib.d
+ target/fib-d
result: 102334155

real	0m0.945s
user	0m0.942s
sys	0m0.000s
+ echo Rust:
Rust:
+ rustc -C opt-level=3 -o target/fib-rs src/main/rust/fib.rs
+ target/fib-rs
result: 102334155

real	0m0.413s
user	0m0.410s
sys	0m0.001s
+ echo V:
V:
+ v -prod -o target/fib-v src/main/v/fib.v
+ target/fib-v
result: 102334155

real	0m0.297s
user	0m0.295s
sys	0m0.000s
+ echo Go:
Go:
+ go build -o target/fib-go src/main/go/fib.go
+ target/fib-go
result: 102334155

real	0m0.674s
user	0m0.671s
sys	0m0.001s
+ echo 'Mojo: run'
Mojo: run
+ src/main/mojo/fib.mojo
result:  102334155

real	0m0.497s
user	0m0.514s
sys	0m0.043s
+ echo 'Mojo: build'
Mojo: build
+ mojo build -o target/fib-mojo src/main/mojo/fib.mojo
+ target/fib-mojo
result:  102334155

real	0m0.422s
user	0m0.394s
sys	0m0.009s
```
