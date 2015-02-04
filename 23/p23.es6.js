// A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number. A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

// As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28_123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

// Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

function abundant(input) {
  var sq = Math.sqrt(input)
  var sum = sq % 1 == 0 ? sq + 1 : 1
  for(var i = 2; i < sq; i++) {
    if (input % i == 0) {
      sum += i + (input / i)
      if (sum > input) {
        return true
      }
    }
  }
  return false
}

function totalNotFromAbundant(limit) {
  var abundants = []
  for(var i = 1; i < limit; i++) {
    if (abundant(i)) {
      abundants.push(i)
    }
  }
  var sums = new Set()
  var len = abundants.length
  var current = 0
  var ab = 0
  for(var a = 0; a < len; a++) {
    current = abundants[a]
    for(var b = a; b < len; b++) {
      ab = current + abundants[b]
      if(ab < limit) {
        sums.add(current + abundants[b])
      }
    }
  }
  var sumAll = ((limit - 1) / 2) * limit
  var sumFromAbundants = 0
  sums.forEach(function(s) { sumFromAbundants += s })
  return sumAll - sumFromAbundants
}

console.log(totalNotFromAbundant(28123))
// 4179871
