#include <stdio.h>
#include <uuid/uuid.h>

#define UUID_STR_LEN 37

int main(int argc, char const *argv[]) {
  uuid_t uuid;
  uuid_generate(uuid);
  char uuid_str[UUID_STR_LEN];
  uuid_unparse_lower(uuid, uuid_str);
  printf("%s\n", uuid_str);
  return 0;
}
