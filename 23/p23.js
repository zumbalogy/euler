// A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number. A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

// As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28_123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

// Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
function abundant?(input) {
  var a = 0
  var sq = Math.sqrt(input)
  for(var i = 0; i < sq; i++) {
    if (input % i == 0) {
      a += foo
      if (a > input) {
        return true
      }
    }
  }
  return false
}

function madeFromAbundant?(input) {
  if (input % 2 == 1 && input % 5 == 0) {
    return false
  }
  var limit = input / 2
  for (var i = 12; i < limit; i++) {
    if {abundant?(i) && abundant?(input - 1) {
      return true
    }
  }
  return false
}
