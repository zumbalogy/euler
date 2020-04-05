// Find the largest palindome number (9009) that is the product of 2 3-digit numbers.

class p4 {

  static Boolean is_pal(int input) {
    String string = Integer.toString(input);
    int len = string.length();
    for(int i = 0; i < len / 2; i++) {
      if (string.charAt(i) != string.charAt(len - (i + 1))) {
        return false;
      }
    }
    return true;
  }

  static Integer large_palindome_number() {
    int out = 0;
    int current;
    for(int a = 999; a > 99; a--) {
      for(int b = 999; b > 99; b--) {
        current = a * b;
        if(is_pal(current) && current > out) {
          out = current;
        }
      }
    }
    return out;
  }

  public static void main(String[] args) {
    System.out.println(large_palindome_number());
  }
}

// 906609
// 913 * 993
