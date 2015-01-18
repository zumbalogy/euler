// Find the sum of all the multiples of 3 or 5 below 1000.

public class p1 {
  public static Integer method() {
    int total = 0;
    for(int i = 0; i < 1000; i++) {
      if(i % 3 == 0 || i % 5 == 0) {
        total += i;
      }
    }
    return total;
  }

  public static void main(String[] args) {
    System.out.println(method());
  }
}

// 233168
