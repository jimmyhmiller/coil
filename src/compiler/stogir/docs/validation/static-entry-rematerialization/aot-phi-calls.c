#include <stdint.h>
#include <assert.h>
static uint64_t read_one(const uint64_t *p) { return *p; }
static uint64_t read_nine(const uint64_t *a,const uint64_t *b,const uint64_t *c,
 const uint64_t *d,const uint64_t *e,const uint64_t *f,const uint64_t *g,
 const uint64_t *h,const uint64_t *i) { return *a + UINT64_C(2) * *i; }
extern uint64_t static_phi_calls(uint64_t (*)(const uint64_t *),
 uint64_t (*)(const uint64_t *,const uint64_t *,const uint64_t *,const uint64_t *,
 const uint64_t *,const uint64_t *,const uint64_t *,const uint64_t *,const uint64_t *), uint64_t);
int main(void) {
 const uint64_t inputs[]={0,1,13,16,1000,UINT64_MAX,UINT64_C(0xfffffffffffffff0)};
 for (unsigned i=0;i<sizeof(inputs)/sizeof(inputs[0]);i++) {
  uint64_t x=inputs[i],a=x+13,b=x+26;
  uint64_t expected=(x==13?a:b)+a+2*b+b;
  assert(static_phi_calls(read_one,read_nine,x)==expected);
 }
 return 0;
}
