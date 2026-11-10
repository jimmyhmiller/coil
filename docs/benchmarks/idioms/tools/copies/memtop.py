#!/usr/bin/env python3
# memtop.py BIN COUNTS ROUTINE LO HI [N] : top calling sites (function+offset) of ROUTINE with size class in [LO,HI]
import sys, subprocess, bisect, collections
NAMES=['memmove','memcpy','memset','memcmp','bzero']
syms=[]
for l in subprocess.run(['nm','-n',sys.argv[1]],capture_output=True,text=True).stdout.splitlines():
    p=l.split()
    if len(p)==3 and p[1] in 'tT': syms.append((int(p[0],16),p[2].lstrip('_')))
addrs=[a for a,_ in syms]
r=sys.argv[3]; lo=int(sys.argv[4]); hi=int(sys.argv[5]); n=int(sys.argv[6]) if len(sys.argv)>6 else 30
site=collections.Counter(); fn=collections.Counter(); sizes=collections.defaultdict(collections.Counter)
for l in open(sys.argv[2]):
    f,ra,c,cnt,b=l.split(); ra=int(ra,16); c=int(c)
    if NAMES[int(f)]!=r or not(lo<=c<=hi) or not (addrs[0]<=ra<addrs[-1]+0x100000): continue
    i=bisect.bisect_right(addrs,ra)-1
    k='%s+0x%x @%x'%(syms[i][1],ra-syms[i][0],ra); site[k]+=int(cnt); fn[syms[i][1]]+=int(cnt); sizes[k][c]+=int(cnt)
print('total %.2fM'%(sum(site.values())/1e6))
print('-- by function'); 
for k,v in fn.most_common(n): print('%9.3fM %s'%(v/1e6,k))
print('-- by site')
for k,v in site.most_common(n): print('%9.3fM %s  sizes %s'%(v/1e6,k,' '.join('%d:%.2f'%(s,x/1e6) for s,x in sizes[k].most_common(4))))
