#include <stdio.h>
#include <stdint.h>
typedef struct { int64_t a, b; } Pair;
typedef struct { int32_t x, y; } Small;
typedef struct { int64_t a, b, c, d; } Big;
typedef struct { double x, y, z; } Vec3;
typedef struct { int32_t a, b, c; } Odd;
int64_t advance_pair(Pair, int64_t); int64_t small_sum(Small); int64_t big_sum(Big, int64_t);
double vec_len2(Vec3); int64_t odd_sum(Odd, Small);
int main(void) {
  Pair p = {1, 2}; Small s = {3, 4}; Big b = {1, 2, 3, 4}; Vec3 v = {1, 2, 2}; Odd o = {5, 6, 7};
  printf("%lld %lld %lld %.1f %lld\n", (long long)advance_pair(p, 10), (long long)small_sum(s),
         (long long)big_sum(b, 100), vec_len2(v), (long long)odd_sum(o, s));
  return 0;
}
