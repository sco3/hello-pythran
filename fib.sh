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

	echo "D:"
	dmd -O -of=fib-d fib.d
	echo ""
	time ./fib-d

	echo "Rust:"
	rustc -C opt-level=3 -o fib-rs fib.rs
	echo ""
	time ./fib-rs

	echo "V:"
	v -prod -o fib-v fib.v
	echo ""
	time ./fib-v

	echo "Go:"
	go build -o fib-go fib.go
	echo ""
	time ./fib-go
}

./cpu-governor.sh
cat /proc/cpuinfo | grep 'model name' | sort -u | awk '{ $1=""; $2="";$3="" ;print }'  > readme.md
echo "===" >> readme.md
echo Pythran example >>readme.md
echo '===' >>readme.md
echo '' >>readme.md
echo '```' >>readme.md
fib 2>&1 | awk '$2 != "on"' | awk '$2 != "off"' | tee -a readme.md
echo '```' >>readme.md
