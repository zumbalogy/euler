#include <stdio.h>
#include <stdlib.h>

#include <limits.h>

char global_print_str[9];

void print(int i) {
  int bits = 9;
  global_print_str[bits] = 0;
  unsigned u = *(unsigned *)&i;
  for(; bits--; u >>= 1) {
    global_print_str[bits] = u & 1 ? '1' : '0';
  }
  printf("%s", global_print_str);
  if        (i == 0b111111110) { printf(" = %d", 1);
  } else if (i == 0b111111101) { printf(" = %d", 2);
  } else if (i == 0b111111011) { printf(" = %d", 3);
  } else if (i == 0b111110111) { printf(" = %d", 4);
  } else if (i == 0b111101111) { printf(" = %d", 5);
  } else if (i == 0b111011111) { printf(" = %d", 6);
  } else if (i == 0b110111111) { printf(" = %d", 7);
  } else if (i == 0b101111111) { printf(" = %d", 8);
  } else if (i == 0b011111111) { printf(" = %d", 9); }
  printf("\n");
}

int Cells[81];

void printBoard() {
  for (int i = 0; i < 81; i++) {
    printf("%d = ", i);
    print(Cells[i]);
  }
}

void initCells(int* input) {
  for (int i = 0; i < 81; i++) {
    if (input[i] == 0) {
      Cells[i] = 0b000000000;
    } else if (input[i] == 1) {
      Cells[i] = 0b111111110;
    } else if (input[i] == 2) {
      Cells[i] = 0b111111101;
    } else if (input[i] == 3) {
      Cells[i] = 0b111111011;
    } else if (input[i] == 4) {
      Cells[i] = 0b111110111;
    } else if (input[i] == 5) {
      Cells[i] = 0b111101111;
    } else if (input[i] == 6) {
      Cells[i] = 0b111011111;
    } else if (input[i] == 7) {
      Cells[i] = 0b110111111;
    } else if (input[i] == 8) {
      Cells[i] = 0b101111111;
    } else if (input[i] == 9) {
      Cells[i] = 0b011111111;
    }
  }
}

int solution(int cell) {
  if (cell == 0) {
    return 0;
  }
  int is_maybe = 0b111111111 ^ cell;
  if ((is_maybe & (is_maybe - 1)) == 0) {
    return is_maybe;
  }
  return 0;
}

int col_rest_out[9];
int* col_rest(int idx) {
  int offset = idx % 9;
  int indexes[] = {0,9,18,27,36,45,54,63,72};
  if (idx / 9 == 0) {
    indexes[0] = 9;
  } else {
    indexes[idx / 9] = 0;
  }
  for (int i = 0; i < 9; i++) {
    int foo = indexes[i] + offset;
    col_rest_out[i] = Cells[foo];
  }
  return col_rest_out;
}

int* row_rest(int idx) {
  int *out = malloc (sizeof (int) * 8);
  int offset = (idx / 9) * 9;
  int indexes[] = {0,1,2,3,4,5,6,7,8};
  if (idx - offset == 0) {
    indexes[0] = 1;
  } else {
    indexes[idx - offset] = 0;
  }
  for (int i = 0; i < 9; i++) {
    out[i] = Cells[i + offset];
  }
  return out;
}

int* grid_rest(int idx) {
  int *out = malloc (sizeof (int) * 8);
  int col = idx % 9;
  int row = idx / 9;
  int grid = (3 * (row / 3)) + (col / 3);
  int offset = ((grid / 3) * 27) + (grid % 3) * 3;
  int idxs[] = {0, 1, 2, 9, 10, 11, 18, 19, 20};
  int extraOffset = 0;
  for (int i = 0; i < 9; i++) {
    int foo = idxs[i] + offset;
    if (foo != idx - offset) {
      out[i - extraOffset] = Cells[foo];
    } else {
      extraOffset = 1;
    }
  }
  return out;
}

