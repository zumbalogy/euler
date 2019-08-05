#include <stdio.h>

int Cells[81];

//////////////////////////////////////////////////////////////////

char global_print_str[9];
void print(int i) {
  int bits = 9;
  global_print_str[bits] = 0;
  unsigned u = *(unsigned *)&i;
  for(; bits--; u >>= 1) {
    global_print_str[bits] = u & 1 ? '1' : '0';
  }
  if        (i == 0b111111110) { printf(" %d ", 1);
  } else if (i == 0b111111101) { printf(" %d ", 2);
  } else if (i == 0b111111011) { printf(" %d ", 3);
  } else if (i == 0b111110111) { printf(" %d ", 4);
  } else if (i == 0b111101111) { printf(" %d ", 5);
  } else if (i == 0b111011111) { printf(" %d ", 6);
  } else if (i == 0b110111111) { printf(" %d ", 7);
  } else if (i == 0b101111111) { printf(" %d ", 8);
  } else if (i == 0b011111111) { printf(" %d ", 9);
  } else { printf(" _ "); }
}

void printBoard() {
  for (int i = 0; i < 81; i++) {
    print(Cells[i]);
    if ((i + 1) % 3 == 0) {
      printf("  ");
    }
    if ((i + 1) % 9 == 0) {
      printf("\n");
    }
    if ((i + 1) % 27 == 0) {
      printf("\n");
    }
  }
  printf("\n");
}

//////////////////////////////////////////////////////////////////

void initCells(int* input) {
  for (int i = 0; i < 81; i++) {
    if      (input[i] == 0) { Cells[i] = 0b000000000; }
    else if (input[i] == 1) { Cells[i] = 0b111111110; }
    else if (input[i] == 2) { Cells[i] = 0b111111101; }
    else if (input[i] == 3) { Cells[i] = 0b111111011; }
    else if (input[i] == 4) { Cells[i] = 0b111110111; }
    else if (input[i] == 5) { Cells[i] = 0b111101111; }
    else if (input[i] == 6) { Cells[i] = 0b111011111; }
    else if (input[i] == 7) { Cells[i] = 0b110111111; }
    else if (input[i] == 8) { Cells[i] = 0b101111111; }
    else if (input[i] == 9) { Cells[i] = 0b011111111; }
  }
}

int solution(int cell) {
  if (cell == 0) {
    return 0;
  }
  if ((cell | (cell + 1)) != 0b111111111) {
    return 0;
  }
  return 0b111111111 ^ cell;
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

int row_rest_out[9];
int* row_rest(int idx) {
  int offset = (idx / 9) * 9;
  // NOTE: these might not be useful. next 6 lines
  int indexes[] = {0,1,2,3,4,5,6,7,8};
  if (idx - offset == 0) {
    indexes[0] = 1;
  } else {
    indexes[idx - offset] = 0;
  }
  for (int i = 0; i < 9; i++) {
    row_rest_out[i] = Cells[i + offset];
  }
  return row_rest_out;
}

int grid_rest_out[9];
int* grid_rest(int idx) {
  int col = idx % 9;
  int row = idx / 9;
  int grid = (3 * (row / 3)) + (col / 3);
  int offset = ((grid / 3) * 27) + (grid % 3) * 3;
  int idxs[] = {0, 1, 2, 9, 10, 11, 18, 19, 20};
  int extraOffset = 0;
  for (int i = 0; i < 9; i++) {
    int foo = idxs[i] + offset;
    if (foo != idx - offset) {
      grid_rest_out[i - extraOffset] = Cells[foo];
    } else {
      extraOffset = 1;
    }
  }
  return grid_rest_out;
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
  for (int i = 0; i < 9; i++) {
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

int Saved_puzzles[81 * 81];

int solve(int cellIndex) {
  int res = repeatCalc();
  if (res == 0) {
    return 0;
  }
  if (solvedCount() == 81) {
    return 1;
  }
  int offset = cellIndex * 81;
  for (int i = 0; i < 81; i++) {
    Saved_puzzles[i + offset] = Cells[i];
  }
  int cell = Cells[cellIndex];
  int allGuesses[] = {
    0b000000001,
    0b000000010,
    0b000000100,
    0b000001000,
    0b000010000,
    0b000100000,
    0b001000000,
    0b010000000,
    0b100000000,
  };
  for (int i = 0; i < 9; i++) {
    int number_guess = allGuesses[i];
    if ((number_guess & cell) == 0b000000000) {
      Cells[cellIndex] = (0b111111111 ^ number_guess);
      solve(cellIndex + 1);
      if (solvedCount() == 81) {
        return 1;
      }
      for (int j = 0; j < 81; j++) {
        Cells[j] = Saved_puzzles[j + offset];
      }
    }
  }
  return 1;
}

int toDec(int x) {
  if      (x == 0b111111110) { return 1; }
  else if (x == 0b111111101) { return 2; }
  else if (x == 0b111111011) { return 3; }
  else if (x == 0b111110111) { return 4; }
  else if (x == 0b111101111) { return 5; }
  else if (x == 0b111011111) { return 6; }
  else if (x == 0b110111111) { return 7; }
  else if (x == 0b101111111) { return 8; }
  else if (x == 0b011111111) { return 9; }
}

int main() {
  char ch;
  FILE *fp;
  int idx = 0;
  int eulerOutput = 0;
  fp = fopen("./sudoku.txt", "r");

  while((ch = fgetc(fp)) != EOF) {
    if (ch >= '0' && ch <= '9') {
      Cells[idx] = ch - 48;
      idx += 1;
      if (idx == 81) {
        idx = 0;
        initCells(Cells);
        solve(0);
        eulerOutput += toDec(Cells[0]) * 100;
        eulerOutput += toDec(Cells[1]) * 10;
        eulerOutput += toDec(Cells[2]);
      }
    } else if (ch != '\n') {
      while (ch != '\n') {
        ch = fgetc(fp);
      }
    }
  }
  printf("%d\n", eulerOutput);
  fclose(fp);
  return 1;
}
