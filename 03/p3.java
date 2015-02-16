// The prime factors of 13195 are 5, 7, 13 and 29.
// What is the largest prime factor of the number 600851475143?

public class p3 {
  static boolean prime(long input) {
    double sq = Math.sqrt(input);
    for(int i = 3; i <= sq; i += 2) {
      if(input % i == 0) {
        return false;
      }
    }
    return true;
  }

  static int greatestPrimeFactor(long input) {
    int start = (int) Math.sqrt(input);
    if(start % 2 == 0) {
      start += 1;
    }
    for(int i = start; true; i -= 2) {
      if(input % i == 0 && prime(i)) {
        return i;
      }
    }
  }

  public static void main(String[] args) {
    System.out.println(greatestPrimeFactor(600851475143L));
  }
}

// 6857
