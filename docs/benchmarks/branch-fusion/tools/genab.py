#!/usr/bin/env python3
"""genab.py ROOT N name=candidate ... : alternate candidates emitting ROOT's compiler (Stogir O3); compare IR-codegen time."""
import os,re,subprocess,sys,hashlib
root=sys.argv[1]; n=int(sys.argv[2]); cands=[a.split('=',1) for a in sys.argv[3:]]
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')}
env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
out=os.environ.get('GENAB_OUT',os.path.join(root,'build','genab'))
os.makedirs(out,exist_ok=True)
res={c:[] for c,_ in cands}; digests=set()
for i in range(n):
    for name,c in (cands if i%2==0 else cands[::-1]):
        o=f'{out}/{name}.o'
        p=subprocess.run(['/usr/bin/time','-l',c,'emit-obj','src/compiler/main.coil','--backend','stogir','-O3','--no-debug','-o',o],cwd=root,env=env,capture_output=True,text=True)
        assert p.returncode==0,p.stderr[-2000:]
        gen=sum(int(l.split('\t')[3]) for l in p.stderr.splitlines() if l.startswith('coil-codegen\t'))/1e9
        ins=int(re.search(r'(\d+)\s+instructions retired',p.stderr).group(1))
        digests.add(hashlib.sha256(open(o,'rb').read()).hexdigest())
        res[name].append((gen,ins)); print(name,i,'generation %.3f s, total ins %.2fB'%(gen,ins/1e9),flush=True)
for name,_ in cands:
    r=res[name]; g=sorted(x[0] for x in r)
    print('%-8s min gen %.3f median %.3f ins %.2fB'%(name,g[0],g[len(g)//2],min(x[1] for x in r)/1e9))
print('objects identical' if len(digests)==1 else 'OBJECTS DIFFER %d'%len(digests))
