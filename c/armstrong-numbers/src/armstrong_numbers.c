#include "armstrong_numbers.h"
#include <math.h>

bool is_armstrong_number(int candidate) {
  if (candidate == 0) {
    return true;
  }

  int acc = candidate, d = acc % 10, power = log10(acc) + 1,
      sum = pow(d, power);
  acc = acc / 10;
  while (acc != 0) {
    d = acc % 10;
    acc /= 10;
    sum += pow(d, power);
  }

  return sum == candidate;
}
