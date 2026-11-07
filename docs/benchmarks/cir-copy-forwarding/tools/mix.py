import re,sys,collections
def load(p):
    funcs=0;c=collections.Counter();pat=collections.Counter();n=0
    for l in open(p):
        if l.endswith('>:\n'): funcs+=1; continue
        m=re.match(r'\s*[0-9a-f]+:\s+(\S+)\s*(.*)',l)
        if not m: continue
        op,args=m.groups(); n+=1; c[op]+=1
        if re.search(r'\[sp',args) and op.startswith(('ldr','str','ldp','stp','ldur','stur')): pat['sp-mem']+=1
        if re.search(r'\[x29',args): pat['fp-mem']+=1
        if op in('bl','blr'): pat['calls']+=1
        if op=='orr' and 'zr' in args: pat['orr-zr-move']+=1
        if op=='mov': pat['mov']+=1
        if op=='ubfx' and args.endswith('#0, #8'): pat['ubfx8']+=1
        if op=='movz' and 'lsl #48' in args and '#0x0,' in args: pat['movz0-48']+=1
        if op=='add' and ', sp, #' in args: pat['add-sp']+=1
    return funcs,n,c,pat
S=load(sys.argv[1]);L=load(sys.argv[2])
print('funcs',S[0],L[0],'insns',S[1],L[1], 'ratio %.2f'%(S[1]/L[1]))
for k in sorted(set(S[3])|set(L[3])): print('%-14s %8d %8d'%(k,S[3][k],L[3][k]))
ops=sorted(set(S[2])|set(L[2]),key=lambda k:-(S[2][k]-L[2][k]))
print('largest excess opcodes (stogir-llvm):')
for k in ops[:30]: print('%-8s %8d %8d %+8d'%(k,S[2][k],L[2][k],S[2][k]-L[2][k]))
