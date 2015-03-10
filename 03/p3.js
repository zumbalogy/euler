// The prime factors of 13195 are 5, 7, 13 and 29.
// What is the largest prime factor of the number 600851475143?

function isPrime(n) {
  for (var i = 3; i < Math.sqrt(n); i += 2) {
    if (n % i == 0) { return false }
  }
  return true
}

function factor(n) {
  while(!isPrime(n)) {
    if (n % 2 == 0) { n /= 2 }
    var a = 3
    while(n % a != 0) { a += 2 }
    n /= a
  }
  return n
}

console.log(factor(600851475143))
// 6857
