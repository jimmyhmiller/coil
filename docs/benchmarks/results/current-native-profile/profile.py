from pathlib import Path
import subprocess,os,time,hashlib,json
R=Path.cwd();D=R/'build/reuse-native-profile';C=D/'compiler-stogir'
def fingerprint():return hashlib.sha256(b''.join(str(p.relative_to(R)).encode()+b'\0'+p.read_bytes()+b'\0' for p in sorted((R/'src').rglob('*.coil')))).hexdigest()
expected_source=json.loads((D/'build-metadata.json').read_text())['source_tree_sha256'];assert fingerprint()==expected_source
e={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};e.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
with (D/'stdout.log').open('w') as out,(D/'stderr.log').open('w') as err:
 p=subprocess.Popen([str(C),'emit-obj','src/compiler/main.coil','--backend','stogir','-O3','--no-debug','-o',str(D/'compiler.o')],cwd=R,env=e,stdout=out,stderr=err);t=time.monotonic();print('profile PID',p.pid,flush=True)
 for label,start in [('early',5),('late',27)]:
  while time.monotonic()-t<start:
   assert p.poll() is None,'target exited before profile';time.sleep(min(.5,start-(time.monotonic()-t)))
  s=subprocess.run(['sample',str(p.pid),'4','1','-file',str(D/(label+'.txt'))],capture_output=True,text=True);(D/(label+'-sample.log')).write_text(s.stdout+s.stderr);assert s.returncode==0,(label,s.stderr);print(label,'sample complete',flush=True)
 assert p.wait()==0
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert fingerprint()==expected_source
assert sha(D/'compiler.o')==sha(D/'host.o')
(D/'metadata.json').write_text(json.dumps(dict(qualification='Non-timed native compiler sampling only, excluded from timings; early/late labels denote elapsed windows, actual phases must be read from stacks.',compiler_sha256=sha(C),output_sha256=sha(D/'compiler.o'),windows=[dict(label=x,start_s=y,duration_s=4,period_ms=1,sample_sha256=sha(D/(x+'.txt'))) for x,y in [('early',5),('late',27)]],target_exit=0,sample_exit=0),indent=2)+'\n');print('profiled compiler complete, output hash matched',flush=True)
