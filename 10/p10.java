// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

// Find the sum of all the primes below two million.

public class p10 {

  static boolean prime(long input) {
    double sq = Math.sqrt(input);
    for(int i = 3; i <= sq; i += 2) {
      if(input % i == 0) {
        return false;
      }
    }
    return true;
  }

  static long sumPrimesBelow(int limit) {
    long total = 2;
    for(int i = 3; i < limit; i += 2) {
      if (prime(i)) {
        total += i;
      }
    }
    return total;
  }

  public static void main(String[] args) {
    System.out.println(sumPrimesBelow(2000000));
  }
}
// 142913828922
