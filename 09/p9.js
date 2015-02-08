// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

// a^2 + b^2 = c^2

// For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.

loop:
for (var a = 1; a < 1000; a++) {
  for (var b = 1; b < 1000 - a; b++) {
    var c = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2))
    if (a + b + c == 1000) {
      console.log(a * b * c)
      break loop // or give empty return. or this would be a function
    }
  }
}

// 31875000
