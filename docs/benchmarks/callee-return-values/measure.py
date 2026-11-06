from pathlib import Path
import subprocess,os,json,statistics,hashlib
r=Path.cwd();out=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-callee-return-values/build/callee-return-comparison');out.mkdir(parents=True,exist_ok=True)
e=dict(os.environ,COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
old=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-bitcast-chains/build/bin/coil-candidate')
area=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-memory-area-alias/build/bin/coil-candidate')
new=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-callee-return-values/build/bin/coil-candidate')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def run(args,env=e):return subprocess.run(list(map(str,args)),cwd=r,env=env,capture_output=True,text=True,check=True)
assert '575c03d4' in run([new,'--version']).stdout
assert '36b5cff6' in run([old,'--version']).stdout
sources={str(p.relative_to(r)):sha(p) for p in sorted((r/'src/stogir').rglob('*.coil'))}
results=[]
for fixture in ['verify-graph','prepare-graph']:
 d=out/fixture;d.mkdir(exist_ok=True)
 rows=[dict(name=n,compiler=str(c),backend=b,compiler_sha256=sha(c),generation_s=[],cpu_s=[]) for n,c,b in [('before',old,'stogir'),('candidate',new,'stogir'),('llvm',new,'llvm')]]
 for turn in range(5):
  for row in rows[turn%len(rows):]+rows[:turn%len(rows)]:
   obj=d/(row['name']+'.o');p=run([row['compiler'],'emit-obj','benchmarks/compiler-gaps/'+fixture+'.coil','--backend',row['backend'],'-O3','--no-debug','-o',obj])
   (d/(row['name']+'-generation-'+str(turn)+'.txt')).write_text(p.stdout+p.stderr)
   records=[l.split('\t') for l in p.stderr.splitlines() if l.startswith('coil-codegen\t')]
   assert records and all(x[1]==row['backend'] and x[2]=='ir-codegen' for x in records)
   digest=sha(obj)
   if 'object_sha256' in row:assert digest==row['object_sha256']
   row.update(object_sha256=digest,object_bytes=obj.stat().st_size)
   if turn:row['generation_s'].append(sum(int(x[3]) for x in records)/1e9)
 runner_source=r/'build/callee-return-long'/(fixture+'-runner.coil');runner_source.parent.mkdir(parents=True,exist_ok=True)
 original_runner=r/('benchmarks/compiler-gaps/'+fixture+'-runner.coil')
 source=original_runner.read_text()
 original_calls=128 if fixture=='verify-graph' else 32
 calls=original_calls*32
 loop='(for [i 0 '+str(original_calls)+']';checksum='(* expected '+str(original_calls)+')'
 assert loop in source and checksum in source,fixture
 runner_source.write_text(source.replace(loop,'(for [i 0 '+str(calls)+']').replace(checksum,'(* expected '+str(calls)+')'))
 run([old,'emit-obj',runner_source,'--backend','llvm','-O3','--no-debug','-o',d/'runner.o'])
 for row in rows:
  run(['cc',d/'runner.o',d/(row['name']+'.o'),'-lm','-o',d/row['name']])
  (d/(row['name']+'.asm')).write_text(run(['llvm-objdump','-dr','--no-show-raw-insn',d/(row['name']+'.o')]).stdout)
 for turn in range(17):
  if turn in [0,8,16]:(d/('processes-'+str(turn)+'.txt')).write_text(subprocess.run(['ps','-axo','pid,pcpu,comm'],capture_output=True,text=True,check=True).stdout)
  for row in rows[turn%len(rows):]+rows[:turn%len(rows)]:
   p=subprocess.Popen([str(d/row['name'])],stdout=subprocess.PIPE,stderr=subprocess.PIPE);_,status,u=os.wait4(p.pid,0);p.returncode=os.waitstatus_to_exitcode(status);stdout,stderr=p.communicate()
   assert p.returncode==0,(row['name'],stdout,stderr)
   (d/(row['name']+'-runtime-'+str(turn)+'.txt')).write_bytes(stdout+stderr)
   if turn:row['cpu_s'].append(u.ru_utime+u.ru_stime)
 for row in rows:
  row['median_generation_s']=statistics.median(row['generation_s']);row['median_cpu_s']=statistics.median(row['cpu_s'])
  print(fixture,row['name'],row['median_generation_s'],row['median_cpu_s'],row['object_bytes'],flush=True)
 p=run([new,'emit-obj','benchmarks/compiler-gaps/'+fixture+'.coil','--backend','stogir','-O3','--no-debug','-o',d/'traced.o'],env=dict(e,COIL_TPDE_STATS='1'))
 (d/'trace.txt').write_text(p.stdout+p.stderr);assert sha(d/'traced.o')==rows[1]['object_sha256']
 assert all(sha(Path(row['compiler']))==row['compiler_sha256'] for row in rows)
 entry=dict(fixture=fixture,fixture_sha256=sha(r/('benchmarks/compiler-gaps/'+fixture+'.coil')),runner_source_sha256=sha(runner_source),runner_calls=calls,caller_sha256=sha(d/'runner.o'),rows=rows)
 (d/'results.json').write_text(json.dumps(entry,indent=2)+'\n');results.append(entry)
assert sources=={str(p.relative_to(r)):sha(p) for p in sorted((r/'src/stogir').rglob('*.coil'))}
(out/'results.json').write_text(json.dumps(dict(qualification='Callee GP direct return value experiment; repeated small actual compiler-library reductions; identical current source/common opaque LLVM O3 caller for all rows. Four rotating IR-codegen and16 rotating child-CPU samples after excluded warmups. Extended caller repeats identical kernel32times more often (verifier4096/preparation1024calls) to reduce scheduler noise; raw CPU figures are not comparable directly to earlier caller counts. Serial/O3/no-debug/cache+library-state off. Not whole-bootstrap acceptance.',sources=sources,results=results),indent=2)+'\n')
