/* The C half of tests/cabi/abi.coil: C calling Coil exports and Coil callbacks
   with aggregates by value, exact-size C objects Coil reads by value, unions and
   HFAs, stack-passed arguments in both directions, and symbols bound through
   explicit linker names. Each check function returns 0, or the number of the
   first case that failed. */
#include <stdarg.h>
#include <stdint.h>
#include <stdlib.h>

#ifdef __APPLE__
#define SYM(name) "_" name
#else
#define SYM(name) name
#endif

/* ---- export-c with by-value struct parameters, called from C ---- */
typedef struct { int64_t a, b; } Pair;
typedef struct { int32_t x, y; } Small;
typedef struct { int64_t a, b, c, d; } Big;
typedef struct { double x, y, z; } Vec3;
typedef struct { int32_t a, b, c; } Odd;
typedef struct { float x, y, z; } Tri;
/* An empty struct (a GNU C extension): every C ABI passes and returns nothing for it. */
typedef struct {} Empty;
int64_t advance_pair(Pair, int64_t);
int64_t small_sum(Small);
int64_t big_sum(Big, int64_t);
double vec_len2(Vec3);
int64_t odd_sum(Odd, Small);
/* Past the eight argument registers, Apple AArch64 packs stack arguments at
   their natural size and alignment, and an HFA as its floats. */
int64_t pack_callee(int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t,
                    int8_t, int16_t, int32_t, int64_t);
int64_t tri_callee(double, double, double, double, double, double, double, double, Tri, int32_t);
int64_t call_pack(void);
int64_t around_empty(int64_t, Empty, int64_t);
int64_t call_empty(void);
__int128 wide_mid(int64_t, __int128, int64_t);
int64_t call_wide_mid(void);
__int128 wide_mid_c(int64_t a, __int128 x, int64_t b) { return x + a * 10 + b; }
int64_t empty_c(int64_t a, Empty e, int64_t b) { (void)e; return a * 10 + b; }
int64_t pack_c(int32_t a, int32_t b, int32_t c, int32_t d, int32_t e, int32_t f, int32_t g, int32_t h,
               int8_t i, int16_t j, int32_t k, int64_t l) {
  return a + b + c + d + e + f + g + h + i + j * 10 + k * 100 + l * 1000;
}

int64_t c_calls_exports(void) {
  Pair p = {1, 2}; Small s = {3, 4}; Big b = {1, 2, 3, 4}; Vec3 v = {1, 2, 2}; Odd o = {5, 6, 7};
  Tri t = {1, 2, 3};
  Empty e;
  if (advance_pair(p, 10) != 13) return 1;
  if (small_sum(s) != 7) return 2;
  if (big_sum(b, 100) != 110) return 3;
  if (vec_len2(v) != 9.0) return 4;
  if (odd_sum(o, s) != 11) return 5;
  if (pack_callee(0, 0, 0, 0, 0, 0, 0, 0, 5, 6, 7, 8) != 8765) return 6;
  if (tri_callee(0, 0, 0, 0, 0, 0, 0, 0, t, 7) != 7321) return 7;
  if (call_pack() != 4321) return 8;
  if (around_empty(3, e, 4) != 304) return 9;
  if (call_empty() != 56) return 10;
  if (wide_mid(1, ((__int128)7 << 64) | 9, 2) != (((__int128)7 << 64) | 21)) return 11;
  if (call_wide_mid() != 7043) return 12;
  return 0;
}

/* ---- unions and HFAs of one to four members ---- */
union Floats { float scalar; float lanes[3]; };
struct Nested { union Floats values; float tail; };
typedef struct { float a; } F1;
typedef struct { double a, b; } D2;
typedef struct { float a, b, c, d; } F4;
extern union Floats coil_union_echo(union Floats);
extern struct Nested coil_union_nested(struct Nested);
extern F1 coil_hfa1(F1);
extern D2 coil_hfa2(D2);
extern F4 coil_hfa4(F4);

int64_t c_union_hfa_check(void) {
  union Floats input = { .lanes = { 1.5f, 2.5f, 3.5f } };
  union Floats result = coil_union_echo(input);
  if (result.lanes[0] != 1.5f || result.lanes[1] != 2.5f || result.lanes[2] != 3.5f) return 1;
  struct Nested nested = { input, 4.5f };
  struct Nested output = coil_union_nested(nested);
  if (output.values.lanes[0] != 1.5f || output.values.lanes[1] != 2.5f
      || output.values.lanes[2] != 3.5f || output.tail != 4.5f) return 2;
  F1 one = coil_hfa1((F1){2.5f});
  if (one.a != 5.0f) return 3;
  D2 two = coil_hfa2((D2){1.25, 2.5});
  if (two.a != 2.5 || two.b != 1.25) return 4;
  F4 four = coil_hfa4((F4){1, 2, 3, 4});
  if (four.a != 4 || four.b != 3 || four.c != 2 || four.d != 1) return 5;
  return 0;
}

/* ---- Coil callbacks taking aggregates by value ---- */
typedef struct { int64_t tag; int64_t value; } Target;
typedef struct { uint8_t a, b, c, d; } S4;
typedef struct { int32_t a, b; } S8;
typedef struct { double a, b, c, d; } S32;

