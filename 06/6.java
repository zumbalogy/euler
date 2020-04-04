// The sum of the squares of the first ten natural numbers is,

// 1^2 + 2^2 + ... + 10^2 = 385
// The square of the sum of the first ten natural numbers is,

// (1 + 2 + ... + 10)^2 = 55^2 = 3025
// delta for sum of the squares of first ten natural numbers and square of the sum is 3025 − 385 = 2640

// Find delta for sum of squares of the first one hundred natural numbers and square of the sum

public class p6 {

  static int sumSqVsSqSum(int n) {
    int sum = (n / 2) * (n + 1);
    int sqSum = sum * sum;
    int sumSq = (n * (n + 1) * ((2 * n) + 1)) / 6;
    return sqSum - sumSq;
  }

  public static void main(String[] args) {
    System.out.println(sumSqVsSqSum(100));
  }
}

// 25164150
