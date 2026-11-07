import sys,collections,re
def load(p):
    c=collections.Counter();m=collections.Counter()
    for line in open(p):
        if line.startswith('image'): continue
        parts=line.split()
        if len(parts)<5: continue
        pc,lib,sym,lr,lsym=parts[:5]
        if lib!='coil': sym='['+lib+']'+sym
        c[sym]+=1
        mod=sym.rsplit('.',1)[0] if '.' in sym and lib=='coil' else sym
        # strip generic instantiations
        mod=re.sub(r'<.*','',mod)
        m[mod]+=1
    return c,m
a,am=load(sys.argv[1]);b,bm=load(sys.argv[2])
ta=sum(a.values());tb=sum(b.values())
print('samples',ta,tb,ta/tb)
for title,x,y in [('module',am,bm),('function',a,b)]:
    print('==',title)
    keys=sorted(set(x)|set(y),key=lambda k:-(x[k]-y[k]))
    for k in keys[:int(sys.argv[3])]:
        print('%-80s %6d %6d %+6d'%(k[:80],x[k],y[k],x[k]-y[k]))
