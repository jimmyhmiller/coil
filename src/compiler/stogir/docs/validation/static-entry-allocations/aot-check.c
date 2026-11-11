#include <stdint.h>
#include <assert.h>
extern uint64_t static_stack(uint64_t);
int main(void) {
 const uint64_t inputs[] = {0, 1, 16, 32, 64, 128, UINT64_C(0x123456789abcdef0), UINT64_MAX};
 for (unsigned i=0; i<sizeof(inputs)/sizeof(inputs[0]); ++i)
  assert(static_stack(inputs[i]) == inputs[i] + UINT64_C(13));
 return 0;
}
