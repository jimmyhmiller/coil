from pathlib import Path
import subprocess,os,time,json,statistics,hashlib
r=Path.cwd();d=r/'build/validator-dispatch/comparison';d.mkdir(parents=True,exist_ok=True);e=dict(os.environ,COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
compiler=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-snapshot-copy-fusion/build/bin/coil-candidate')
baseline=Path('/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/runtime-bulk-policy')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def run(a,env=e,cwd=r):return subprocess.run(list(map(str,a)),cwd=cwd,env=env,capture_output=True,text=True,check=True)
assert '7944bdfa' in run([compiler,'--version']).stdout
sources={str(p.relative_to(r)):sha(p) for p in sorted((r/'src/stogir').rglob('*.coil'))}
rows=[dict(name=name,compiler=str(compiler),backend=backend,project=str(project),compiler_sha256=sha(compiler),generation_s=[],cpu_s=[])
      for name,project,backend in [('before',baseline,'stogir'),('candidate',r,'stogir'),('llvm-before',baseline,'llvm'),('llvm',r,'llvm')]]
for turn in range(5):
 for row in rows[turn%4:]+rows[:turn%4]:
  obj=d/(row['name']+'.o');p=run([row['compiler'],'emit-obj','benchmarks/compiler-gaps/verify-graph.coil','--backend',row['backend'],'-O3','--no-debug','-o',obj],cwd=Path(row['project']))
  records=[l.split('\t') for l in p.stderr.splitlines() if l.startswith('coil-codegen\t')]
  assert records and all(x[1]==row['backend'] and x[2]=='ir-codegen' for x in records)
  digest=sha(obj)
  if 'object_sha256' in row:assert digest==row['object_sha256']
  row.update(object_sha256=digest,object_bytes=obj.stat().st_size)
  if turn:row['generation_s'].append(sum(int(x[3]) for x in records)/1e9)
run([compiler,'emit-obj','benchmarks/compiler-gaps/verify-graph-runner.coil','--backend','llvm','-O3','--no-debug','-o',d/'runner.o'])
for row in rows:
 name=row['name'];run(['cc',d/'runner.o',d/(name+'.o'),'-lm','-o',d/name]);(d/(name+'.asm')).write_text(run(['llvm-objdump','-dr','--no-show-raw-insn',d/(name+'.o')]).stdout)
for turn in range(17):
 for row in rows[turn%4:]+rows[:turn%4]:
  p=subprocess.Popen([str(d/row['name'])],stdout=subprocess.PIPE,stderr=subprocess.PIPE);_,status,u=os.wait4(p.pid,0);p.returncode=os.waitstatus_to_exitcode(status);out,err=p.communicate();assert p.returncode==0,(row['name'],out,err)
  if turn:row['cpu_s'].append(u.ru_utime+u.ru_stime)
for row in rows:
 row['median_generation_s']=statistics.median(row['generation_s']);row['median_cpu_s']=statistics.median(row['cpu_s']);print(row['name'],row['median_generation_s'],row['median_cpu_s'],row['object_bytes'],flush=True)
assert sources=={str(p.relative_to(r)):sha(p) for p in sorted((r/'src/stogir').rglob('*.coil'))}
(d/'results.json').write_text(json.dumps(dict(qualification='Actual verifier, one compiler executable, frozen before/after verifier sources, same LLVM O3 caller, 2048-node opaque graph, three invalid cases, 128 valid results. Four alternating generation samples and16 rotating child-CPU runtime samples after excluded warmups. Established IR-codegen timing boundary, serial/caches off. Not a bootstrap result.',sources=sources,fixture_sha256=sha(r/'benchmarks/compiler-gaps/verify-graph.coil'),caller_sha256=sha(d/'runner.o'),rows=rows),indent=2))
