#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#if MODE == 12
struct Result { uint64_t a; };
#else
struct Result { uint64_t a, b; };
#endif
extern struct Result callee_return_values(uint64_t, uint64_t, uint64_t *);
int main(void) {
    const uint64_t xs[] = {0,1,3,8,UINT64_C(0x8000000000000000),UINT64_MAX};
    const uint64_t ys[] = {0,7,UINT64_C(0x8000000000000000),UINT64_MAX};
    for (unsigned i=0; i<6; i++) for (unsigned j=0; j<4; j++) {
        uint64_t x=xs[i], y=ys[j], trips=x&7;
        uint64_t lo = MODE==16 ? 1 : MODE==17 ? (uint64_t)(uintptr_t)&llabs :
                      MODE==1||MODE==13 ? x==0 ? x+3 : y :
                      MODE==2 ? x+trips*y : x;
        uint64_t hi = MODE==12 ? 0 : MODE==14 ? x : MODE==15 ? 7 :
                      MODE==1||MODE==13 ? x==0 ? y^7 : x :
                      MODE==2 ? trips==0 ? y : trips-1 : y;
        uint64_t words[] = {UINT64_C(0xAABBCCDDEEFF0011),222,UINT64_C(0x2233445566778899)};
        struct Result actual=callee_return_values(x,y,words+1);
        if (actual.a != lo || words[1] != (MODE==9 ? x : 222) ||
            words[0]!=UINT64_C(0xAABBCCDDEEFF0011) || words[2]!=UINT64_C(0x2233445566778899)) return 1;
#if MODE != 12
        if (actual.b != hi) return 2;
#endif
    }
    puts("ok");
    return 0;
}
