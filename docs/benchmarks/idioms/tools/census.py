"""census.py DIS COUNTS : dynamic counts of wasteful idioms (linear instruction stream within counted blocks)."""
import re, sys, struct, collections
dis, cp = sys.argv[1:3]
data=open(cp,'rb').read(); n=struct.unpack('<Q',data[:8])[0]; counts=struct.unpack('<%dQ'%n,data[8:8+8*n])
fns=[]; fn=None; ins=[]
for line in open(dis):
    s=line.strip()
    m=re.match(r'^[0-9a-f]+ <(.+)>:$',s)
    if m:
        if fn: fns.append((fn,ins))
        fn=m.group(1).lstrip('_'); ins=[]; continue
    m=re.match(r'\s*[0-9a-f]+:\s+(\S+)\s*(.*)',line)
    if m: ins.append((m.group(1),m.group(2).split(';')[0].strip()))
if fn: fns.append((fn,ins))
def counter_at(ins,i):
    op,a=ins[i]
    if op in('mov','movz') and a.startswith('x16, #') and i+5<len(ins) and ins[i+1][0]=='movk' and ins[i+2][0]=='movk' and ins[i+2][1].startswith('x16, #0x5000, lsl #32') and ins[i+3]==('ldr','x17, [x16]'):
        lo=int(a.split('#')[1].split()[0],0); mid=int(ins[i+1][1].split('#')[1].split(',')[0],0); return (lo|(mid<<16))//8
    return None
copies=collections.Counter()
for f,ins in fns:
    i=0
    while i<len(ins):
        k=counter_at(ins,i)
        if k is not None: copies[k]+=1; i+=6
        else: i+=1
C=collections.Counter(); total=0.0
argreg=re.compile(r'^[xw][0-7]$')
for f,ins in fns:
    # build weighted stream: list of (op,args,count,blockid)
    st=[]; cur=0.0; i=0; b=0
    while i<len(ins):
        k=counter_at(ins,i)
        if k is not None: cur=(counts[k] if k<n else 0)/copies[k]; b+=1; i+=6; continue
        op,a=ins[i]
        if op!='udf' and not op.startswith('.'): st.append((op,a,cur,b))
        if op in('b','br','ret'): cur=0.0
        i+=1
    for j,(op,a,c,b) in enumerate(st):
        if c<=0: continue
        total+=c
        r=[x.strip() for x in a.split(',')]
        nx=st[j+1] if j+1<len(st) else ('','',0,0)
        pv=st[j-1] if j>0 else ('','',0,0)
        if op=='asr' and a.endswith('#63'): C['sdiv/srem pow2 unit (asr #63)']+=c
        if op=='sdiv': C['sdiv real']+=c
        if op=='udiv': C['udiv']+=c
        if op in('sxtw','sxtb','sxth'): C['sign-extend (sxt*)']+=c
        if op in('uxtw','uxtb','uxth') or (op=='ubfx' and '#0,' in a) or (op=='and' and a.endswith('#0xffffffff')): C['zero-extend (uxt*/ubfx 0/and ffffffff)']+=c
        if op in('ubfx','sbfx') and '#0,' not in a: C['bitfield other']+=c
        if op=='cset': 
            C['cset']+=c
            if nx[0] in('cbz','cbnz','tbz','tbnz') and nx[1].split(',')[0][1:]==r[0][1:]: C['  cset;cb(n)z same reg']+=c
            if nx[0]=='cmp' and nx[1].split(',')[0][1:]==r[0][1:]: C['  cset;cmp same reg']+=c
        if op in('cbz','cbnz','tbz','tbnz'): C['cbz/cbnz/tbz/tbnz']+=c
        if op=='movk': C['movk']+=c
        if op in('mov','movz','movn') and '#' in a:
            C['mov imm']+=c
            if r[0] in('x16','x17','w16','w17'): C['  mov imm to scratch x16/x17']+=c
            if a.endswith('#0x0, lsl #48') or a.endswith('#0x0'): C['  mov #0']+=c
        if op=='mul': 
            C['mul']+=c
            if pv[0] in('mov','movk','movz') and pv[1].split(',')[0] in('x17','x16','w17','w16'): C['  mul by materialized const']+=c
        if op=='cmp' and a.endswith('#0x0') and nx[0].startswith('b.'): C['cmp #0 ; b.cc']+=c
        if op=='cmp' and nx[0].startswith('b.'): C['cmp ; b.cc']+=c
        if op=='cmp' and nx[0]=='cset': C['cmp ; cset']+=c
        if op=='cmp' and '#' in a and nx[0]=='b.eq':
            # chain: next block begins with cmp same reg
            nn=st[j+2] if j+2<len(st) else ('','',0,0)
            if nn[0]=='cmp' and nn[1].split(',')[0]==r[0] and '#' in nn[1]: C['eq-chain link (cmp r,#a; b.eq; cmp r,#b)']+=c
        if (op=='mov' and re.match(r'[xw]\d+, [xw]\d+$',a)) or (op=='orr' and a.endswith('zr') and len(r)==3):
            C['regmove']+=c
            d=r[0]; s=r[1]
            if argreg.match(s) and not argreg.match(d): C['  move from x0-7 to other']+=c
            elif argreg.match(d) and not argreg.match(s): C['  move other to x0-7']+=c
            elif argreg.match(d) and argreg.match(s): C['  move among x0-7']+=c
            else: C['  move among non-arg']+=c
            if nx[0] in('b',) or (nx[0]=='mov' and (st[j+2][0] if j+2<len(st) else '')=='b'): C['  move right before b']+=c
        if op in('stp','str') and 'zr' in a.split('[')[0]: C['store zero']+=c
        if op in('ldr','ldp','ldrb','ldrh','ldrsw','ldrsb','ldrsh','ldur') : C['loads']+=c*(2 if op=='ldp' else 1)
        if op in('str','stp','strb','strh','stur'): C['stores']+=c*(2 if op=='stp' else 1)
        if op=='nop': C['nop']+=c
        if op=='b': C['b uncond']+=c
        if op in('add','sub') and re.search(r'#0x[0-9a-f]+$',a) and r[0]==r[1]: C['add/sub imm in place']+=c
        if op=='add' and nx[0].startswith('ld') and ('['+r[0]+']' in nx[1] or '['+r[0]+',' in nx[1]): C['add feeding next load addr']+=c
        if op=='lsl' and pv[0]=='asr' and pv[1].split(',')[2:]==r[2:]: C['asr k; lsl k']+=c
print('total counted %.1fB'%(total/1e9))
for k,v in C.items(): print('%-48s %7.2fB'%(k,v/1e9))
