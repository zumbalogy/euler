// What is the 10 001st prime number? (not including one)

function prime(input) {
  var limit = Math.sqrt(input)
  for (var i = 3; i <= limit; i += 1) {
    if (input % i == 0) {
      return false
    }
  }
  return true
}

function nthPrime(n) {
  var i = 1
  while (n > 1) {
    i += 2
    prime(i) && n--
  }
  return i
}

console.log(nthPrime(10001))
// 104743

