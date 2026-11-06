from pathlib import Path
import subprocess,os,json,time,statistics,hashlib
root=Path.cwd();out=root/'build/reusable-limits-comparison';candidate=root/'build/bin/coil-candidate'
old=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-fixed-limit-summary/build/bin/coil-candidate')
caller=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-call-result-projections/build/bin/coil-candidate')
env=dict(os.environ,COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def run(args):return subprocess.run([str(a) for a in args],check=True,capture_output=True,text=True,env=env)
stamp=run(['python3','scripts/compiler/toolchain_stamp.py','digest']).stdout.strip()
assert stamp==(root/'build/bin/coil-candidate.toolchain').read_text().splitlines()[0]
assert '37d5c0a4' in run([candidate,'--version']).stdout
assert 'c95dade7' in run([old,'--version']).stdout
rows=[dict(name='before',backend='stogir'),dict(name='reuse',backend='stogir'),dict(name='llvm',backend='llvm')]
(out/'before.o').write_bytes((old.parents[1]/'fixed-limit-comparison/summary.o').read_bytes())
generation={name:[] for name in ('old','reuse')};object_identity=None
for turn in range(5):
 order=[('old',old),('reuse',candidate)]
 if turn%2:order.reverse()
 for label,compiler in order:
  obj=out/(label+'-generated.o')
  p=run([compiler,'emit-obj','docs/benchmarks/emission-workload/kernel.coil','--backend','stogir','-O3','--no-debug','-o',obj])
  (out/(label+'-generation-'+str(turn)+'.txt')).write_text(p.stdout+p.stderr)
  records=[l.split('\t') for l in p.stderr.splitlines() if l.startswith('coil-codegen\t')]
  assert records and all(r[1]=='stogir' and r[2]=='ir-codegen' for r in records)
  digest=sha(obj)
  if object_identity is None:object_identity=digest
  assert object_identity==digest,(label,digest,object_identity)
  if turn:generation[label].append(sum(int(r[3]) for r in records)/1e9)
(out/'reuse.o').write_bytes((out/'reuse-generated.o').read_bytes())
p=run([candidate,'emit-obj','docs/benchmarks/emission-workload/kernel.coil','--backend','llvm','-O3','--no-debug','-o',out/'llvm.o'])
(out/'llvm-generation.txt').write_text(p.stdout+p.stderr)
runner=root/'docs/benchmarks/fixed-limit-summary/runner.coil'
run([caller,'emit-obj',runner,'--backend','llvm','-O3','--no-debug','-o',out/'runner.o'])
for row in rows:
 run(['cc',out/'runner.o',out/(row['name']+'.o'),'-lm','-o',out/row['name']])
 row.update(cpu=[],wall=[],object_bytes=(out/(row['name']+'.o')).stat().st_size,object_sha256=sha(out/(row['name']+'.o')))
answer=None
for turn in range(9):
 for row in rows[turn%3:]+rows[:turn%3]:
  t=time.perf_counter();p=subprocess.Popen([str(out/row['name'])],stdout=subprocess.PIPE,stderr=subprocess.PIPE)
  _,status,u=os.wait4(p.pid,0);p.returncode=os.waitstatus_to_exitcode(status);stdout,stderr=p.communicate();wall=time.perf_counter()-t
  assert p.returncode==0,(row['name'],stdout,stderr)
  if answer is None:answer=stdout
  assert stdout==answer,(row['name'],stdout,answer)
  (out/(row['name']+'-answers.txt')).write_bytes(stdout+stderr)
  if turn:row['cpu'].append(u.ru_utime+u.ru_stime);row['wall'].append(wall)
for row in rows:
 row['median_cpu']=statistics.median(row['cpu']);row['median_wall']=statistics.median(row['wall'])
 print(row['name'],row,flush=True)
print('generation',generation,flush=True)
assert stamp==run(['python3','scripts/compiler/toolchain_stamp.py','digest']).stdout.strip()
result=dict(qualification='Actual CIR emitter, three graphs 32/128/512 operations, 513 emissions each. Common opaque LLVM caller, emitted text fingerprints equal across all hosts/repetitions; 75 JIT oracle answers/process. Before kernel object c95dade7 source checkpoint; reuse/LLVM objects same modified source/37d5c0a4 driver. Four alternating old/new Stogir IR-generation samples after excluded warmups on identical modified source; complete kernel object bytes must match across generators. Eight rotating child CPU/wall samples after warmup. Includes common setup/JIT/fingerprint cost. Not bootstrap acceptance. No task builds overlap timing.',sdk=stamp,rows=rows,generation=generation,median_generation={k:statistics.median(v) for k,v in generation.items()},compiler_sha256=sha(candidate),old_compiler_sha256=sha(old),caller_sha256=sha(out/'runner.o'),kernel_source_sha256=sha('docs/benchmarks/emission-workload/kernel.coil'),runner_source_sha256=sha(runner))
(out/'results.json').write_text(json.dumps(result,indent=2)+'\n')
