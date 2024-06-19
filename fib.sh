#!/usr/bin/env -S bash

function fib {
	set -xueo

	rm -f fib.so
	echo ""
	time ./main.py

	pythran -w fib.py -o fib.so >/dev/null 2>&1

	echo ""
	time ./main.py
	
	echo "C:"
	gcc -O3 -o fib-c fib.c
	echo ""
	time ./fib-c

	echo "Rust:"
	rustc -C opt-level=3 -o fib-rs fib.rs
	echo ""
	time ./fib-rs

	echo "V:"
	v -prod -o fib-v fib.v
	echo ""
	time ./fib-v
}

./cpu-governor.sh

echo Pythran example >readme.md
echo '===' >>readme.md
echo '' >>readme.md
echo '```' >>readme.md
fib 2>&1 | awk '$2 != "on"' | awk '$2 != "off"' | tee -a readme.md
echo '```' >>readme.md
