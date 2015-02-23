// The prime factors of 13195 are 5, 7, 13 and 29.
// What is the largest prime factor of the number 600851475143?

function isPrime(n) {
  for (var i = 3; i < Math.sqrt(n); i += 2) {
    if (n % i == 0) {
      return false
    }
  }
  return true
}

function bigFactor(input) {
  var sq = Math.ceil(Math.sqrt(input))
  if (sq % 2 == 0) {
    sq += 1
  }
  for (var i = sq; i > 0; i -= 2) {
    if (input % i == 0 && isPrime(i)) {
      return i
    }
  }
}

console.log(bigFactor(600851475143))
// 6857
