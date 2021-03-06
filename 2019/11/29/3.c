#include <stdio.h>

typedef void (*callback_t)(char *);

void callback_test(char *str) {
  printf("%s\n", str);
  return;
}

void callback_main(void (*cb)(char *)) {
  cb("hello");
  return;
}

int main(int argc, char const *argv[]) {
  callback_main(&callback_test);
  return 0;
}
