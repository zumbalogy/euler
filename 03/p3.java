// The prime factors of 13195 are 5, 7, 13 and 29.
// What is the largest prime factor of the number 600851475143?

public class p3 {
  static long factor(long input) {
    while(input % 2 == 0) {
      input /= 2;
    }
    int i = 3;
    while(i < Math.sqrt(input)) {
      while(input % i == 0) {
        input /= i;
      }
      i += 2;
    }
    return input;
  }
  public static void main(String[] args) {
    System.out.println(factor(600851475143L));
  }
}

// 6857
