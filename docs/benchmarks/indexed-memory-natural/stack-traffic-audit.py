from pathlib import Path
import subprocess,re,json,hashlib,collections
base=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-return-allocation-bootstrap/build/return-allocation-bootstrap')
rows=[]
for name in ['stogir-0.o','llvm-0.o']:
 obj=base/name;source=subprocess.check_output(['llvm-objdump','-d','--no-show-raw-insn',str(obj)],text=True)
 targets={int(x,16) for x in re.findall(r':\s+(?:b(?:\.[a-z]+)?|cbz|cbnz|tbz|tbnz)\s+[^\n]*?\b0x([0-9a-f]+)',source)}
 funcs=collections.defaultdict(collections.Counter);fn='unknown';stack={'sp','x29'};indirect=False
 for line in source.splitlines():
  f=re.match(r'[0-9a-f]+ <([^>]+)>:',line)
  if f:fn=f[1].lstrip('_');stack={'sp','x29'};indirect=False;continue
  m=re.match(r'\s*([0-9a-f]+):\s+([a-z][a-z0-9.]*)\s*(.*)',line)
  if not m:continue
  if int(m[1],16) in targets or indirect:stack&={'sp','x29'}
  op,args=m[2],m[3];counts=funcs[fn];counts['instructions']+=1
  if op=='br':indirect=True
  mem=op.startswith(('ldr','str','ldur','stur','ldp','stp'))
  if mem:
   slots=2 if op.startswith(('ldp','stp')) else 1
   counts['memory']+=1;counts['memory_registers']+=slots;b=re.search(r'\[(sp|x\d+)',args)
   if b and b[1] in stack:
    counts['stack']+=1;counts['stack_registers']+=slots
    if b[1] in ('sp','x29'):counts['direct_stack']+=1
    else:counts['derived_stack']+=1
   else:counts['other_memory']+=1
  operands=[a.strip() for a in args.split(',')]
  if op in ('bl','blr'):
   stack-={f'x{i}' for i in range(19)}
  elif op=='b' or op.startswith('b.') or op in ('cbz','cbnz','tbz','tbnz','ret'):
   stack&={'sp','x29'}
  elif operands and not op.startswith(('str','stur','stp','cmp','cmn','tst','fcmp','prfm')):
   dest=operands[0]
   if re.fullmatch(r'w\d+',dest):stack.discard('x'+dest[1:])
   elif re.fullmatch(r'x\d+|sp',dest):
    derived=False
    if op in ('mov','add','sub') and len(operands)>1:derived=operands[1] in stack
    if op=='orr' and len(operands)>2:
     if operands[1]=='xzr':derived=operands[2] in stack
     elif operands[2]=='xzr':derived=operands[1] in stack
    stack.discard(dest)
    if derived or dest=='sp':stack.add(dest)
   if op.startswith('ldp') and len(operands)>1:
    stack.discard(re.sub('^w','x',operands[1]))
 total=collections.Counter()
 for c in funcs.values():total.update(c)
 selected={k:dict(v) for k,v in funcs.items() if k in ('stogir.verify.structure','stogir.verify.integer-operations-target-structured','stogir.uses.build','stogir.graph.operand','coil.compiler.resolve.imports-find')}
 rows.append(dict(object=str(obj),sha256=hashlib.sha256(obj.read_bytes()).hexdigest(),total=dict(total),selected=selected,top_stack=[dict(function=k,**dict(v)) for k,v in sorted(funcs.items(),key=lambda x:x[1]['stack'],reverse=True)[:20]]))
print(json.dumps(dict(qualification='Static decoded text of same frozen whole-bootstrap checkpoint01f47440. Syntactic SP/FP references plus local stack-origin tracking through simple pointer copies/adds; call clobbers and branch-target facts cleared. After indirect BR, derived facts are discarded before every instruction until the next function. Derived counts remain a heuristic, not formal alias analysis. Indirect stack pointers passed through parameters or reloaded from spills are unknown. Counts are instructions and transferred registers (LDP/STP count as two registers); not byte volume. This is not dynamic frequency, exact spill attribution, or a performance prediction. No new whole-bootstrap timing.',rows=rows),indent=2))
