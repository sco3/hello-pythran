//usr/bin/go run $0 $@ ; exit

package main

import (
	"fmt"
)

func fib(n int) int {
	if n <= 1 {
		return n
	} else {
		return fib(n-1) + fib(n-2)
	}
}

func main() {
	fmt.Printf("result: %d\n", fib(40))
}
