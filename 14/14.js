// The following iterative sequence is defined for the set of positive integers:
// n → n/2 (n is even)
// n → 3n + 1 (n is odd)

// Using the rule above and starting with 13, we generate the following sequence:
// 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
// This sequence has 10 terms. It is not proven (Collatz Problem) but it is thought that all numbers go to 1.

// Which starting number, under one million, produces the longest chain?
// NOTE: Once the chain starts the terms are allowed to go above one million.

function colCount(n) {
  for (var count = 1; n > 1; count++) {
    if (n % 2 == 0) {
      n /= 2
    } else {
      n = (3 * n) + 1
    }
  }
  return count
}

function bestCount(limit) {
  var best = 0
  var bestStart = 0
  while(1 < limit--) {
    var count = colCount(limit)
    if (count > best) {
      best = count
      bestStart = limit
    }
  }
  return bestStart
}

console.log(bestCount(1000000))
// 837799
