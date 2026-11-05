from pathlib import Path
import subprocess,os,json,hashlib,statistics
R=Path.cwd();D=R/'build/bulk-expansion'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
rows=[dict(name='before',driver=str(R.parent/'stogir-iterator-results/build/bin/coil-candidate'),backend='stogir'),dict(name='128',driver=str(R/'build/bin/coil-candidate'),backend='stogir'),dict(name='512',driver=str(R.parent/'stogir-bulk-expansion-512/build/bin/coil-candidate'),backend='stogir'),dict(name='llvm',driver=str(R/'build/bin/coil-candidate'),backend='llvm')]
for row in rows:row.update(generation_s=[],cpu_s={str(n):[] for n in [64,72,80,96,128,136,256,512]},driver_sha256=sha(Path(row['driver'])))
host=dict(start_load=os.getloadavg())
for turn in range(9):
 for row in rows[turn%4:]+rows[:turn%4]:
  obj=D/('sweep-'+row['name']+'.o')
  p=subprocess.run([row['driver'],'emit-obj',str(D/'sweep.coil'),'--backend',row['backend'],'-O3','--no-debug','-o',str(obj)],cwd=R,env=env,capture_output=True,text=True);assert p.returncode==0,(row['name'],p.stderr)
  (D/(row['name']+'-'+str(turn)+'.log')).write_text(p.stdout+p.stderr)
  times=[int(l.split('\t')[3]) for l in p.stderr.splitlines() if l.startswith('coil-codegen\t') and l.split('\t')[2]=='ir-codegen'];assert times
  if turn:row['generation_s'].append(sum(times)/1e9)
  h=sha(obj)
  if 'object_sha256' in row:assert row['object_sha256']==h
  row.update(object_sha256=h,object_bytes=obj.stat().st_size)
for row in rows:
 obj=D/('sweep-'+row['name']+'.o');exe=D/('sweep-'+row['name']);subprocess.run(['cc',str(D/'sweep-runner.o'),str(obj),'-o',str(exe)],check=True)
 (D/('sweep-'+row['name']+'.asm')).write_text(subprocess.check_output(['llvm-objdump','-dr','--no-show-raw-insn',str(obj)],text=True))
for turn in range(33):
 for row in rows[turn%4:]+rows[:turn%4]:
  out=subprocess.check_output([str(D/('sweep-'+row['name']))],text=True)
  lines=out.splitlines();assert len(lines)==8
  for line in lines:
   size,cpu,checksum=line.split();assert int(checksum)==2638869820442506250+(int(size)//8-8)*200000
   if turn:row['cpu_s'][size].append(float(cpu))
for row in rows:
 row['generation_median_s']=statistics.median(row['generation_s']);row['cpu_median_s']={k:statistics.median(v) for k,v in row['cpu_s'].items()}
 print(row['name'],row['generation_median_s'],row['cpu_median_s'],row['object_bytes'],flush=True)
host['end_load']=os.getloadavg()
(D/'sweep-results.json').write_text(json.dumps(dict(qualification='Generic fixed aggregate sizes, identical source and C caller.200k opaque calls per size per sample with independent checksum and preservation checks.8 rotating generation and32 rotating runtime samples after warmup. Diagnostic, not bootstrap acceptance.',fixture_sha256=sha(D/'sweep.coil'),runner_sha256=sha(D/'sweep-runner.o'),host=host,rows=rows),indent=2))
