#include <adding.h>

void *adding(void *input) {
  struct Data *data = (struct Data *)input;
  for (int i = 0; i < 1000; i++) {
    data->acnt++;
    data->cnt++;
  }
  pthread_exit(NULL);
}
