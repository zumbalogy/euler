// The prime factors of 13195 are 5, 7, 13 and 29.
// What is the largest prime factor of the number 600851475143?

function factor(n) {
  while(n % 2 == 0) { n /= 2 }
  var i = 3
  while(i < Math.sqrt(n)) {
    while(n % i == 0) { n /= i }
    i += 2
  }
  return n
}

console.log(factor(600851475143))
// 6857
