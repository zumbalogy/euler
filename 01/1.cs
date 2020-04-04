// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

// Find the sum of all the multiples of 3 or 5 below 1000.

class MainClass
{
  static int SumUnder(int x)
  {
    return ((x * x) + x) / 2;
  }

  static int SumSteps(int step, int limit)
  {
    return step * SumUnder((limit - 1) / step);
  }

  static void Main()
  {
    int output = SumSteps(3, 1000) + SumSteps(5, 1000) - SumSteps(15, 1000);
    System.Console.WriteLine(output);
  }
}
// 233168
