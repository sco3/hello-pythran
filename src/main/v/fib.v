



pub fn  fib(n int ) int {
    if n <= 1 {
        return n
    } else {
        return fib(n-1) + fib(n-2)
    }
}

fn main () {
    println("result: ${fib (40)}");
}
