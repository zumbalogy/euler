// The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
// The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.

fn sum_under(x: u32) -> u32 {
    ((x * x) + x) / 2
}

fn sum_steps(step: u32, limit: u32) -> u32 {
    step * sum_under((limit - 1) / step)
}

fn main() {
    let a = sum_steps(3, 1000);
    let b = sum_steps(5, 1000);
    let c = sum_steps(15, 1000);
    println!("{}", a + b - c)
}
// 233168
