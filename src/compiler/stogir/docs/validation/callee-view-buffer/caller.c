#include <stdint.h>
#include <stdio.h>
extern int64_t view_caller(int64_t);
int main(void) {
    const uint64_t a = UINT64_C(774840979), b = UINT64_C(4067915131);
    for (uint64_t i = 0; i < 128; ++i) {
        if ((uint64_t)view_caller((int64_t)i) != a*i+b) return 1;
    }
    uint64_t sum = 0;
    for (uint64_t i = 0; i < UINT64_C(8000000); ++i)
        sum += (uint64_t)view_caller((int64_t)(i & 127));
    const uint64_t expected = UINT64_C(62500)*(a*UINT64_C(8128)+b*UINT64_C(128));
    if (sum != expected) { fprintf(stderr,"bad checksum\n"); return 2; }
    return 0;
}
