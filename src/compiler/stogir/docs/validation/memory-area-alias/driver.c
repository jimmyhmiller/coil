#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#ifndef MODE
#define MODE 0
#endif
#ifndef INDEXED
#define INDEXED 0
#endif
#if INDEXED
extern uint64_t indexed_alias(uint64_t*,uint64_t,uint64_t,uint64_t);
#else
extern uint64_t area_alias(uint64_t*,uint64_t*,uint64_t);
#endif
int main(void) {
    uint64_t inputs[]={0,1,UINT64_C(0x8000000000000000),UINT64_MAX};
    const uint64_t changed=UINT64_C(0x123456789ABCDEF0),canary=UINT64_C(0xAABBCCDDEEFF0011);
    for(unsigned k=0;k<4;k++) {
        uint64_t x=inputs[k];
#if INDEXED
        for(unsigned i=8;i<=16;i+=8) for(unsigned j=8;j<=16;j+=8) {
            uint64_t words[8]={0},expected[8]={0};
            words[0]=words[7]=expected[0]=expected[7]=canary;
            unsigned target=1+i/8;
            expected[target]=x;
            if(MODE==3) {
                uint32_t partial=UINT32_C(0x9ABCDEF0);
                memcpy((unsigned char*)&expected[target]+4,&partial,4);
            } else expected[1+(MODE==1?j:i+8)/8]=changed;
            uint64_t actual=indexed_alias(words+1,i,j,x);
            assert(actual==(x^expected[target]));
            assert(memcmp(words,expected,sizeof(words))==0);
        }
#else
        for(unsigned shared=0;shared<2;shared++) {
            uint64_t words[8]={0},expected[8]={0};
            words[0]=words[7]=expected[0]=expected[7]=canary;
            expected[2]=x;
            if(MODE==2) expected[shared?2:3]=changed;
            uint64_t actual=area_alias(words+2,words+(shared?2:3),x);
            assert(actual==(x^expected[2]));
            assert(memcmp(words,expected,sizeof(words))==0);
        }
#endif
    }
    puts("alias AOT exact values, side effects and canaries: PASS");
}
