// The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
// The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.

package main

import "fmt"

func sumUnder(x int) int {
  return ((x * x) + x) / 2
}

func sumSteps(step int, limit int) int {
  return step * sumUnder((limit - 1) / step)
}

func main() {
  fmt.Println(sumSteps(3, 1000) + sumSteps(5, 1000) - sumSteps(15, 1000))
}
// 233168
