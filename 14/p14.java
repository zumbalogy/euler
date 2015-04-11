// The following iterative sequence is defined for the set of positive integers:
// n → n/2 (n is even)
// n → 3n + 1 (n is odd)

// Using the rule above and starting with 13, we generate the following sequence:
// 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
// This sequence has 10 terms. It is not proven (Collatz Problem) but it is thought that all numbers go to 1.

// Which starting number, under one million, produces the longest chain?
// NOTE: Once the chain starts the terms are allowed to go above one million.

public class p14 {
  static int colCount(int n) {
    int count;
    for(count = 1; n > 1; count++) {
      if(n % 2 == 0) {
        n /= 2;
      } else {
        n = (3 * n) + 1;
      }
    }
    return count;
  }

  static int bestCount(int n) {
    int best = 0;
    int bestStart = 0;
    while(1 < n--) {
      int count = colCount(n);
      if(count > best) {
        System.out.println(" ");
        System.out.println(count);
        System.out.println(n);
        best = count;
        bestStart = n;
      }
    }
    return bestStart;
  }

  public static void main(String[] args) {
    // System.out.println(bestCount(1000000));
    System.out.println(colCount(837799));
  }
}

// 837799
