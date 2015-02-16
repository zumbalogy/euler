// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

// a^2 + b^2 = c^2

// For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.

public class p9 {

  static double tripletOfSum(int sum) {
    for(double a = 1; a < sum; a++) {
      for(double b = a; b < sum - b; b++) {
        double c = Math.sqrt((a * a) + (b * b));
        if(a + b + c == sum) {
          return a * b * c;
        }
      }
    }
    return 0;
  }

  public static void main(String[] args) {
    System.out.println(tripletOfSum(1000));
  }
}
// 3.1875E7
