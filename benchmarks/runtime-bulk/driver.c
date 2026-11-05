#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
extern void gap_graph_copy(void *, const void *);
extern int64_t gap_graph_extent(void);
extern void gap_graph_clear(void *);
static double cpu(void) {
    struct timespec t;
    if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &t)) abort();
    return t.tv_sec + t.tv_nsec / 1e9;
}
int main(void) {
    const size_t extent = (size_t)gap_graph_extent();
    if (!extent || extent > 1024) return 2;
    unsigned char *actual = malloc(4096), *expected = malloc(4096);
    if (!actual || !expected) return 3;
    for (size_t source = 0; source < 64; ++source) {
        for (size_t destination = 0; destination < 64; ++destination) {
            for (size_t j = 0; j < 4096; ++j)
                actual[j] = expected[j] = (unsigned char)(j * 37 + source * 13 + destination);
            memmove(expected + 8 * destination, expected + 8 * source, extent);
            gap_graph_copy(actual + 8 * destination, actual + 8 * source);
            if (memcmp(actual, expected, 4096)) {
                fprintf(stderr, "copy mismatch source=%zu destination=%zu\n", source, destination);
                return 4;
            }
        }
    }
    for (size_t destination = 0; destination < 64; ++destination) {
        memset(actual, 0xa5, 4096); memset(expected, 0xa5, 4096);
        memset(expected + destination * 8, 0, extent);
        gap_graph_clear(actual + destination * 8);
        if (memcmp(actual, expected, 4096)) return 7;
    }
    unsigned char *source = malloc(64 * 2048), *destination = malloc(64 * 2048);
    if (!source || !destination) return 5;
    memset(source, 0x59, 64 * 2048);
    memset(destination, 0xa5, 64 * 2048);
    const double begin = cpu();
    for (size_t i = 0; i < 1000000; ++i) {
        const size_t offset = (i & 63) * 2048;
        gap_graph_copy(destination + offset, source + offset);
    }
    const double elapsed = cpu() - begin;
    for (size_t i = 0; i < 64; ++i)
        if (memcmp(destination + i * 2048, source + i * 2048, extent)) return 6;
    printf("{\"extent\":%zu,\"cases\":4096,\"calls\":1000000,\"cpu_s\":%.9f}\n", extent, elapsed);
    free(actual); free(expected); free(source); free(destination);
    return 0;
}