int64_t invoke_callbacks(int64_t (*s4_callback)(S4), int64_t (*s8_callback)(S8),
                         int64_t (*target_callback)(Target), int64_t (*s32_callback)(S32)) {
  S4 s4 = {1, 2, 3, 4};
  S8 s8 = {11, 22};
  Target target = {7, 42};
  S32 s32 = {1, 2, 3, 4};
  return s4_callback(s4) + s8_callback(s8) + target_callback(target) + s32_callback(s32);
}

/* A C function returning an aggregate built from a Coil callback's result. */
Pair c_pair_from(Pair (*make)(int64_t), int64_t n) {
  Pair p = make(n);
  Pair q = { p.b, p.a };
  return q;
}

/* ---- exact-size allocations: a read past the object is an ASan report ---- */
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

/* ---- explicit linker names ---- */
long alias_operation(long value) __asm__(SYM("alias.function$1"));
long alias_operation(long value) { return value + 1; }
long call(long value) { return value; }
long alias_data __asm__(SYM("alias.data$1")) = 20;
extern long coil_named_data;
long *native_named_address(void) { return &coil_named_data; }
long native_named_increment(void) { return ++coil_named_data; }

/* ---- narrow scalars, variadic promotions, padded and vector aggregates, one
        function under two C symbols, a reference result ---- */
/* Apple AArch64 and x86-64 callers extend a narrow argument to 32 bits, and a
   callee its narrow result: these read the value at 32 bits and trust it. */
int64_t s8_echo(int8_t x) { return x; }
int64_t u8_echo(uint8_t x) { return x; }
int64_t s16_echo(int16_t x) { return x; }
int64_t bool_echo(_Bool x) { return x ? 7 : 3; }
int8_t coil_s8_negate(int8_t);
int8_t coil_pub8(void);
int64_t coil_pub8_via_extern(void);

/* `...` arguments arrive promoted: int for narrower integers and bool, double for
   float. KINDS names each one: i an int, d a double. */
int64_t c_varargs(const char *kinds, ...) {
  va_list ap;
  int64_t acc = 0;
  va_start(ap, kinds);
  for (const char *k = kinds; *k; ++k) {
    int64_t v = *k == 'd' ? (int64_t)(va_arg(ap, double) * 2) : (int64_t)va_arg(ap, int);
    acc = acc * 1000 + v + 500;
  }
  va_end(ap);
  return acc;
}

/* Alignment padding keeps an aggregate from being homogeneous (no HFA), and a
   second eightbyte of padding only is not passed at all (System V). */
typedef struct __attribute__((aligned(16))) { double x; } Pad16;
typedef struct __attribute__((aligned(32))) { double x, y; } Pad32;
typedef struct __attribute__((aligned(16))) { double x; } PadIn;
typedef struct { PadIn i; double y; } PadNest;
Pad16 coil_pad16(Pad16, int64_t);
Pad32 coil_pad32(Pad32);
PadNest coil_pad_nest(PadNest);
/* Short vectors: AAPCS64 passes up to four of one size in vector registers (an
   HVA); System V passes an 8-byte one as SSE. */
typedef float F32x4 __attribute__((vector_size(16)));
typedef float F32x2 __attribute__((vector_size(8)));
typedef struct { F32x4 a, b; } Hva2;
typedef struct { F32x2 a; } Hva1;
Hva2 coil_hva_swap(Hva2);
int64_t coil_hva_first(Hva1, int64_t);
/* One function exported under two symbols shares its state; so does one
   exported through a by-value thunk. */
int64_t coil_bump_one(void);
int64_t coil_bump_two(void);
Pair coil_swap_one(Pair);
Pair coil_swap_two(Pair);
static int32_t ref_target = 42;
int32_t *c_ref_result(void) { return &ref_target; }

int64_t c_scalar_check(void) {
  if (coil_s8_negate(14) != -14) return 1;
  if (coil_pub8() != -14) return 2;
  if (coil_pub8_via_extern() != 42) return 3;
  Pad16 p16 = coil_pad16((Pad16){40}, 1);
  if (p16.x != 42) return 4;
  Pad32 p32 = coil_pad32((Pad32){1, 2});
  if (p32.x != 2 || p32.y != 1) return 5;
  PadNest pn = coil_pad_nest((PadNest){{5}, 6});
  if (pn.i.x != 6 || pn.y != 5) return 6;
  Hva2 h = coil_hva_swap((Hva2){{1, 2, 3, 4}, {5, 6, 7, 8}});
  if (h.a[0] != 5 || h.a[3] != 8 || h.b[0] != 1 || h.b[3] != 4) return 7;
  if (coil_hva_first((Hva1){{3, 4}}, 9) != 309) return 8;
  int64_t first = coil_bump_one();
  if (coil_bump_two() != first + 1 || coil_bump_one() != first + 2) return 9;
  Pair q = coil_swap_two((Pair){1, 2});
  Pair r = coil_swap_one((Pair){3, 4});
  if (q.a != 2 || q.b != 1 || r.a != 4 || r.b != 3) return 10;
  return 0;
}
