#include <stdint.h>
#include <stdio.h>
extern int64_t gap_word_width(int64_t, int64_t);
int main(void) {
    const int64_t xs[] = {INT64_MIN, -2147483649LL, -2147483648LL, -1, 0, 1, 2, 2147483647LL, 2147483648LL, 4294967295LL, 4294967296LL, INT64_MAX};
    const int64_t ys[] = {-2147483649LL, -2147483648LL, -1, 0, 1, 2, 3, 2147483647LL, 2147483648LL, 4294967295LL};
    unsigned failures = 0;
    for (unsigned i = 0; i < sizeof(xs)/sizeof(xs[0]); ++i)
        for (unsigned j = 0; j < sizeof(ys)/sizeof(ys[0]); ++j) {
            uint64_t v = (uint32_t)xs[i], b = (uint32_t)ys[j];
            for (unsigned k = 0; k < 18; ++k) {
                v = (k % 3 == 0 ? v + b : k % 3 == 1 ? v * b : v ^ b) & UINT32_MAX;
            }
            int64_t expected = v < UINT64_C(0x80000000) ? (int64_t)v : (int64_t)v - INT64_C(0x100000000);
            if (gap_word_width(xs[i], ys[j]) != expected) ++failures;
        }
    printf("word-width linked AOT: 120 checked inputs, %u failures\n", failures);
    return failures != 0;
}
