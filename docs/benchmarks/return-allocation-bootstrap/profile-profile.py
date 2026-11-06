from pathlib import Path
import subprocess,os,hashlib,json,time,sys
r=Path.cwd();d=r/'build/return-allocation-profile';b=r/'build/return-allocation-bootstrap'
sys.path.insert(0,str(r/'scripts/compiler'));import toolchain_stamp
expected=json.loads((b/'results.json').read_text());assert toolchain_stamp.digest(r)==expected['source_tree_sha256']
name=sys.argv[1];host=b/('host-'+name)/'bin/coil';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
cmd=[str(host),'emit-obj',str(r/'src/compiler/main.coil'),'--backend','stogir','-O3','--no-debug','-o',str(d/(name+'.o'))]
with (d/(name+'.stdout')).open('w') as out,(d/(name+'.stderr')).open('w') as err:
 p=subprocess.Popen(cmd,cwd=r,env=env,stdout=out,stderr=err)
 (d/(name+'-live.json')).write_text(json.dumps(dict(pid=p.pid,command=cmd,compiler_sha256=sha(host)),indent=2))
 sample=subprocess.run(['/usr/bin/sample',str(p.pid),'50','1','-file',str(d/(name+'-sample.txt'))],capture_output=True,text=True)
 (d/(name+'-sample-driver.txt')).write_text(sample.stdout+sample.stderr)
 code=p.wait()
assert code==0,code
assert sha(d/(name+'.o'))==expected['host_rows'][0]['object_sha256']
(d/(name+'-metadata.json')).write_text(json.dumps(dict(qualification='Whole-process sampling, not timing acceptance. Classify actual stages from call stacks. Identical output object to frozen bootstrap seed.',compiler=str(host),compiler_sha256=sha(host),source_tree_sha256=toolchain_stamp.digest(r),command=cmd,exit_code=code,sample_exit_code=sample.returncode,object_sha256=sha(d/(name+'.o')),sample_sha256=sha(d/(name+'-sample.txt'))),indent=2))
print(name,'profile complete; output equals seed',flush=True)
