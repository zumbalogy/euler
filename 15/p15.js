// Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

// How many such routes are there through a 20×20 grid?

function fact(n) {
  for(out = 1; n > 1; n--) {
    out *= n
  }
  return out
}

function combination(from, take) {
  return fact(from) / (fact(take) * fact(from - take))
}

console.log(combination(40, 20))
// 137846528820.00003
// should not have the .00003 but thats just how it do
