
fn  fib(n: i64)->i64 {
    if n <= 1 {
        return n;
    } else {
        return fib(n-1) + fib(n-2);
    }
}

fn main () {
    println!("result: {}",fib (40));
}