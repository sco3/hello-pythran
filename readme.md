Pythran example
===

```
+ rm -f fib.so
+ echo ''

+ ./main.py
/home/dz/prj/hello-pythran/fib.py
result:  102334155

real	0m7.360s
user	0m7.342s
sys	0m0.003s
+ pythran -w fib.py -o fib.so
+ echo ''

+ ./main.py
/home/dz/prj/hello-pythran/fib.so
result:  102334155

real	0m2.613s
user	0m2.592s
sys	0m0.015s
+ echo C:
C:
+ gcc -O3 -o fib-c fib.c
+ echo ''

+ ./fib-c
result: 102334155

real	0m0.115s
user	0m0.115s
sys	0m0.000s
+ echo Rust:
Rust:
+ rustc -C opt-level=3 -o fib-rs fib.rs
+ echo ''

+ ./fib-rs
result: 102334155

real	0m0.171s
user	0m0.169s
sys	0m0.001s
```
