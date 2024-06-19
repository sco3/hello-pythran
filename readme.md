Pythran example
===

```
+ rm -f fib.so
+ echo ''

+ ./main.py
/home/dz/prj/hello-pythran/fib.py
result:  102334155

real	0m6.997s
user	0m6.983s
sys	0m0.003s
+ pythran -w fib.py -o fib.so
+ echo ''

+ ./main.py
/home/dz/prj/hello-pythran/fib.so
result:  102334155

real	0m2.542s
user	0m2.526s
sys	0m0.014s
+ echo C:
C:
+ gcc -O3 -o fib-c fib.c
+ echo ''

+ ./fib-c
result: 102334155
real	0m0.116s
user	0m0.115s
sys	0m0.001s
+ echo Rust:
Rust:
+ rustc -C opt-level=3 -o fib-rs fib.rs
+ echo ''

+ ./fib-rs
Time: 102334155 ms

real	0m0.173s
user	0m0.172s
sys	0m0.001s
```
