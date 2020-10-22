#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define N 3       // suduku box length
#define M (N * N) // sudoku row length

bool exact_cover_16(char str[M]) {
  uint16_t a = (1 << M) - 1;
  for (size_t i = 0; i < M; i++) {
    if (str[i] != '.') {
      a ^= 1 << (str[i] - 49);
    }
  }
  return a == 0;
}

bool exact_cover_8(char str[M]) {
  uint8_t a = UINT8_MAX;
  bool has_9 = false;
  for (size_t i = 0; i < M; i++) {
    if (str[i] != '.') {
      if (str[i] - 49 != 8) {
        a ^= 1 << (str[i] - 49);
      } else {
        has_9 = true;
      }
    }
  }
  return a == 0 && has_9;
}

int main(int argc, char const *argv[]) {
  char str[] = "123456789";
  printf("%s=%s\n", str, exact_cover_16(str) ? "true" : "false");
  printf("%s=%s\n", str, exact_cover_8(str) ? "true" : "false");
  return 0;
}
