import gzip,re,sys,collections
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
    incl=collections.Counter(); stack=[]
    def close(upto):
        while stack and stack[-1][0]>=upto:
            d,c,nm,m,cs=stack.pop(); self=c-cs
            if self<=0: continue
            names={x[2] for x in stack}|{nm}
            if '__ulock_wait' in names: continue
            for n in names: incl[n]+=self
    for d,c,nm,m in lines:
        close(d)
        if stack: stack[-1][4]+=c
        stack.append([d,c,nm,m,0])
    close(-1)
    return incl
S=parse(sys.argv[1]); L=parse(sys.argv[2])
for k in sorted(set(S)&set(L), key=lambda k:-S[k])[:int(sys.argv[3])]:
    if L[k]<int(sys.argv[4]): continue
    print('%6d %6d x%.2f %+6d  %s'%(S[k],L[k],S[k]/L[k],S[k]-L[k],k[:90]))
