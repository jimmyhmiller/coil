#!/usr/bin/env python3
"""ab.py ROOT N name=host ... : alternate native hosts emitting ROOT's compiler with Stogir O3."""
import os,re,subprocess,sys,hashlib
root=sys.argv[1]; n=int(sys.argv[2]); hosts=[a.split('=',1) for a in sys.argv[3:]]
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')}
env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1')
out=os.environ.get('AB_OUT',os.path.join(root,'build','ab'))
os.makedirs(out,exist_ok=True)
res={h:[] for h,_ in hosts}; digests=set()
for i in range(n):
    for name,host in (hosts if i%2==0 else hosts[::-1]):
        o=f'{out}/{name}.o'
        p=subprocess.run(['/usr/bin/time','-l',host,'emit-obj','src/compiler/main.coil','--backend','stogir','-O3','--no-debug','-o',o],cwd=root,env=env,capture_output=True,text=True)
        assert p.returncode==0,p.stderr[-2000:]
        ins=int(re.search(r'(\d+)\s+instructions retired',p.stderr).group(1)); cyc=int(re.search(r'(\d+)\s+cycles elapsed',p.stderr).group(1))
        wall=float(re.search(r'([\d.]+) real',p.stderr).group(1))
        digests.add(hashlib.sha256(open(o,'rb').read()).hexdigest())
        res[name].append((cyc,ins,wall)); print(name,i,'cycles %.2fB ins %.2fB wall %.2f'%(cyc/1e9,ins/1e9,wall),flush=True)
for name,_ in hosts:
    r=res[name]; print('%-10s min cycles %.2fB median %.2fB ins %.2fB min wall %.2f'%(name,min(x[0] for x in r)/1e9,sorted(x[0] for x in r)[len(r)//2]/1e9,min(x[1] for x in r)/1e9,min(x[2] for x in r)))
print('objects identical' if len(digests)==1 else 'OBJECTS DIFFER %d'%len(digests))
