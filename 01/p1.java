// Find the sum of all the multiples of 3 or 5 below 1000.

public class p1 {

  static double sumUnder(double limit) {
    return (limit / 2) * (limit + 1);
  }

  static double sumStepUnder(double step, double limit) {
    return step * sumUnder(Math.floor((limit - 1) / step));
  }

  public static void main(String[] args) {
    System.out.println(sumStepUnder(3, 1000) + sumStepUnder(5, 1000) - sumStepUnder(15, 1000));
  }
}
// 233168
