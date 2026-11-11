from pathlib import Path
import subprocess,os,json
compiler='/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-static-entry-allocations/build/bin/coil-candidate'
env=dict(os.environ,COIL_LIBRARY_STATE='0');rows=[]
for name in ['uses','validation-transaction','jit-mem2ssa','jit-sccp-control','static-stack','inline-stack-results']:
 p=subprocess.run([compiler,'run','tests/'+name+'.coil','--debug-checks','--sanitize=address'],env=env,capture_output=True,text=True)
 Path('build/profile-guided-validation/'+name+'.log').write_text(p.stdout+p.stderr)
 rows.append(dict(test=name,exit=p.returncode));Path('build/profile-guided-validation/results.json').write_text(json.dumps(rows,indent=2))
 print(name,p.returncode,flush=True);assert p.returncode==0,(name,p.stdout[-2000:],p.stderr[-2000:])
