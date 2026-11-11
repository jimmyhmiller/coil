#include <stdint.h>
#include <limits.h>
#include <stddef.h>
extern int64_t sccp_forward_predicate(int64_t, int64_t *);
int main(void) {
    const int64_t cases[] = {INT64_MIN,-257,-1,0,1,256,INT64_MAX};
    for (unsigned i=0; i<sizeof(cases)/sizeof(cases[0]); ++i) {
        int64_t memory=5;
        int64_t result=sccp_forward_predicate(cases[i],&memory);
        if (result!=(cases[i]!=0 ? 37 : 777)) return 1;
        if (memory!=(cases[i]!=0 ? 6 : 5)) return 2;
    }
    return sccp_forward_predicate(0,NULL)==777 ? 0 : 3;
}
