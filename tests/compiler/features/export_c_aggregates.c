#include <stdio.h>
#include <stdint.h>
typedef struct { int64_t a, b; } Pair;
typedef struct { int32_t x, y; } Small;
typedef struct { int64_t a, b, c, d; } Big;
typedef struct { double x, y, z; } Vec3;
typedef struct { int32_t a, b, c; } Odd;
typedef struct { float x, y, z; } Tri;
int64_t advance_pair(Pair, int64_t); int64_t small_sum(Small); int64_t big_sum(Big, int64_t);
double vec_len2(Vec3); int64_t odd_sum(Odd, Small);
/* Past the eight argument registers, Apple AArch64 packs stack arguments at
   their natural size and alignment, and an HFA as its floats. */
int64_t pack_callee(int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t,
                    int8_t, int16_t, int32_t, int64_t);
int64_t tri_callee(double, double, double, double, double, double, double, double, Tri, int32_t);
int64_t call_pack(void);
int64_t pack_c(int32_t a, int32_t b, int32_t c, int32_t d, int32_t e, int32_t f, int32_t g, int32_t h,
               int8_t i, int16_t j, int32_t k, int64_t l) {
  return a + b + c + d + e + f + g + h + i + j * 10 + k * 100 + l * 1000;
}
int main(void) {
  Pair p = {1, 2}; Small s = {3, 4}; Big b = {1, 2, 3, 4}; Vec3 v = {1, 2, 2}; Odd o = {5, 6, 7};
  Tri t = {1, 2, 3};
  printf("%lld %lld %lld %.1f %lld %lld %lld %lld\n", (long long)advance_pair(p, 10), (long long)small_sum(s),
         (long long)big_sum(b, 100), vec_len2(v), (long long)odd_sum(o, s),
         (long long)pack_callee(0, 0, 0, 0, 0, 0, 0, 0, 5, 6, 7, 8),
         (long long)tri_callee(0, 0, 0, 0, 0, 0, 0, 0, t, 7), (long long)call_pack());
  return 0;
}
