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

function lcmUpTo(limit) {
  var total = limit
  for (var i = (limit / 2) + 1; i < limit; i++) {
    total = lcm(total, i)
  }
  return total
}

console.log(lcmUpTo(20))
// 232792560
