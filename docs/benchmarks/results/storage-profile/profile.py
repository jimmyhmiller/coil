from pathlib import Path
import subprocess,os,time,json,hashlib
R=Path.cwd();D=R/'build/storage-backend-profile';C=R/'build/bin/coil-candidate'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def fingerprint():return hashlib.sha256(b''.join(str(p.relative_to(R)).encode()+b'\0'+p.read_bytes()+b'\0' for p in sorted((R/'src').rglob('*.coil')))).hexdigest()
f=fingerprint();e={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};e.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
with (D/'stdout.log').open('w') as out,(D/'stderr.log').open('w') as err:
 p=subprocess.Popen([str(C),'emit-obj','src/compiler/main.coil','--backend','stogir','-O3','--no-debug','-o',str(D/'compiler.o')],cwd=R,env=e,stdout=out,stderr=err);t=time.monotonic();print('profile PID',p.pid,flush=True)
 while time.monotonic()-t<8:
  assert p.poll() is None,'target exited before sampling';time.sleep(.2)
 s=subprocess.run(['sample',str(p.pid),'8','1','-file',str(D/'profile.txt')],capture_output=True,text=True);(D/'sample.log').write_text(s.stdout+s.stderr);assert s.returncode==0,s.stderr
 assert p.wait()==0
assert fingerprint()==f
obj=D/'compiler.o';assert obj.stat().st_size>1000000 and obj.read_bytes()[:4]==bytes.fromhex('cffaedfe')
(D/'metadata.json').write_text(json.dumps(dict(qualification='Non-timed profile only. Requested8s at elapsed8s; process may finish during sample. Actual phases must be read from stacks. No timing acceptance claim.',compiler_sha256=sha(C),source_tree_sha256=f,object_sha256=sha(obj),sample_sha256=sha(D/'profile.txt'),target_exit=0,sample_exit=s.returncode),indent=2)+'\n');print('profile complete',flush=True)
