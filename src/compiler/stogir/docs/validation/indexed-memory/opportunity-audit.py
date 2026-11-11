from pathlib import Path
import subprocess,re,json,hashlib
root=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-return-allocation-bootstrap/build/return-allocation-bootstrap')
rows=[]
for name in ['stogir-0.o','llvm-0.o']:
 obj=root/name;s=subprocess.check_output(['llvm-objdump','-d','--no-show-raw-insn',str(obj)],text=True)
 total=loads=adds=matches=0;last=None;examples=[]
 for line in s.splitlines():
  m=re.match(r'\s*([0-9a-f]+):\s+([a-z][a-z0-9.]*)\s+(.*)',line)
  if not m:last=None;continue
  total+=1;op,args=m[2],m[3];loads+=int(op.startswith(('ldr','str','ldur','stur')));adds+=int(op=='add')
  if last and last[0]=='add':
   a=re.fullmatch(r'(x\d+), (x\d+), (x\d+)(?:, lsl #(0x[0-9a-f]+|\d+))?',last[1])
   if a and re.search(r'\['+a[1]+r'\]',args) and op.startswith(('ldr','str')):
    matches+=1
    if len(examples)<5:examples.append([last[1],op+' '+args])
  last=(op,args)
 rows.append(dict(object=str(obj),sha256=hashlib.sha256(obj.read_bytes()).hexdigest(),instructions=total,memory_instructions=loads,adds=adds,adjacent_register_add_memory=matches,examples=examples))
print(json.dumps(dict(qualification='Static decoded text opportunity count only. Does not establish eligibility: shared address users, scale legality and allocation remain to be checked. Not dynamic frequency or speed estimate.',rows=rows),indent=2))
