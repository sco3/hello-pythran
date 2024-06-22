#!/usr/bin/env -S bash


function fib() {

	set -xueo pipefail

	echo "Python:"
	time src/main/py/main.py

	pythran -w src/main/py/fib.py -o src/main/py/fib.so >/dev/null 2>&1

	echo "Pythran:"
	time src/main/py/main.py

	echo "C:"
	gcc -O3 -o target/fib-c src/main/c/fib.c
	time target/fib-c
	
	echo "Python+C (ctypes):"
	gcc -shared -O3 -fPIC -o target/fib.so src/main/c/fib.c
	time  src/main/py/main-ctypes.py

	echo "D:"
	dmd -O -of=target/fib-d src/main/d/fib.d
	time target/fib-d

	echo "Rust:"
	rustc -C opt-level=3 -o target/fib-rs src/main/rust/fib.rs
	time target/fib-rs

	echo "V:"
	v -prod -o target/fib-v src/main/v/fib.v
	time target/fib-v

	echo "Go:"
	go build -o target/fib-go src/main/go/fib.go
	time target/fib-go
	
	echo "Mojo: run"
	time src/main/mojo/fib.mojo

	echo "Mojo: build"
	mojo build -o target/fib-mojo src/main/mojo/fib.mojo
	time target/fib-mojo
}

sudo cpupower frequency-set --governor performance 2>&1 > /dev/null

rm -rf src/main/py/fib.so
rm -rf target
mkdir -p target

echo Pythran example >readme.md
echo '===' >>readme.md
cat /proc/cpuinfo | grep 'model name' | sort -u | awk '{ $1=""; $2="";$3="" ;print }' >>readme.md
echo "---" >>readme.md

echo '' >>readme.md
echo '```' >>readme.md
fib 2>&1 | awk '$2 != "on"' | awk '$2 != "off"' | grep -v libtinfo | tee -a readme.md
echo '```' >>readme.md

