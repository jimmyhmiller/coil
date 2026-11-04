from pathlib import Path
import os,subprocess,resource,time,json,statistics,hashlib
w=Path.cwd();old=w.parent/'analysis-zero-init';d=w/'build/pressure-domain';compiler=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/bin/coil-candidate')
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1')
rows=[]
for backend in ['stogir','llvm','tpde']:
 for variant,root,source in [('before',old,old/'build/pressure-domain-benchmark.coil'),('after',w,w/'benchmarks/allocator-fixed-uses.coil')]:
  exe=d/(variant+'-'+backend)
  p=subprocess.run([compiler,'build',source,'--backend',backend,'-O3','--no-debug','-o',exe],cwd=root,env=env,capture_output=True,text=True)
  (d/(exe.name+'-build.log')).write_text(p.stdout+p.stderr);assert p.returncode==0,p.stderr[-3000:]
  print('built',exe.name,flush=True)
  for case,args in [('dense',['--large','--state']),('sparse',['--large','--state','--sparse','--fragmented'])]:
   rows.append(dict(backend=backend,variant=variant,case=case,args=args,cpu_s=[]))
for turn in range(17):
 for row in rows if turn%2==0 else list(reversed(rows)):
  before=resource.getrusage(resource.RUSAGE_CHILDREN);p=subprocess.run([d/(row['variant']+'-'+row['backend']),*row['args']],capture_output=True);after=resource.getrusage(resource.RUSAGE_CHILDREN);assert p.returncode==0,(row,p.stderr)
  if turn:row['cpu_s'].append(after.ru_utime+after.ru_stime-before.ru_utime-before.ru_stime)
for row in rows:row['median_cpu_s']=statistics.median(row['cpu_s'])
(d/'results.json').write_text(json.dumps(dict(compiler=str(compiler),rows=rows),indent=2))
for r in rows:print(r['backend'],r['variant'],r['case'],r['median_cpu_s'],flush=True)
