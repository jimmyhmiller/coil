from pathlib import Path
import subprocess,os,json,time,statistics,hashlib
root=Path.cwd();out=root/'build/fixed-limit-comparison';candidate=root/'build/bin/coil-candidate'
caller=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-call-result-projections/build/bin/coil-candidate')
env=dict(os.environ,COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def run(args):return subprocess.run([str(a) for a in args],check=True,capture_output=True,text=True,env=env)
stamp=run(['python3','scripts/compiler/toolchain_stamp.py','digest']).stdout.strip()
assert stamp==(root/'build/bin/coil-candidate.toolchain').read_text().splitlines()[0]
assert 'c95dade7' in run([candidate,'--version']).stdout
rows=[dict(name='before',backend='stogir',generation=[]),dict(name='summary',backend='stogir',generation=[]),dict(name='llvm',backend='llvm',generation=[])]
(out/'before.o').write_bytes(Path('/tmp/emission-kernel-stogir.o').read_bytes())
for turn in range(5):
 for row in rows[1:][turn%2:]+rows[1:][:turn%2]:
  p=run([candidate,'emit-obj','docs/benchmarks/emission-workload/kernel.coil','--backend',row['backend'],'-O3','--no-debug','-o',out/(row['name']+'.o')])
  (out/(row['name']+'-generation-'+str(turn)+'.txt')).write_text(p.stdout+p.stderr)
  records=[l.split('\t') for l in p.stderr.splitlines() if l.startswith('coil-codegen\t')]
  assert records and all(r[1]==row['backend'] and r[2]=='ir-codegen' for r in records)
  digest=sha(out/(row['name']+'.o'))
  if 'object_sha256' in row:assert digest==row['object_sha256']
  row['object_sha256']=digest
  if turn:row['generation'].append(sum(int(r[3]) for r in records)/1e9)
run([caller,'emit-obj',out/'runner.coil','--backend','llvm','-O3','--no-debug','-o',out/'runner.o'])
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
 if row['generation']:row['median_generation']=statistics.median(row['generation'])
 print(row['name'],row,flush=True)
assert stamp==run(['python3','scripts/compiler/toolchain_stamp.py','digest']).stdout.strip()
result=dict(qualification='Actual CIR emitter, three graphs 32/128/512 operations, 513 emissions each. Same common opaque LLVM caller, emitted text fingerprints equal across all hosts and all repetitions; 75 JIT oracle answers per process. Before kernel object from 6cff505d unchanged source checkpoint; summary/LLVM objects same modified source/c95dade7 driver. Four rotating codegen samples after warmup for modified kernel only; eight rotating child CPU/wall samples after warmup. Common CIR/setup/JIT/fingerprint overhead included. Not whole-bootstrap acceptance.',sdk=stamp,rows=rows,compiler_sha256=sha(candidate),caller_sha256=sha(out/'runner.o'),kernel_source_sha256=sha('docs/benchmarks/emission-workload/kernel.coil'),runner_source_sha256=sha(out/'runner.coil'))
(out/'results.json').write_text(json.dumps(result,indent=2)+'\n')
