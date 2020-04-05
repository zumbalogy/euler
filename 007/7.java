// What is the 10 001st prime number? (not including one)

class p7 {

  static boolean oddPrime(int n) {
    double limit = Math.sqrt(n);
    for(int i = 3; i <= limit; i += 2) {
      if(n % i == 0) {
        return false;
      }
    }
    return true;
  }

  static int nthPrime(int n) {
    int current = 1;
    while(n > 1) {
      current += 2;
      if(oddPrime(current)) {
        n--;
      }
    }
    return current;
  }

  public static void main(String[] args) {
    System.out.println(nthPrime(10001));
  }
}

// 104743
