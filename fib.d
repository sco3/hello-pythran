import std.stdio;

uint fibonacci(uint n) {
    if (n <= 1) {
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
        writeln("result: ", fibonacci(40));
}

