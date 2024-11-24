#include <stdio.h>
#include <unistd.h>

int main(void) {
  fprintf(stderr, "My pid: %ld\n", (long)getpid());
  while (1)
    ;
  return 0;
}
