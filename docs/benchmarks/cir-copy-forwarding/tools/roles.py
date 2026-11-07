import re,sys,collections,glob
dis,pcf=sys.argv[1],sys.argv[2]
ins={};order=[];fstart={};cur=None
for l in open(dis):
    m=re.match(r'^([0-9a-f]+) <(.+)>:$',l.strip())
    if m: cur=int(m.group(1),16); continue
    m=re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)',l)
    if m:
        a=int(m.group(1),16); ins[a]=(m.group(2),m.group(3)); order.append(a); fstart[a]=cur
idx={a:i for i,a in enumerate(order)}
CS=re.compile(r'\b[xd](19|2[0-8]|29|30|8|9|1[0-5])\b')
def role(a):
    op,args=ins[a]; i=idx[a]
    if op in('stp','str') and '[sp' in args and CS.search(args.split(',')[0]) and a-fstart[a] < 4*24: return 'prologue-save'
    if op=='sub' and args.startswith('sp, sp') and a-fstart[a]<8: return 'prologue-save'
    if op=='mov' and args=='x29, sp': return 'prologue-save'
    # epilogue: ldr/ldp of callee-saved from sp followed (within 16) by ret
    if op in('ldp','ldr') and '[sp' in args and CS.search(args.split(',')[0]):
        for k in range(i+1,min(i+16,len(order))):
            if ins[order[k]][0]=='ret': return 'epilogue-restore'
            if ins[order[k]][0] not in('ldp','ldr','add','mov'): break
    if op=='add' and args.startswith('sp, sp'): return 'epilogue-restore'
    if op=='ret': return 'ret'
    if op in('ldr','ldp','ldur') and ('[sp' in args or '[x29' in args): return 'reload'
    if op in('str','stp','stur') and ('[sp' in args or '[x29' in args): return 'spill-or-stack-store'
    if op=='b':
        t=re.match(r'0x([0-9a-f]+)',args)
        if t and int(t.group(1),16) in ins and ins[int(t.group(1),16)][0]=='b': return 'b-to-b'
        return 'b'
    if op=='lsr' and args.endswith('#0'): return 'switch-key'
    if op=='cmp' and args.startswith('x16,'): return 'switch-cmp'
    if op=='movz' and '#0x0,' in args: return 'movz-zero'
    if op in('orr','mov') and ('zr' in args or re.match(r'[xw]\d+, [xw]\d+$',args)): return 'reg-move'
    if op in('ubfx','uxtb','uxth','sxtw','uxtw'): return 'extend'
    if op.startswith('b.') or op in('cbz','cbnz','tbz','tbnz'): return 'condbr'
    if op in('cmp','cmn','tst'): return 'cmp'
    if op in('bl','blr'): return 'call'
    if op.startswith('ld'): return 'load-other'
    if op.startswith('st'): return 'store-other'
    return 'alu-other'
slide=None;c=collections.Counter();tot=0
for l in open(pcf):
    if l.startswith('image'):
        p=l.split()
        if p[1].endswith('/bin/coil'): slide=int(p[2],16)
        continue
    tot+=1
    pc=int(l.split()[0],16)-slide
    if pc in ins: c[role(pc)]+=1
    else: c['[outside: '+l.split()[1]+']' if len(l.split())>1 else '[outside]']+=1
print('total',tot)
for k,v in sorted(c.items(),key=lambda kv:-kv[1])[:30]: print('  %-30s %6d %5.1f%%'%(k,v,100*v/tot))
