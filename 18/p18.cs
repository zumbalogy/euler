// Start at the top of the triangle and move to adjacent numbers on the row below, the max sum is 23.

// 3
// 7 4
// 2 4 6
// 8 5 9 3

// That is, 3 + 7 + 4 + 9 = 23.
// Find the max sum from top to bottom of the triangle.

class MainClass
{
  static void Main()
  {
    int[][] tree = new int[15][];
    tree[0] = new int[] { 75 };
    tree[1] = new int[] { 95, 64 };
    tree[2] = new int[] { 17, 47, 82 };
    tree[3] = new int[] { 18, 35, 87, 10 };
    tree[4] = new int[] { 20,  4, 82, 47, 65 };
    tree[5] = new int[] { 19,  1, 23, 75,  3, 34 };
    tree[6] = new int[] { 88,  2, 77, 73,  7, 63, 67 };
    tree[7] = new int[] { 99, 65,  4, 28,  6, 16, 70, 92 };
    tree[8] = new int[] { 41, 41, 26, 56, 83, 40, 80, 70, 33 };
    tree[9] = new int[] { 41, 48, 72, 33, 47, 32, 37, 16, 94, 29 };
    tree[10] = new int[] { 53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14 };
    tree[11] = new int[] { 70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57 };
    tree[12] = new int[] { 91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48 };
    tree[13] = new int[] { 63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31 };
    tree[14] = new int[] {  4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23 };

    for (int i = tree.Length - 2; i >= 0; i--)
    {
      for (int j = tree[i].Length - 1; j >= 0; j--)
      {
        tree[i][j] += System.Math.Max(tree[i + 1][j], tree[i + 1][j + 1]);
      }
    }

    System.Console.WriteLine(tree[0][0]);
  }
}
// 1074
