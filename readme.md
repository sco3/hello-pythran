   Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz
===
Pythran example
===

```
+ rm -f fib.so
+ echo ''

+ ./main.py
/home/dz/prj/hello-pythran/fib.py
result:  102334155

real	0m20.161s
user	0m20.114s
sys	0m0.005s
+ pythran -w fib.py -o fib.so
+ echo ''

+ ./main.py
/home/dz/prj/hello-pythran/fib.so
result:  102334155

real	0m6.777s
user	0m7.057s
sys	0m0.018s
+ echo C:
C:
+ gcc -O3 -o fib-c fib.c
+ echo ''

+ ./fib-c
result: 102334155

real	0m0.292s
user	0m0.290s
sys	0m0.001s
+ echo D:
D:
+ dmd -O -of=fib-d fib.d
+ echo ''

+ ./fib-d
result: 102334155

real	0m0.940s
user	0m0.935s
sys	0m0.001s
+ echo Rust:
Rust:
+ rustc -C opt-level=3 -o fib-rs fib.rs
+ echo ''

+ ./fib-rs
result: 102334155

real	0m0.416s
user	0m0.415s
sys	0m0.000s
+ echo V:
V:
+ v -prod -o fib-v fib.v
+ echo ''

+ ./fib-v
result: 102334155

real	0m0.299s
user	0m0.297s
sys	0m0.001s
+ echo Go:
Go:
+ go build -o fib-go fib.go
+ echo ''

+ ./fib-go
result: 102334155

real	0m0.646s
user	0m0.644s
sys	0m0.001s
```
