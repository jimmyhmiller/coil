"""calls.py DIS COUNTS OUT.json : per function entry count, own dyn instrs, dynamic call edges, roles."""
import re, sys, struct, json, collections
dis, cp, outp = sys.argv[1:4]
data = open(cp,'rb').read(); n = struct.unpack('<Q', data[:8])[0]; counts = struct.unpack('<%dQ'%n, data[8:8+8*n])
fns=[]; fn=None; ins=[]
for line in open(dis):
    s=line.strip()
    m = re.match(r'^[0-9a-f]+ <(.+)>:$', s)
    if m:
        if fn: fns.append((fn,ins))
        fn=m.group(1).lstrip('_'); ins=[]; continue
    m = re.match(r'\s*[0-9a-f]+:\s+(\S+)\s*(.*)', line)
    if m: ins.append((m.group(1), m.group(2).split(';')[0].strip()))
if fn: fns.append((fn,ins))
def counter_at(ins,i):
    op,a=ins[i]
    if op in ('mov','movz') and a.startswith('x16, #') and i+5<len(ins) and ins[i+1][0]=='movk' and ins[i+2][0]=='movk' and ins[i+2][1].startswith('x16, #0x5000, lsl #32') and ins[i+3]==('ldr','x17, [x16]'):
        lo=int(a.split('#')[1].split()[0],0); mid=int(ins[i+1][1].split('#')[1].split(',')[0],0)
        return (lo|(mid<<16))//8
    return None
# copies
copies=collections.Counter()
for f,ins in fns:
    i=0
    while i<len(ins):
        k=counter_at(ins,i)
        if k is not None: copies[k]+=1; i+=6
        else: i+=1
out={}
for f,ins in fns:
    cur=0.0; i=0; entry=None; own=0.0; calls=collections.Counter(); ind=0.0; rets=0.0; tails=collections.Counter(); blocks=0.0
    while i<len(ins):
        k=counter_at(ins,i)
        if k is not None:
            cur = (counts[k] if k<n else 0)/copies[k]
            if entry is None: entry=cur
            blocks+=cur; i+=6; continue
        op,a=ins[i]
        if op=='udf' or op.startswith('.') or op=='<unknown>': i+=1; continue
        own+=cur
        if op=='bl':
            m=re.search(r'<(.+?)(\+0x[0-9a-f]+)?>',a)
            if m: calls[m.group(1).lstrip('_')]+=cur
        elif op=='blr': ind+=cur
        elif op=='ret': rets+=cur
        elif op=='b':
            m=re.search(r'<(.+?)(\+0x[0-9a-f]+)?>',a)
            if m and not m.group(2) and m.group(1).lstrip('_')!=f: tails[m.group(1).lstrip('_')]+=cur
        if op in ('b','br','ret'): cur=0.0
        i+=1
    out[f]=dict(entry=entry or 0, own=own, calls=dict(calls), ind=ind, rets=rets, tails=dict(tails), static=len(ins), blocks=blocks)
json.dump(out, open(outp,'w'))
tot=sum(v['own'] for v in out.values()); c=sum(sum(v['calls'].values()) for v in out.values()); i_=sum(v['ind'] for v in out.values()); t=sum(sum(v['tails'].values()) for v in out.values()); r=sum(v['rets'] for v in out.values())
print('instr %.1fB direct calls %.2fB indirect %.2fB tail %.2fB rets %.2fB blocks %.1fB fns %d'%(tot/1e9,c/1e9,i_/1e9,t/1e9,r/1e9,sum(v['blocks'] for v in out.values())/1e9,len(out)))
