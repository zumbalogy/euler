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

function totalNotFromAbundant() {
  var abundants = []
  for(var i = 12; i < 28123; i++) {
    if (abundant(i)) {
      abundants.push(i)
    }
  }
  var sums = []
  var len = abundants.length
  for(var a = 0; a < len; a++) {
    for(var b = a; b < len; b++) {
      ab = abundants[a] + abundants[b]
      if(ab < 28123 && sums.indexOf(ab) == -1) {
        sums.push(ab)
      }
    }
  }
  var sumAll = 0 // there is a better way to grab this (like, half 28123 times 28123)
  for(var i = 1; i < 28123; i++) {
    sumAll += i
  }
  var sumFromAbundants = sums.reduce(function(a, b) {
    return a + b
  })
  return sumAll - sumFromAbundants
}

console.log(totalNotFromAbundant())
// 4179871
