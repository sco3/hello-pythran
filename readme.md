Pythran example
===

```
+ rm -f fib.so
+ echo ''

+ ./main.py
/home/dz/prj/hello-pythran/fib.py
result:  102334155

real	0m6.852s
user	0m6.838s
sys	0m0.005s
+ pythran -w fib.py -o fib.so
+ echo ''

+ ./main.py
/home/dz/prj/hello-pythran/fib.so
result:  102334155

real	0m2.718s
user	0m2.700s
sys	0m0.013s
+ echo C:
C:
+ gcc -O3 -o fib-c fib.c
+ echo ''

+ ./fib-c
result: 102334155

real	0m0.110s
user	0m0.110s
sys	0m0.000s
+ echo Rust:
Rust:
+ rustc -C opt-level=3 -o fib-rs fib.rs
+ echo ''

+ ./fib-rs
result: 102334155

real	0m0.173s
user	0m0.171s
sys	0m0.001s
+ echo V:
V:
+ v -prod -o fib-v fib.v
+ echo ''

+ ./fib-v
result: 102334155

real	0m0.109s
user	0m0.108s
sys	0m0.001s
```
