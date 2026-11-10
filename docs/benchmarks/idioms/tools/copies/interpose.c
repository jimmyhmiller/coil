// Counts calls from the main executable to memmove/memcpy/memset/memcmp/bzero by caller and size.
#include <string.h>
#include <strings.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <mach-o/dyld.h>
#include <mach-o/loader.h>
#define N (1u<<21)
typedef struct { uint64_t key; uint64_t count; uint64_t bytes; } E;
static E *tab; static intptr_t slide;
static inline unsigned cls(size_t n){ if(n<=2048) return (unsigned)n; unsigned b=64-__builtin_clzll(n-1); return 2048+b; }
static inline void rec(unsigned f, void*ra, size_t n){
  if(!tab) return;
  uint64_t key=((uint64_t)ra<<16) | (f<<12) | cls(n);
  uint64_t h=(key*0x9E3779B97F4A7C15ull)>>43;
  for(;;){ E*e=&tab[h&(N-1)]; if(e->key==key){e->count++;e->bytes+=n;return;} if(!e->key){e->key=key;e->count=1;e->bytes=n;return;} h++; }
}
static void dump(void){
  const char*o=getenv("MEMCOUNT_OUT"); if(!o||!tab) return; FILE*f=fopen(o,"w"); if(!f) return;
  E*t=tab; tab=0;
  for(unsigned i=0;i<N;i++) if(t[i].key){ uint64_t k=t[i].key; fprintf(f,"%u %llx %u %llu %llu\n",(unsigned)((k>>12)&15),(unsigned long long)((k>>16)-slide),(unsigned)(k&4095),t[i].count,t[i].bytes);} fclose(f);
}
__attribute__((constructor)) static void init(void){ for(uint32_t i=0;i<_dyld_image_count();i++){ if(_dyld_get_image_header(i)->filetype==MH_EXECUTE){ slide=_dyld_get_image_vmaddr_slide(i); break; } } E*t=calloc(N,sizeof(E)); atexit(dump); tab=t; }
void* my_memmove(void*d,const void*s,size_t n){ rec(0,__builtin_return_address(0),n); return memmove(d,s,n);}
void* my_memcpy(void*d,const void*s,size_t n){ rec(1,__builtin_return_address(0),n); return memcpy(d,s,n);}
void* my_memset(void*d,int c,size_t n){ rec(2,__builtin_return_address(0),n); return memset(d,c,n);}
int my_memcmp(const void*a,const void*b,size_t n){ rec(3,__builtin_return_address(0),n); return memcmp(a,b,n);}
void my_bzero(void*d,size_t n){ rec(4,__builtin_return_address(0),n); bzero(d,n);}
void my_exit(int c){ dump(); _exit(c);}
#define I(r,o) __attribute__((used)) static struct{const void*a;const void*b;} _i_##o __attribute__((section("__DATA,__interpose")))={(const void*)r,(const void*)o};
I(my_memmove,memmove) I(my_memcpy,memcpy) I(my_memset,memset) I(my_memcmp,memcmp) I(my_bzero,bzero) I(my_exit,_exit)
