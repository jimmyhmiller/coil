import sys,collections
for p in sys.argv[1:]:
    b=collections.Counter();n=collections.Counter()
    for line in open(p):
        k,c,by,ra,sym=line.split(None,4); c=int(c);by=int(by)
        if k not in('0','1'): continue
        avg=by/c if c else 0
        bucket='<=16' if avg<=16 else '<=32' if avg<=32 else '<=64' if avg<=64 else '<=128' if avg<=128 else '<=512' if avg<=512 else '>512'
        n[bucket]+=c;b[bucket]+=by
    print(p.rsplit('/',1)[1], 'calls %.1fM bytes %.2fGB'%(sum(n.values())/1e6,sum(b.values())/1e9))
    for k in ['<=16','<=32','<=64','<=128','<=512','>512']: print('  %-6s %7.1fM calls %6.2f GB'%(k,n[k]/1e6,b[k]/1e9))
