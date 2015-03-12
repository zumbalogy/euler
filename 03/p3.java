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

  static long factor(long input) {
    while(!prime(input)) {
      if(input % 2 == 0) {
        input /= 2;
      }
      for(double i = 3; true; i += 2) {
        if((input / i) % 1 == 0) {
          input /= i;
          break;
        }
      }
    }
    return input;
  }

  public static void main(String[] args) {
    System.out.println(factor(600851475143L));
  }
}

// 6857
