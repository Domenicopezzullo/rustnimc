fn fib(n: usize, memo: &mut [i32]) -> i32 {
    if n < 2 {
        return n as i32;
    }
    if memo[n] != -1 {
        return memo[n];
    }
    memo[n] = fib(n - 1, memo) + fib(n - 2, memo);
    memo[n]
}

fn main() {
    let n: usize = 10;
    let mut memo = vec![-1; n + 1];
    let mut acc = 0;
    for _ in 0..1_000_000 {
        acc ^= fib(n, &mut memo);
    }
    println!("{}", acc);
}
