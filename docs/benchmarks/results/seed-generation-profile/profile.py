from pathlib import Path
import subprocess,time,os,hashlib,json,sys
R=Path.cwd();D=R/'build/seed-generation-profile';D.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(R/'scripts/compiler'));import toolchain_stamp
fingerprint=toolchain_stamp.digest(R);C=R/'build/bin/coil-candidate'
assert '979be2f9' in subprocess.check_output([str(C),'--version'],text=True)
e={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};e.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
with (D/'stdout.log').open('w') as out,(D/'stderr.log').open('w') as err:
 p=subprocess.Popen([str(C),'emit-obj',str(R/'src/compiler/main.coil'),'--backend','stogir','-O3','--no-debug','-o',str(D/'compiler.o')],cwd=R,env=e,stdout=out,stderr=err);t=time.monotonic();print('exact baseline profile pid',p.pid,flush=True)
 for name,offset in [('backend-early',10),('backend-late',14)]:
  while time.monotonic()-t<offset:
   assert p.poll() is None,'target exited before window';time.sleep(min(.25,offset-(time.monotonic()-t)))
  q=subprocess.run(['sample',str(p.pid),'2','1','-file',str(D/(name+'.txt'))],capture_output=True,text=True);(D/(name+'-sample.log')).write_text(q.stdout+q.stderr);assert q.returncode==0,q.stderr;print(name,'complete',flush=True)
 assert p.wait()==0
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert toolchain_stamp.digest(R)==fingerprint
expected=sha(R/'build/bootstrap-bulk-128/stogir-0.o');assert sha(D/'compiler.o')==expected
(D/'metadata.json').write_text(json.dumps(dict(qualification='Non-timed exact LLVM-built seed candidate and source SDK from the full bootstrap baseline. Two elapsed sampling windows; phases must be read from stacks. Excluded from acceptance timings. Installed executable prefix rejected because its warmed JIT unit changes target input closure.',source_tree_sha256=fingerprint,compiler_sha256=sha(C),output_sha256=expected,windows=[['backend-early',10,2],['backend-late',14,2]]),indent=2))
print('exact seed profile complete; output hash matched',flush=True)
