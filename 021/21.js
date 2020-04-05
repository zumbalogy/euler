// Let d(n) equal the sum of divisors of n.

// If d(a) = b and d(b) = a and a ≠ b, then a and b are called amicable numbers.

// For example, the divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
// so d(220) = 284. The divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

// Sum the amicable numbers under 10000.

//////////////// d(a) = b and d(b) = a and a ≠ b
//////////////// d(d(a)) = a

const sum_div = (input) => {
  let out = 1
  for (let i = 2; i < Math.sqrt(input); i++) {
    if (input % i == 0) {
      out += i
      out += input / i
    }
  }
  return out
}

let total = 2

for (let i = 0; i < 10000; i++) {
  let first = sum_div(i)
  if (first != i && sum_div(first) == i) {
    total += i
  }
}

console.log(total)
// 31626
