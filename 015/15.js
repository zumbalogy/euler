// Starting in the top left corner of a 2×2 grid, and only being able to move
// to the right and down, there are exactly 6 routes to the bottom right corner.

// How many such routes are there through a 20×20 grid?


const fact = (n) => {
  n = BigInt(n)
  for (out = BigInt(1); n > 1; n--) {
    out *= n
  }
  return out
}

const combination = (from, take) => {
  return fact(from) / (fact(take) * fact(from - take))
}

console.log(combination(40, 20))
// 137846528820n
