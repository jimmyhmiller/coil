#include <stdint.h>
#include <stdio.h>
#include <string.h>
extern uint64_t symbol_words(uint64_t, uint64_t, uint64_t *);
int main(int argc, char **argv) {
    const uint64_t counts[] = {0,1,2,15,16,17,32};
    const uint64_t selectors[] = {0,1,3,15,31,1000,UINT64_MAX};
    unsigned cases=0;
    for (unsigned a=0; a<7; ++a) for (unsigned b=0; b<7; ++b) {
        uint64_t count=counts[a], selector=selectors[b];
        uint64_t out[2]={UINT64_C(0x1122334455667788),UINT64_C(0x8877665544332211)};
        unsigned expected=0;
        for (uint64_t i=0;i<count;++i)
            for (uint64_t j=0;j<16;++j)
                if (i==selector+j) expected=(unsigned)(65+j);
        if (symbol_words(count,selector,count?out:NULL)!=count ||
            out[1]!=UINT64_C(0x8877665544332211)) return 1;
        if (!expected) {
            if (out[0]!=UINT64_C(0x1122334455667788)) return 2;
        } else {
            const unsigned char *p=(const unsigned char *)(uintptr_t)out[0];
            if (p[0]!=expected || p[1]!=0) return 3;
        }
        ++cases;
    }
    if (argc>1 && !strcmp(argv[1],"bench")) {
        uint64_t sum=0;
        for (unsigned i=0;i<4;++i) sum+=symbol_words(1000000,2000000,NULL);
        if (sum!=4000000) return 4;
    }
    printf("symbol-word linked AOT: %u checked cases passed\n",cases);
    return 0;
}
