// The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
// The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.

#include<stdio.h>

int sumUnder(int x) {
  return ((x * x) + x) / 2;
}

int sumSteps(int step, int limit) {
  return sumUnder((limit - 1) / step) * step;
}

void main() {
  printf("%d\r\n", sumSteps(3, 1000) + sumSteps(5, 1000) - sumSteps(15, 1000));
}
// 233168
