#include <pthread.h>
#include <stdatomic.h>

struct Data {
  _Atomic int acnt;
  int cnt;
};

void *adding(void *input);
