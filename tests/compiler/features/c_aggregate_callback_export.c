#include <stdint.h>

typedef struct {
  int64_t tag;
  int64_t value;
} Target;

typedef struct { uint8_t a, b, c, d; } S4;
typedef struct { int32_t a, b; } S8;
typedef struct { double a, b, c, d; } S32;

int64_t invoke_callbacks(int64_t (*s4_callback)(S4),
                         int64_t (*s8_callback)(S8),
                         int64_t (*target_callback)(Target),
                         int64_t (*s32_callback)(S32)) {
  S4 s4 = {1, 2, 3, 4};
  S8 s8 = {11, 22};
  Target target = {7, 42};
  S32 s32 = {1, 2, 3, 4};
  return s4_callback(s4) + s8_callback(s8) + target_callback(target) +
         s32_callback(s32);
}
