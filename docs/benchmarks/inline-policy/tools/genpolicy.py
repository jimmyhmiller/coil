#!/usr/bin/env python3
"""genpolicy.py ROOT CANDIDATE N name=POLICY ... : alternate one candidate over
inline policies (COIL_STOGIR_INLINE; empty = default) emitting ROOT's compiler,
and report IR-codegen (generation) seconds, min and median per policy."""
import os,subprocess,sys,tempfile
root,cand,n=sys.argv[1],sys.argv[2],int(sys.argv[3]); cfgs=[a.split('=',1) for a in sys.argv[4:]]
base={k:v for k,v in os.environ.items() if not k.startswith('COIL_')}
base.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
res={c:[] for c,_ in cfgs}; out=tempfile.mkdtemp()
for i in range(n):
    for name,policy in (cfgs if i%2==0 else cfgs[::-1]):
        env=dict(base)
        if policy: env['COIL_STOGIR_INLINE']=policy
        p=subprocess.run([cand,'emit-obj','src/compiler/main.coil','--backend','stogir','-O3','--no-debug','-o',f'{out}/{name}.o'],cwd=root,env=env,capture_output=True,text=True)
        assert p.returncode==0,p.stderr[-2000:]
        g=sum(int(l.split('\t')[3]) for l in p.stderr.splitlines() if l.startswith('coil-codegen\t'))/1e9
        res[name].append(g); print(name,i,'%.3f'%g,flush=True)
b=min(res[cfgs[0][0]])
for name,_ in cfgs:
    r=sorted(res[name]); print('%-12s min %.3f s median %.3f s  (%+.1f%% vs %s min)'%(name,r[0],r[len(r)//2],100*(r[0]/b-1),cfgs[0][0]))
