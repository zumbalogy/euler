// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.

function sumUnder(input) {
  return input * (input + 1) / 2
}

function sumStepUnder(step, input) {
  return step * sumUnder(Math.floor((input - 1) / step))
}

console.log(
  sumStepUnder(3, 1000) + sumStepUnder(5, 1000) - sumStepUnder(15, 1000)
)
// 233168
