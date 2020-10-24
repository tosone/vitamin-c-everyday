#undef NDEBUG
#include <assert.h>
#include <stdio.h>

#include <adding.h>

int main() {
  struct Data data;
  pthread_t tid[10];
  for (int i = 0; i < 10; i++) {
    pthread_create(&tid[i], NULL, adding, (void *)&data);
  }
  for (int i = 0; i < 10; i++) {
    pthread_join(tid[i], NULL);
  }

  printf("the value of acnt is %d\n", data.acnt);
  printf("the value of cnt is  %d\n", data.cnt);
  assert(data.acnt == 10000);
  assert(data.cnt == 10000);
  return 0;
}
