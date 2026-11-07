// Interpose memmove/memcpy/memset; histogram by caller (return address) .
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <dlfcn.h>
#define SLOTS (1<<16)
typedef struct { uint64_t ra, calls, bytes; int kind; } Slot;
static Slot table[SLOTS];
static void note(uint64_t ra, size_t n, int kind) {
  uint64_t h = (ra * 0x9E3779B97F4A7C15ull) >> 48;
  for (;;) {
    Slot *s = &table[h & (SLOTS-1)];
    uint64_t cur = __atomic_load_n(&s->ra, __ATOMIC_RELAXED);
    if (cur == ra) { __atomic_fetch_add(&s->calls,1,__ATOMIC_RELAXED); __atomic_fetch_add(&s->bytes,n,__ATOMIC_RELAXED); return; }
    if (cur == 0) { uint64_t z = 0; if (__atomic_compare_exchange_n(&s->ra,&z,ra,0,__ATOMIC_RELAXED,__ATOMIC_RELAXED)) { s->kind = kind; continue; } else continue; }
    h++;
  }
}
static void *my_memmove(void *d, const void *s, size_t n) { note((uint64_t)__builtin_return_address(0), n, 0); return memmove(d,s,n); }
static void *my_memcpy(void *d, const void *s, size_t n) { note((uint64_t)__builtin_return_address(0), n, 1); return memmove(d,s,n); }
static void *my_memset(void *d, int c, size_t n) { note((uint64_t)__builtin_return_address(0), n, 2); return memset(d,c,n); }
static void my_bzero(void *d, size_t n) { note((uint64_t)__builtin_return_address(0), n, 3); memset(d,0,n); }
#define DYLD_INTERPOSE(_replacement,_replacee) \
   __attribute__((used)) static struct{ const void* replacement; const void* replacee; } _interpose_##_replacee \
            __attribute__ ((section ("__DATA,__interpose"))) = { (const void*)(unsigned long)&_replacement, (const void*)(unsigned long)&_replacee };
DYLD_INTERPOSE(my_memmove, memmove)
DYLD_INTERPOSE(my_memcpy, memcpy)
DYLD_INTERPOSE(my_memset, memset)
DYLD_INTERPOSE(my_bzero, bzero)
static void dump(void) {
  const char *out = getenv("MEMPROF_OUT"); if (!out) return;
  char path[4096]; snprintf(path, sizeof path, "%s.%d", out, (int)getpid());
  FILE *f = fopen(path, "w"); if (!f) return;
  for (int i = 0; i < SLOTS; i++) if (table[i].ra) {
    Dl_info info; const char *sym = "?";
    if (dladdr((void*)table[i].ra, &info) && info.dli_sname) sym = info.dli_sname;
    fprintf(f, "%d %llu %llu %llx %s\n", table[i].kind, (unsigned long long)table[i].calls, (unsigned long long)table[i].bytes, (unsigned long long)table[i].ra, sym);
  }
  fclose(f);
}
__attribute__((constructor)) static void init(void) { atexit(dump); }
