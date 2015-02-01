// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

public class p5 {
  static int gcd(int a, int b) {
    return b == 0 ? a : gcd(b, a % b);
  }

  static int lcm(int a, int b) {
    return (a * b) / gcd(a, b);
  }

  static int gcdUpTo(int limit) {
    int total = 1;
    for(int i = limit / 2; i < limit; i++) {
      total = lcm(total, i);
    }
    return total;
  }

  public static void main(String[] args) {
    System.out.println(gcdUpTo(20));
  }
}

// 232792560
