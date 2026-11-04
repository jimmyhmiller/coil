#include <stdint.h>
#include <assert.h>
extern int64_t gap_zext_quotient(uint32_t);
extern int64_t gap_zext_remainder(uint32_t);
int main(void) {
 const uint32_t boundaries[]={0,1,3,4,5,0x7fffffff,0x80000000,0xfffffffe,0xffffffff};
 for(unsigned i=0;i<sizeof(boundaries)/sizeof(boundaries[0]);i++){
  uint32_t x=boundaries[i];
  assert(gap_zext_quotient(x)==(int64_t)(x/4));
  assert(gap_zext_remainder(x)==(int64_t)(x%4));
 }
 uint64_t sum=0;
 for(uint32_t i=0;i<8000000;i++)sum+=gap_zext_quotient(i)+gap_zext_remainder(i);
 assert(sum==UINT64_C(8000008000000));
 return 0;
}
