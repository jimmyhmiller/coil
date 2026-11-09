"""smod.py S.gz L.gz : self samples grouped by module of the deepest non-utility coil frame."""
import gzip,re,sys,collections
UTIL=re.compile(r'^(coil\.(alloc|core|arraylist|hashmap|str|scratch|amap|avec|slice|mem|math|option|result|iter|fmt|io|hashset|box|vec|sort|bits|cstr|string|arena|os|sys|ptr|ops|cmp|primitive)\b|inherent\$|[A-Z][A-Za-z]*\$|coil\.[a-z]+\.[A-Z])')
def module(n):
    if n.startswith('stogir.a64.'): return '.'.join(n.split('.')[:3])
    if n.startswith('stogir.') or n.startswith('tpde.'): return '.'.join(n.split('.')[:2])
    if n.startswith('coil.compiler.'): return '.'.join(n.split('.')[:3])
    return '.'.join(n.split('.')[:2])
def parse(p):
    lines=[]; on=False
    for line in gzip.open(p,'rt',errors='replace'):
        if line.startswith('Call graph:'): on=True; continue
        if not on: continue
        if line.startswith('Total number in stack'): break
        m=re.match(r'^([ +!:|]*)(\d+) (.+?)  \(in ([^)]+)\)', line)
        if m: lines.append((len(m.group(1)), int(m.group(2)), m.group(3).strip(), m.group(4)))
        else:
            m2=re.match(r'^([ +!:|]*)(\d+) (\S+)', line)
            if m2: lines.append((len(m2.group(1)), int(m2.group(2)), m2.group(3), '?'))
    mod=collections.Counter(); fn=collections.Counter(); leafext=collections.Counter(); stack=[]; tot=0
    def close(upto):
        nonlocal tot
        while stack and stack[-1][0]>=upto:
            d,c,nm,m,cs=stack.pop(); self=c-cs
            if self<=0: continue
            frames=[(x[2],x[3]) for x in stack]+[(nm,m)]
            if any(n in('__ulock_wait',) for n,_ in frames): continue
            tot+=self
            tgt=None
            for n,mm in reversed(frames):
                if mm=='coil' and not UTIL.match(n): tgt=n; break
            mod[module(tgt) if tgt else '?']+=self
            fn[tgt or '?']+=self
            if m!='coil': leafext[(module(tgt) if tgt else '?', nm)]+=self
    for d,c,nm,m in lines:
        close(d)
        if stack: stack[-1][4]+=c
        stack.append([d,c,nm,m,0])
    close(-1)
    return mod,fn,tot,leafext
S,sf,st,sx=parse(sys.argv[1]); L,lf,lt,lx=parse(sys.argv[2])
print('total S %d L %d x%.3f gap %d; target gap at 1.10x = %d'%(st,lt,st/lt,st-lt,int(lt*0.10)))
cum=0
for k in sorted(set(S)|set(L), key=lambda k:-(S[k]-L[k])):
    if max(S[k],L[k])<40: continue
    cum+=S[k]-L[k]
    print('%5d %5d %5d x%.2f cum %5d  %s'%(S[k]-L[k],S[k],L[k],S[k]/max(L[k],1),cum,k))
print('--- per function (non-utility target), parser/comptime/ast/resolve')
for pre in ('coil.compiler.parser','coil.compiler.comptime','coil.compiler.ast','coil.compiler.resolve'):
    ks=[k for k in set(sf)|set(lf) if k.startswith(pre+'.')]
    for k in sorted(ks,key=lambda k:-(sf[k]-lf[k]))[:9]:
        print('%5d %5d %5d  %s'%(sf[k]-lf[k],sf[k],lf[k],k))
    print('  ext leaves S:',sorted(((v,n) for (m,n),v in sx.items() if m==pre),reverse=True)[:8])
    print('  ext leaves L:',sorted(((v,n) for (m,n),v in lx.items() if m==pre),reverse=True)[:8])
