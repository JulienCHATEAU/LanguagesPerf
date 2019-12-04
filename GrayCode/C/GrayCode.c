#include <math.h>
#include <stdio.h>

int gray_encode(int n) { return n ^ (n >> 1); }

int gray_decode(int n) {
  int p = n;
  while (n >>= 1)
    p ^= n;
  return p;
}

int main(int argc, char **argv) {
  int i, g, b;

  for (i = 0; i < pow(2, 25); i++) {
    g = gray_encode(i);
    gray_decode(g);
  }
  return 0;
}