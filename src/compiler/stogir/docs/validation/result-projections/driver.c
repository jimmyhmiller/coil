#include <stdint.h>
#include <stdio.h>
#include <assert.h>
#ifndef REVERSE
#define REVERSE 0
#endif
#ifndef ONE
#define ONE 0
#endif
typedef struct { uint64_t a,b; } Pair;
static Pair target(uint64_t x) { return (Pair){x^UINT64_C(0x123456789ABCDEF0),x+17}; }
static uint64_t clobber(uint64_t x) { return x*7+31; }
extern uint64_t result_projection(uint64_t,uint64_t,uint64_t,uint64_t*);
int main(void) {
    uint64_t inputs[]={0,1,17,UINT64_C(0x8000000000000000),UINT64_MAX};
    for(unsigned i=0;i<sizeof(inputs)/sizeof(inputs[0]);i++) {
        uint64_t x=inputs[i], canary=UINT64_C(0xAABBCCDDEEFF0011);
        uint64_t out[]={canary,canary,canary,canary};
        Pair p=target(x);
        uint64_t expected=p.a+(ONE?p.a:p.b)+clobber(x);
        for(unsigned j=0;j<36;j++) expected+=x*(j+3);
        assert(result_projection((uintptr_t)target,(uintptr_t)clobber,x,out+1)==expected);
        assert(out[0]==canary && out[3]==canary);
        assert(out[1]==(REVERSE?p.b:p.a));
        assert(out[2]==((REVERSE||ONE)?p.a:p.b));
    }
    puts("result projection AOT:5 answers and canaries passed");
}
