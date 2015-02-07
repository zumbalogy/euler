// What is the 10 001st prime number? (not including one)

function oddPrime(input) {
  var limit = Math.sqrt(input)
  for (var i = 3; i <= limit; i += 2) {
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
    oddPrime(i) && n--
  }
  return i
}

console.log(nthPrime(10001))
// 104743

