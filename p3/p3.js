// The prime factors of 13195 are 5, 7, 13 and 29.
// What is the largest prime factor of the number 600851475143?

function isPrime(input) {
  if (input % 2 == 0)
    return false
  var sq = Math.sqrt(input)
  for (var i = 3; i < sq; i += 2)
    if (input % i == 0)
      return false
  return true
}

function bigFactor(input) {
  var sq = Math.ceil(Math.sqrt(input))
  for (var i = sq; i > 0; i--)
    if (input % i == 0 && isPrime(i))
      return i
}

console.log(bigFactor(600851475143))
// 6857
