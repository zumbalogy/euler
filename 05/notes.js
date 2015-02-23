// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

function gcd(a, b) {
  if (b == 0) {
    return a
  }
  return gcd(b, a % b)
}

function gcd2(a, b) {
  while (b != 0) {
    save = b
    b = a % b
    a = save
  }
  return a
}

function gcd3(a, b) {
  while (a != b) {
    a > b ? a -= b : b -= a
  }
  return a
}

function lcm(a, b) {
  return (a * b) / gcd(a, b)
}

for (var x = 0; x < 50000; x++) {
  var total = 20;
  for (var i = 11; i < 20; i++) {
    total = lcm(total, i)
  }
}

console.log(total)
// 232792560
