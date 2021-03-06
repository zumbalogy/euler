// Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
// 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

// Sum the even terms in the Fibonacci sequence under four million

class p2 {
  static int sumEvenFibsUnder(int limit) {
    int total = 0;
    int a = 1;
    int b = 2;
    int c;
    while(b < limit) {
      total += b;
      c = a + b;
      a = b + c;
      b = a + c;
    }
    return total;
  }

  public static void main(String[] args) {
    System.out.println(sumEvenFibsUnder(4000000));
  }
}
// 4613732
