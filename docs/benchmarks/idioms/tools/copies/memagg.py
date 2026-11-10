#!/usr/bin/env python3
# memagg.py BIN COUNTS [BIN2 COUNTS2] : libc memory routine calls by routine, size class and calling function
import sys, subprocess, bisect, collections
NAMES=['memmove','memcpy','memset','memcmp','bzero']
def load(binp, cnt):
    syms=[]
    for l in subprocess.run(['nm','-n',binp],capture_output=True,text=True).stdout.splitlines():
        p=l.split()
        if len(p)==3 and p[1] in 'tT': syms.append((int(p[0],16),p[2].lstrip('_')))
    addrs=[a for a,_ in syms]
    lo,hi=addrs[0],addrs[-1]+0x100000
    rows=[]
    for l in open(cnt):
        f,ra,c,n,b=l.split(); ra=int(ra,16)
        if not (lo<=ra<hi): fn='<other image>'
        else: fn=syms[bisect.bisect_right(addrs,ra)-1][1]
        rows.append((NAMES[int(f)],fn,int(c),int(n),int(b),ra))
    return rows
def sizelabel(c): return str(c) if c<=2048 else '<=2^%d'%(c-2048)
def summarize(rows):
    tot=collections.Counter(); byt=collections.Counter(); sz=collections.defaultdict(collections.Counter); fn=collections.defaultdict(collections.Counter)
    for r,f,c,n,b,ra in rows:
        if f=='<other image>': continue
        tot[r]+=n; byt[r]+=b; sz[r][c]+=n; fn[r][f]+=n
    return tot,byt,sz,fn
A=summarize(load(sys.argv[1],sys.argv[2]))
B=summarize(load(sys.argv[3],sys.argv[4])) if len(sys.argv)>4 else None
for r in NAMES:
    print('== %s: calls %.1fM bytes %.1fM'%(r,A[0][r]/1e6,A[1][r]/1e6)+('   | other: calls %.1fM bytes %.1fM'%(B[0][r]/1e6,B[1][r]/1e6) if B else ''))
    keys=sorted(set(A[2][r])|(set(B[2][r]) if B else set()))
    print('  sizes (M calls): '+'  '.join('%s:%.2f%s'%(sizelabel(k),A[2][r][k]/1e6,('/%.2f'%(B[2][r][k]/1e6) if B else '')) for k in keys if A[2][r][k]>2e5 or (B and B[2][r][k]>2e5)))
    fns=set(A[3][r])|(set(B[3][r]) if B else set())
    d=sorted(fns,key=lambda f:-(A[3][r][f]-(B[3][r][f] if B else 0)))
    for f in d[:25]: print('  %9.2fM %9.2fM  %s'%(A[3][r][f]/1e6,(B[3][r][f]/1e6 if B else 0),f))
    if B:
        print('  ...most negative'); 
        for f in d[-5:]: print('  %9.2fM %9.2fM  %s'%(A[3][r][f]/1e6,B[3][r][f]/1e6,f))
