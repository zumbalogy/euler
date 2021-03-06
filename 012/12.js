// The sequence of triangle numbers is generated by adding the natural numbers.
// The 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.

// The first ten:
// 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

// Listing the factors of the first seven triangle numbers:
//  1: 1
//  3: 1,3
//  6: 1,2,3,6
// 10: 1,2,5,10
// 15: 1,3,5,15
// 21: 1,3,7,21
// 28: 1,2,4,7,14,28

// 28 is the first triangle number to have over five divisors.
// What is the first triangle number to have over five hundred divisors?

function factor_count(input) {
  var count = 0
  for (var i = 1; i < Math.sqrt(input); i++)
    if (input % i == 0) {
      count += 2
    }
  return count
}

var triangle = 1;

for (var i = 2; factor_count(triangle) < 500; i++) {
  triangle += i
}

console.log(triangle)
// 76576500
