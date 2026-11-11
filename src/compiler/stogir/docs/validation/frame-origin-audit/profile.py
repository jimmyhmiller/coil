from pathlib import Path
import subprocess,os,json,time
out=Path('build/frame-origin-profile');env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1')
p=subprocess.Popen([str((out/'runner').resolve())],env=env,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
(out/'pid.json').write_text(json.dumps(dict(pid=p.pid,command=str((out/'runner').resolve()))))
sample=subprocess.run(['/usr/bin/sample',str(p.pid),'3','1','-file',str((out/'sample.txt').resolve())],capture_output=True,text=True)
(out/'sample-driver.txt').write_text(sample.stdout+sample.stderr);stdout,stderr=p.communicate();(out/'answers.txt').write_bytes(stdout+stderr)
assert p.returncode==0,(p.returncode,stdout,stderr);assert sample.returncode==0,(sample.returncode,sample.stdout,sample.stderr)
print('profile complete, runner and sample PASS')
