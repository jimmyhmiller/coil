#!/usr/bin/env python3
"""genenv.py ROOT CANDIDATE N 'name|K=V K=V' ... : alternate one candidate over
COIL_STOGIR_* settings emitting ROOT's compiler; report generation seconds."""
import os,subprocess,sys,tempfile
root,cand,n=sys.argv[1],sys.argv[2],int(sys.argv[3])
cfgs=[]
for a in sys.argv[4:]:
    name,_,rest=a.partition('|')
    settings=dict(x.split('=',1) for x in rest.split())
    assert all(k.startswith('COIL_STOGIR_') for k in settings), a
    cfgs.append((name,settings))
base={k:v for k,v in os.environ.items() if not k.startswith('COIL_')}
base.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
res={c:[] for c,_ in cfgs}; out=tempfile.mkdtemp()
for i in range(n):
    for name,settings in (cfgs if i%2==0 else cfgs[::-1]):
        env=dict(base); env.update(settings)
        p=subprocess.run([cand,'emit-obj','src/compiler/main.coil','--backend','stogir','-O3','--no-debug','-o',f'{out}/{name}.o'],cwd=root,env=env,capture_output=True,text=True)
        assert p.returncode==0,p.stderr[-2000:]
        g=sum(int(l.split('\t')[3]) for l in p.stderr.splitlines() if l.startswith('coil-codegen\t'))/1e9
        res[name].append(g); print(name,i,'%.3f'%g,flush=True)
b=min(res[cfgs[0][0]])
for name,_ in cfgs:
    r=sorted(res[name]); print('%-16s min %.3f s median %.3f s  (%+.1f%% vs %s min)'%(name,r[0],r[len(r)//2],100*(r[0]/b-1),cfgs[0][0]))
