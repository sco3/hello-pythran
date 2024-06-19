Pythran example
===

```
+ rm -f fib.so
+ echo ''

+ ./main.py
/home/dz/prj/hello-pythran/fib.py
result:  102334155

real	0m7.008s
user	0m7.000s
sys	0m0.002s
+ pythran -w fib.py -o fib.so
+ echo ''

+ ./main.py
/home/dz/prj/hello-pythran/fib.so
result:  102334155

real	0m2.559s
user	0m2.546s
sys	0m0.011s
+ echo C:
C:
+ gcc -O3 -o fib-c fib.c
+ echo ''

+ ./fib-c
result: 102334155

real	0m0.111s
user	0m0.110s
sys	0m0.000s
+ echo Rust:
Rust:
+ rustc -C opt-level=3 -o fib-rs fib.rs
+ echo ''

+ ./fib-rs
result: 102334155

real	0m0.171s
user	0m0.170s
sys	0m0.001s
+ echo V:
V:
+ v -prod -o fib-v fib.v
+ echo ''

+ ./fib-v
result: 102334155

real	0m0.108s
user	0m0.107s
sys	0m0.000s
+ echo Go:
Go:
+ go build -o fib-go fib.go
+ echo ''

+ ./fib-go
result: 102334155

real	0m0.331s
user	0m0.330s
sys	0m0.001s
```