int peerSolutions(int idx) {
  int out = 0b000000000;
  int* cRest = col_rest(idx);
  int* rRest = row_rest(idx);
  int* gRest = grid_rest(idx);
  for (int i = 0; i < 9; i++) {
    int s = solution(cRest[i]);
    if (s != 0) {
      out |= s;
    }
  }
  for (int i = 0; i < 8; i++) {
    int s = solution(rRest[i]);
    if (s != 0) {
      out |= s;
    }
  }
  for (int i = 0; i < 8; i++) {
    int s = solution(gRest[i]);
    if (s != 0) {
      out |= s;
    }
  }
  free(rRest);
  free(gRest);
  return out;
}

int cellCalc(int index) {
  if (solution(Cells[index]) != 0) { return 1; }
  Cells[index] = peerSolutions(index);
  if (Cells[index] == 0b111111111) { return 0; }
  int is_maybe = 0b111111111 ^ Cells[index];
  if (0 == (is_maybe & (is_maybe - 1))) { return 1; }
  int* cRest = col_rest(index);
  int* rRest = row_rest(index);
  int* gRest = grid_rest(index);
  int hasToBeC = is_maybe;
  int hasToBeR = is_maybe;
  int hasToBeG = is_maybe;
  for (int i = 0; i < 9; i++) { hasToBeC &= cRest[i]; }
  for (int i = 0; i < 8; i++) { hasToBeR &= rRest[i]; }
  for (int i = 0; i < 8; i++) { hasToBeG &= gRest[i]; }
  if (hasToBeC != 0b000000000) {
    if ((hasToBeC & (hasToBeC - 1)) != 0) { return 0; }
    Cells[index] = 0b111111111 ^ hasToBeC;
    return 1;
  }
  if (hasToBeR != 0b000000000) {
    if ((hasToBeR & (hasToBeR - 1)) != 0) { return 0; }
    Cells[index] = 0b111111111 ^ hasToBeR;
    return 1;
  }
  if (hasToBeG != 0b000000000) {
    if ((hasToBeG & (hasToBeG - 1)) != 0) { return 0; }
    Cells[index] = 0b111111111 ^ hasToBeG;
    return 1;
  }
  free(rRest);
  free(gRest);
  return 1;
}

int solvedCount() {
  int out = 0;
  for (int i = 0; i < 81; i++) {
    if (solution(Cells[i])) {
      out++;
    }
  }
  return out;
}

int singleCalc() {
  for (int i = 0; i < 81; i++) {
    int res = cellCalc(i);
    if (res == 0) {
      return 0;
    }
  }
  return 1;
}

int repeatCalc() {
  int tally = solvedCount();
  int res = singleCalc();
  if (res == 0) {
    return 0;
  }
  while (tally != solvedCount()) {
    tally = solvedCount();
    res = singleCalc();
    if (res == 0) {
      return 0;
    }
  }
  return 1;
}

int solve(int cellIndex) {
  int res = repeatCalc();
  return 1;
}

int grid1[] = {
  0,0,3, 0,2,0, 6,0,0,
  9,0,0, 3,0,5, 0,0,1,
  0,0,1, 8,0,6, 4,0,0,

  0,0,8, 1,0,2, 9,0,0,
  7,0,0, 0,0,0, 0,0,8,
  0,0,6, 7,0,8, 2,0,0,

  0,0,2, 6,0,9, 5,0,0,
  8,0,0, 2,0,3, 0,0,9,
  0,0,5, 0,1,0, 3,0,0
};

// int grid1_solution[] = {
//   4,8,3, 9,2,1, 6,5,7,
//   9,6,7, 3,4,5, 8,2,1,
//   2,5,1, 8,7,6, 4,9,3,
//
//   5,4,8, 1,3,2, 9,7,6,
//   7,2,9, 5,6,4, 1,3,8,
//   1,3,6, 7,9,8, 2,4,5,
//
//   3,7,2, 6,8,9, 5,1,4,
//   8,1,4, 2,5,3, 7,6,9,
//   6,9,5, 4,1,7, 3,8,2
// };

void main() {
  initCells(grid1);
  solve(0);
  printBoard();
}
