// Find the sum of all the multiples of 3 or 5 below 1000.

function sumUnder(input) {
  return input * (input + 1) / 2
}

function sumSteps(step, limit) {
  return step * sumUnder(Math.floor((limit - 1) / step))
}

console.log(
  sumSteps(3, 1000) + sumSteps(5, 1000) - sumSteps(15, 1000)
)
// 233168
