// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

// Find the sum of all the primes below two million.

function prime(input) {
  for (var i = 3; i <= Math.sqrt(input); i += 2) {
    if (input % i == 0) {
      return false
    }
  }
  return true
}

var total = 2

for (var i = 3; i < 2000000; i += 2) {
  if (prime(i)) {
    total += i
  }
}

console.log(total)
// 142913828922
