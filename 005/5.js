// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

function gcd(a, b) {
  while (b != 0) {
    save = b
    b = a % b
    a = save
  }
  return a
}

function lcm(a, b) {
  return (a * b) / gcd(a, b)
}

function range(a, b) {
  var out = []
  for (a; a <= b; a++) {
    out.push(a)
  }
  return out
}

console.log(range(11, 20).reduce(lcm))
// 232792560
