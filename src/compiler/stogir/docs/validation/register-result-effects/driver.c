#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#ifndef MODE
#define MODE 3
#endif
#ifndef HFA
#define HFA 0
#endif
typedef struct { uint64_t first,second; } Pair;
typedef struct { double a,b,c,d; } Quad;
static Pair readonly_pair(uint64_t*p,uint64_t s) {uint64_t x=*p;return(Pair){x^s,x+s};}
static Pair constant_pair(uint64_t*p,uint64_t s) {(void)p;return(Pair){s,s+17};}
static Pair writing_pair(uint64_t*p,uint64_t s) {*p+=s;return(Pair){*p,*p^s};}
static Quad readonly_quad(uint64_t*p,uint64_t s) {double v=(double)(*p&1023);return(Quad){v+0.25,v-1.5,(double)s+2.75,v+3.125};}
static uint64_t bits(double v) {uint64_t r;memcpy(&r,&v,8);return r;}
static void word(unsigned char*p,unsigned offset,uint64_t v) {memcpy(p+offset,&v,8);}
extern uint64_t register_effect(uint64_t*,uint64_t*,uint64_t,uint64_t);
int main(void) {
    const uint64_t inputs[]={0,1,UINT64_C(0x8000000000000000),UINT64_MAX};
    const uint64_t canary=UINT64_C(0xAABBCCDDEEFF0011);
    for(unsigned k=0;k<4;k++) for(unsigned shared=0;shared<2;shared++) {
        uint64_t x=inputs[k],data[10]={0},a,b,c=0,d=0;
        unsigned char expected[80]={0};
        data[0]=data[9]=canary;word(expected,0,canary);word(expected,72,canary);
#if HFA
        uint64_t input=x;Quad q=readonly_quad(&input,17);
        a=bits(q.a);b=bits(q.b);c=bits(q.c);d=bits(q.d);
        uint64_t target=(uintptr_t)readonly_quad;
#else
        Pair pair=MODE==5?(Pair){x+17,(x+17)^17}:MODE==8?(Pair){17,34}:(Pair){x^17,x+17};
        a=pair.first;b=pair.second;
        uint64_t target=MODE==5?(uintptr_t)writing_pair:MODE==8?(uintptr_t)constant_pair:(uintptr_t)readonly_pair;
#endif
        unsigned query_offset=MODE==9?32:8;
        word(expected,query_offset,MODE==5?x+17:x);
        int capture_offset=MODE==2?16:MODE==3?12:MODE==9?8:-1;
        if(capture_offset>=0) {
            word(expected,(unsigned)capture_offset,a);word(expected,(unsigned)capture_offset+8,b);
            if(HFA) {word(expected,(unsigned)capture_offset+16,c);word(expected,(unsigned)capture_offset+24,d);}
        }
        uint64_t query;memcpy(&query,expected+query_offset,8);
        uint64_t actual=register_effect(data+1,data+(shared?1:5),x,target);
        assert(actual==((x^query)+a+b+c+d));
        assert(memcmp(data,expected,80)==0);
    }
    puts("register effects AOT:8 exact values/capture/side-effect/canary answers passed");
}
