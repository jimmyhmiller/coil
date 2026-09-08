#include <stdint.h>
#include <stdlib.h>

/* Exact-sized allocations make accidental ABI-register-width reads observable
   under ASan, even when an optimizing compiler eliminates local spill slots. */
#define CASE(N)                                                             \
  typedef struct { uint8_t bytes[N]; } Bytes##N;                             \
  Bytes##N *bytes##N##_new(void) {                                           \
    Bytes##N *value = malloc(sizeof(*value));                                \
    if (!value) abort();                                                    \
    for (int i = 0; i < N; ++i) value->bytes[i] = (uint8_t)(i + 1);           \
    return value;                                                          \
  }                                                                        \
  int64_t bytes##N##_sum(Bytes##N value) {                                   \
    int64_t sum = 0;                                                        \
    for (int i = 0; i < N; ++i) sum += value.bytes[i];                        \
    return sum;                                                            \
  }

CASE(1)
CASE(3)
CASE(4)
CASE(9)
CASE(12)
CASE(16)
CASE(24)

Bytes4 bytes4_value(int32_t seed) {
  Bytes4 value = {{(uint8_t)seed, 2, 3, 4}};
  return value;
}
