Pythran example
===
   13th Gen Intel(R) Core(TM) i7-1360P
 

```
+ echo Python:
Python:
+ src/main/py/main.py
/home/dz/prj/hello-pythran/src/main/py/fib.py
result:  102334155

real	0m7.273s
user	0m7.247s
sys	0m0.004s
+ pythran -w src/main/py/fib.py -o src/main/py/fib.so
+ echo Pythran:
Pythran:
+ src/main/py/main.py
/home/dz/prj/hello-pythran/src/main/py/fib.so
result:  102334155

real	0m2.337s
user	0m3.849s
sys	0m0.011s
+ echo C:
C:
+ gcc -O3 -o target/fib-c src/main/c/fib.c
+ target/fib-c
result: 102334155

real	0m0.120s
user	0m0.120s
sys	0m0.000s
+ echo 'Python+C (ctypes):'
Python+C (ctypes):
+ gcc -shared -O3 -fPIC -o target/fib.so src/main/c/fib.c
+ src/main/py/main_ctypes.py
result:  102334155

real	0m0.125s
user	0m0.121s
sys	0m0.003s
+ echo 'Python+C (cffi):'
Python+C (cffi):
+ gcc -O3 -fPIC src/main/c/fib.c -c -o target/fib.o
+ ar rsc target/libfib.a target/fib.o
+ src/main/py/fibc_build.py
+ src/main/py/fibc_main.py
result:  102334155

real	0m0.126s
user	0m0.123s
sys	0m0.002s
+ echo Mypyc:
Mypyc:
+ cd src/main/mypyc
+ python3 -m mypyc fib.py main.py
running build_ext
INFO: Disabling color, you really want to install colorlog.
Disabling color, you really want to install colorlog.
building '47ddae4b1954a39a8214__mypyc' extension
gcc -fno-strict-overflow -Wsign-compare -DDYNAMIC_ANNOTATIONS_ENABLED=1 -DNDEBUG -fcf-protection -fexceptions -fcf-protection -fexceptions -fcf-protection -fexceptions -fPIC -I/home/dz/.local/lib/python3.12/site-packages/mypyc/lib-rt -Ibuild -I/usr/include/python3.12 -c build/__native_47ddae4b1954a39a8214.c -o build/temp.linux-x86_64-cpython-312/build/__native_47ddae4b1954a39a8214.o -O3 -g1 -Werror -Wno-unused-function -Wno-unused-label -Wno-unreachable-code -Wno-unused-variable -Wno-unused-command-line-argument -Wno-unknown-warning-option -Wno-unused-but-set-variable -Wno-ignored-optimization-argument -Wno-cpp
gcc -shared build/temp.linux-x86_64-cpython-312/build/__native_47ddae4b1954a39a8214.o -L/usr/lib64 -o build/lib.linux-x86_64-cpython-312/47ddae4b1954a39a8214__mypyc.cpython-312-x86_64-linux-gnu.so
copying build/lib.linux-x86_64-cpython-312/47ddae4b1954a39a8214__mypyc.cpython-312-x86_64-linux-gnu.so -> 
+ python3 -c 'import main'
/home/dz/prj/hello-pythran/src/main/mypyc/fib.cpython-312-x86_64-linux-gnu.so
result:  102334155

real	0m5.320s
user	0m5.303s
sys	0m0.004s
+ cd -
/home/dz/prj/hello-pythran
+ echo D:
D:
+ dmd -O -of=target/fib-d src/main/d/fib.d
+ target/fib-d
result: 102334155

real	0m0.331s
user	0m0.330s
sys	0m0.000s
+ echo Rust:
Rust:
+ rustc -C opt-level=3 -o target/fib-rs src/main/rust/fib.rs
+ target/fib-rs
result: 102334155

real	0m0.174s
user	0m0.173s
sys	0m0.000s
+ echo V:
V:
+ v -prod -o target/fib-v src/main/v/fib.v
+ target/fib-v
result: 102334155

real	0m0.115s
user	0m0.114s
sys	0m0.000s
+ echo Go:

Go:

+ go build -o target/fib-go src/main/go/fib.go
+ target/fib-go
result: 102334155

real	0m0.333s
user	0m0.331s
sys	0m0.001s
+ echo 'Mojo: run'

Mojo: run

+ src/main/mojo/fib.mojo
result:  102334155

real	0m0.263s
user	0m0.256s
sys	0m0.026s
+ echo 'Mojo: build'

Mojo: build

+ mojo build -o target/fib-mojo src/main/mojo/fib.mojo
+ target/fib-mojo
result:  102334155

real	0m0.251s
user	0m0.247s
sys	0m0.004s
```
Numba:

```
+ time uv run main.py 
warning: `uv run` is experimental and may change without warning
... src/main/numba/src/numba_fib/fib.py
result:  102334155

real	0m1.889s
user	0m2.081s
sys	0m0.105s
```