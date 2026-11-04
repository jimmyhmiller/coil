#include <stdint.h>
#include <assert.h>
extern int64_t gap_inline_switch_selector(const void*);
extern int64_t gap_inline_switch_size(void);
int main(void) {
 _Alignas(64) uint64_t buffer[64]={0};
 const int64_t expected[]={0,1,2,3,4,5,6,7,8,6};
 assert(gap_inline_switch_size()>0 && (uint64_t)gap_inline_switch_size()<=sizeof(buffer));
 for(uint32_t i=0;i<10;i++){buffer[0]=i;assert(gap_inline_switch_selector(buffer)==expected[i]);}
 uint64_t sum=0;
 for(uint32_t i=0;i<5000000;i++){buffer[0]=i%10;sum+=gap_inline_switch_selector(buffer);}
 assert(sum==UINT64_C(21000000));return 0;
}
