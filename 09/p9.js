// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

// a^2 + b^2 = c^2

// For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.

function pythagoreanTripletOfSum(sum) {
  for (var a = 1; a < sum; a++) {
    for (var b = a; b < sum - b; b++) {
      var c = Math.sqrt(a * a + b * b)
      if (a + b + c == sum) {
        return a * b * c
      }
    }
  }
}

console.log(pythagoreanTripletOfSum(1000))
// 31875000
