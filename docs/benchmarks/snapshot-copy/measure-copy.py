from pathlib import Path
import subprocess,os,json,statistics,time,hashlib
r=Path.cwd();d=r/'build/snapshot-copy/comparison';d.mkdir(parents=True,exist_ok=True)
old=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-runtime-bulk/build/bin/coil-candidate')
new=r/'build/bin/coil-candidate'
env=dict(os.environ,COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
rows=[dict(name=n,compiler=str(c),backend=b,generation_s=[],cpu_s=[]) for n,c,b in [('before',old,'stogir'),('candidate',new,'stogir'),('llvm',new,'llvm')]]
def host():
 p=subprocess.run(['ps','-Ao','pid=,ppid=,pcpu=,comm='],capture_output=True,text=True,check=True)
 processes=[]
 for line in p.stdout.splitlines():
  fields=line.split(None,3)
  if len(fields)==4:
   processes.append(dict(pid=int(fields[0]),parent_pid=int(fields[1]),cpu_percent=float(fields[2]),name=Path(fields[3]).name))
 return dict(load=os.getloadavg(),processes=sorted(processes,key=lambda x:x['cpu_percent'],reverse=True)[:8])
observations=[]
started=time.time()
for turn in range(5):
 for row in rows[turn%3:]+rows[:turn%3]:
  observations.append(dict(phase='generation',turn=turn,name=row['name'],host=host()))
  obj=d/(row['name']+'.o');p=subprocess.run([row['compiler'],'emit-obj','benchmarks/runtime-bulk/graph-copy.coil','--backend',row['backend'],'-O3','--no-debug','-o',str(obj)],env=env,capture_output=True,text=True,check=True)
  records=[l.split('\t') for l in p.stderr.splitlines() if l.startswith('coil-codegen\t')];assert records and all(x[1]==row['backend'] and x[2]=='ir-codegen' for x in records)
  digest=sha(obj)
  if 'object_sha256' in row:assert digest==row['object_sha256']
  row.update(object_sha256=digest,object_bytes=obj.stat().st_size)
  if turn:row['generation_s'].append(sum(int(x[3]) for x in records)/1e9)
for row in rows:
 subprocess.run(['cc','-O3','benchmarks/runtime-bulk/driver.c',str(d/(row['name']+'.o')),'-o',str(d/row['name'])],check=True)
 (d/(row['name']+'.asm')).write_text(subprocess.check_output(['llvm-objdump','-dr','--no-show-raw-insn',str(d/(row['name']+'.o'))],text=True))
for turn in range(17):
 for row in rows[turn%3:]+rows[:turn%3]:
  observations.append(dict(phase='cpu',turn=turn,name=row['name'],host=host()))
  p=subprocess.run([str(d/row['name'])],capture_output=True,text=True,check=True);value=json.loads(p.stdout);assert value['extent']==416 and value['cases']==4096 and value['calls']==1000000
  if turn:row['cpu_s'].append(value['cpu_s'])
for row in rows:
 row['median_generation_s']=statistics.median(row['generation_s']);row['median_cpu_s']=statistics.median(row['cpu_s']);print(row['name'],row['median_generation_s'],row['median_cpu_s'],row['object_bytes'],flush=True)
(d/'results.json').write_text(json.dumps(dict(qualification='Four rotating generation samples and16rotating kernel CPU samples after warmups; same frozen source and cc-O3 opaque caller, 4096 independent memmove overlap cases plus zero-fill canaries per run. Serial/O3/no-debug/caches off, no competing builds/tests from this task; external process snapshots retained. Not bootstrap.',observations=observations,started_unix=started,finished_unix=time.time(),source_sha256=sha(r/'benchmarks/runtime-bulk/graph-copy.coil'),driver_sha256=sha(r/'benchmarks/runtime-bulk/driver.c'),rows=rows),indent=2))
