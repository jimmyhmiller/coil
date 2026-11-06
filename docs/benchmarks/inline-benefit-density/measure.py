from pathlib import Path
import subprocess,os,json,time,statistics,hashlib
r=Path.cwd();out=r/'build/inline-density-comparison';new=r/'build/bin/coil-candidate'
old=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-return-allocation-bootstrap/build/bin/coil-candidate')
caller=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-call-result-projections/build/bin/coil-candidate')
lib=Path('/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/inline-benefit-density')
e=dict(os.environ,COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def run(args,env=e):
 p=subprocess.run([str(a) for a in args],cwd=r,env=env,capture_output=True,text=True)
 if p.returncode:
  (out/'failure.txt').write_text(p.stdout+p.stderr)
  p.check_returncode()
 return p
stamp=run(['python3','scripts/compiler/toolchain_stamp.py','digest']).stdout.strip();assert stamp==(r/'build/bin/coil-candidate.toolchain').read_text().splitlines()[0]
assert '55d4a5ff' in run([new,'--version']).stdout
assert '01f47440' in run([old,'--version']).stdout
results=[]
for fixture in ['verify-graph','emitter']:
 d=out/fixture;d.mkdir(exist_ok=True)
 kernel=d/'kernel.coil' if fixture=='verify-graph' else r/'docs/benchmarks/emission-workload/kernel.coil'
 if fixture=='verify-graph':kernel.write_bytes((lib/'benchmarks/compiler-gaps/verify-graph.coil').read_bytes())
 runner=d/'runner.coil'
 if fixture=='verify-graph':
  src=(lib/'benchmarks/compiler-gaps/verify-graph-runner.coil').read_text();assert '(for [i 0 128]' in src
  runner.write_text(src.replace('(for [i 0 128]','(for [i 0 4096]').replace('(* expected 128)','(* expected 4096)'))
 else:runner.write_bytes((r/'docs/benchmarks/fixed-limit-summary/runner.coil').read_bytes())
 rows=[dict(name=name,compiler=str(c),backend=b,generation=[],cpu=[],wall=[]) for name,c,b in [('before',old,'stogir'),('density',new,'stogir'),('llvm',new,'llvm')]]
 # Four rotating generation samples after excluded warmups for small verifier;
 # one build only for the larger actual emitter, no generation timing claim.
 for turn in range(5 if fixture=='verify-graph' else 1):
  for row in rows[turn%3:]+rows[:turn%3]:
   obj=d/(row['name']+'.o');p=run([row['compiler'],'emit-obj',kernel,'--backend',row['backend'],'-O3','--no-debug','-o',obj])
   (d/(row['name']+'-generation-'+str(turn)+'.txt')).write_text(p.stdout+p.stderr)
   records=[l.split('\t') for l in p.stderr.splitlines() if l.startswith('coil-codegen\t')]
   assert records and all(x[1]==row['backend'] and x[2]=='ir-codegen' for x in records)
   digest=sha(obj)
   if 'object_sha256' in row:assert digest==row['object_sha256']
   row.update(object_sha256=digest,object_bytes=obj.stat().st_size)
   if turn:row['generation'].append(sum(int(x[3]) for x in records)/1e9)
 run([caller,'emit-obj',runner,'--backend','llvm','-O3','--no-debug','-o',d/'runner.o'])
 for row in rows:run(['cc',d/'runner.o',d/(row['name']+'.o'),'-lm','-o',d/row['name']])
 answer=None
 for turn in range(9):
  for row in rows[turn%3:]+rows[:turn%3]:
   t=time.perf_counter();p=subprocess.Popen([str(d/row['name'])],stdout=subprocess.PIPE,stderr=subprocess.PIPE)
   _,status,u=os.wait4(p.pid,0);p.returncode=os.waitstatus_to_exitcode(status);stdout,stderr=p.communicate();wall=time.perf_counter()-t
   assert p.returncode==0,(fixture,row['name'],stdout,stderr)
   if answer is None:answer=stdout
   assert answer==stdout,(fixture,row['name'],stdout,answer)
   (d/(row['name']+'-answers.txt')).write_bytes(stdout+stderr)
   if turn:row['cpu'].append(u.ru_utime+u.ru_stime);row['wall'].append(wall)
 for row in rows:
  row['median_cpu']=statistics.median(row['cpu']);row['median_wall']=statistics.median(row['wall'])
  if row['generation']:row['median_generation']=statistics.median(row['generation'])
  print(fixture,row['name'],row,flush=True)
 result=dict(fixture=fixture,rows=rows,kernel_sha256=sha(kernel),runner_sha256=sha(runner),caller_sha256=sha(d/'runner.o'))
 (d/'results.json').write_text(json.dumps(result,indent=2)+'\n');results.append(result)
assert stamp==run(['python3','scripts/compiler/toolchain_stamp.py','digest']).stdout.strip()
(out/'results.json').write_text(json.dumps(dict(sdk=stamp,qualification='Same-source before/density/LLVM O3 objects, compiler versions/identities fixed; common opaque LLVM O3 caller per workload. Small verifier four rotating IR-generation samples after warmup and eight rotating child CPU/wall samples after warmup. Actual emitter one object build per host, eight rotating child CPU/wall samples after warmup; equal emitted fingerprints every repetition and 75 JIT answers/process. No task builds/tests overlap timing. Not whole-bootstrap acceptance.',compiler_sha256=sha(new),old_compiler_sha256=sha(old),results=results),indent=2)+'\n')
