#include <stdint.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
extern void *gap_provider_create(int64_t, int64_t, int64_t);
extern int64_t gap_provider_kernel(void *);
extern void gap_provider_release(void *);
static int64_t cpu_ns(void) {
    struct timespec t;
    if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &t)) abort();
    return (int64_t)t.tv_sec * INT64_C(1000000000) + t.tv_nsec;
}
int main(void) {
    const int64_t modules = 256, facades = 8, repetitions = 20000;
    void *context = gap_provider_create(modules, facades, repetitions);
    if (!context) abort();
    int64_t start = cpu_ns();
    int64_t answer = gap_provider_kernel(context);
    int64_t elapsed = cpu_ns() - start;
    const int64_t expected = repetitions + ((repetitions + 1) / 2) * facades;
    if (answer != expected) abort();
    gap_provider_release(context);
    printf("answers %lld kernel_cpu_ns %lld\n", (long long)answer, (long long)elapsed);
    return 0;
}
