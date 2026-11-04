#include <stddef.h>
#include <stdio.h>
static unsigned long long total_calls, zero_calls;
int memcmp(const void *a, const void *b, size_t n) {
    ++total_calls;
    if (n == 0) { ++zero_calls; return 0; }
    const unsigned char *left = a, *right = b;
    for (size_t i = 0; i < n; ++i) {
        if (left[i] != right[i]) return (int)left[i] - (int)right[i];
    }
    return 0;
}
__attribute__((destructor)) static void report_calls(void) {
    fprintf(stderr, "debug-only memcmp calls=%llu zero=%llu\n", total_calls, zero_calls);
}
