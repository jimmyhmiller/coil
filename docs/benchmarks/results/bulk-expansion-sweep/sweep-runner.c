#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <inttypes.h>
extern uint64_t gap_bulk_64(const void*);
extern uint64_t gap_bulk_72(const void*);
extern uint64_t gap_bulk_80(const void*);
extern uint64_t gap_bulk_96(const void*);
extern uint64_t gap_bulk_128(const void*);
extern uint64_t gap_bulk_136(const void*);
extern uint64_t gap_bulk_256(const void*);
extern uint64_t gap_bulk_512(const void*);
int main(void) {
uint64_t rows[64][64], snapshot[64][64];
for(unsigned i=0;i<64;i++)for(unsigned j=0;j<64;j++)rows[i][j]= i<4 && j==0 ? UINT64_MAX>>(i*16) : (uint64_t)i*65537+j;
memcpy(snapshot,rows,sizeof(rows));
{ uint64_t expected=0,sum=0;unsigned tail=7;
for(unsigned i=0;i<64;i++)assert(gap_bulk_64(rows[i])==rows[i][0]*3+rows[i][tail]);
for(unsigned i=0;i<200000;i++)expected+=rows[i&63][0]*3+rows[i&63][tail];
clock_t start=clock();
for(unsigned i=0;i<200000;i++)sum+=gap_bulk_64(rows[i&63]);
double cpu=(double)(clock()-start)/CLOCKS_PER_SEC;
assert(sum==expected && memcmp(rows,snapshot,sizeof(rows))==0);
printf("64 %.9f %" PRIu64 "\n",cpu,sum);
}
{ uint64_t expected=0,sum=0;unsigned tail=8;
for(unsigned i=0;i<64;i++)assert(gap_bulk_72(rows[i])==rows[i][0]*3+rows[i][tail]);
for(unsigned i=0;i<200000;i++)expected+=rows[i&63][0]*3+rows[i&63][tail];
clock_t start=clock();
for(unsigned i=0;i<200000;i++)sum+=gap_bulk_72(rows[i&63]);
double cpu=(double)(clock()-start)/CLOCKS_PER_SEC;
assert(sum==expected && memcmp(rows,snapshot,sizeof(rows))==0);
printf("72 %.9f %" PRIu64 "\n",cpu,sum);
}
{ uint64_t expected=0,sum=0;unsigned tail=9;
for(unsigned i=0;i<64;i++)assert(gap_bulk_80(rows[i])==rows[i][0]*3+rows[i][tail]);
for(unsigned i=0;i<200000;i++)expected+=rows[i&63][0]*3+rows[i&63][tail];
clock_t start=clock();
for(unsigned i=0;i<200000;i++)sum+=gap_bulk_80(rows[i&63]);
double cpu=(double)(clock()-start)/CLOCKS_PER_SEC;
assert(sum==expected && memcmp(rows,snapshot,sizeof(rows))==0);
printf("80 %.9f %" PRIu64 "\n",cpu,sum);
}
{ uint64_t expected=0,sum=0;unsigned tail=11;
for(unsigned i=0;i<64;i++)assert(gap_bulk_96(rows[i])==rows[i][0]*3+rows[i][tail]);
for(unsigned i=0;i<200000;i++)expected+=rows[i&63][0]*3+rows[i&63][tail];
clock_t start=clock();
for(unsigned i=0;i<200000;i++)sum+=gap_bulk_96(rows[i&63]);
double cpu=(double)(clock()-start)/CLOCKS_PER_SEC;
assert(sum==expected && memcmp(rows,snapshot,sizeof(rows))==0);
printf("96 %.9f %" PRIu64 "\n",cpu,sum);
}
{ uint64_t expected=0,sum=0;unsigned tail=15;
for(unsigned i=0;i<64;i++)assert(gap_bulk_128(rows[i])==rows[i][0]*3+rows[i][tail]);
for(unsigned i=0;i<200000;i++)expected+=rows[i&63][0]*3+rows[i&63][tail];
clock_t start=clock();
for(unsigned i=0;i<200000;i++)sum+=gap_bulk_128(rows[i&63]);
double cpu=(double)(clock()-start)/CLOCKS_PER_SEC;
assert(sum==expected && memcmp(rows,snapshot,sizeof(rows))==0);
printf("128 %.9f %" PRIu64 "\n",cpu,sum);
}
{ uint64_t expected=0,sum=0;unsigned tail=16;
for(unsigned i=0;i<64;i++)assert(gap_bulk_136(rows[i])==rows[i][0]*3+rows[i][tail]);
for(unsigned i=0;i<200000;i++)expected+=rows[i&63][0]*3+rows[i&63][tail];
clock_t start=clock();
for(unsigned i=0;i<200000;i++)sum+=gap_bulk_136(rows[i&63]);
double cpu=(double)(clock()-start)/CLOCKS_PER_SEC;
assert(sum==expected && memcmp(rows,snapshot,sizeof(rows))==0);
printf("136 %.9f %" PRIu64 "\n",cpu,sum);
}
{ uint64_t expected=0,sum=0;unsigned tail=31;
for(unsigned i=0;i<64;i++)assert(gap_bulk_256(rows[i])==rows[i][0]*3+rows[i][tail]);
for(unsigned i=0;i<200000;i++)expected+=rows[i&63][0]*3+rows[i&63][tail];
clock_t start=clock();
for(unsigned i=0;i<200000;i++)sum+=gap_bulk_256(rows[i&63]);
double cpu=(double)(clock()-start)/CLOCKS_PER_SEC;
assert(sum==expected && memcmp(rows,snapshot,sizeof(rows))==0);
printf("256 %.9f %" PRIu64 "\n",cpu,sum);
}
{ uint64_t expected=0,sum=0;unsigned tail=63;
for(unsigned i=0;i<64;i++)assert(gap_bulk_512(rows[i])==rows[i][0]*3+rows[i][tail]);
for(unsigned i=0;i<200000;i++)expected+=rows[i&63][0]*3+rows[i&63][tail];
clock_t start=clock();
for(unsigned i=0;i<200000;i++)sum+=gap_bulk_512(rows[i&63]);
double cpu=(double)(clock()-start)/CLOCKS_PER_SEC;
assert(sum==expected && memcmp(rows,snapshot,sizeof(rows))==0);
printf("512 %.9f %" PRIu64 "\n",cpu,sum);
}
return 0; }
