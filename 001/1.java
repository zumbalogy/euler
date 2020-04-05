// Find the sum of all the multiples of 3 or 5 below 1000.

class p1 {

  static int sumUnder(int limit) {
    return ((limit * limit) + limit) / 2;
  }

  static int sumSteps(int step, int limit) {
    return step * sumUnder((limit - 1) / step);
  }

  public static void main(String[] args) {
    System.out.println(sumSteps(3, 1000) + sumSteps(5, 1000) - sumSteps(15, 1000));
  }
}
// 233168
