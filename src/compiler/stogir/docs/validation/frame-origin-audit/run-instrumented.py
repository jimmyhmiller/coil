from pathlib import Path
import subprocess,os
p=Path('src/stogir/a64/function.coil');original=p.read_bytes();s=original.decode()
needle='''        ; The use and definition subpositions are ordered phases.'''
assert s.count(needle)==1
s=s.replace(needle,'''        (println "emit {} {} {}" reference position (len (.text output)))
'''+needle,1)
needle='                        (push! (mut stubs)\n                               (EdgeStub'
assert s.count(needle)==1
s=s.replace(needle,'                        (println "stub-source {} {} {}" id target position)\n'+needle,1)
needle='        (set! (mut labels) (cast i64 (.label stub)) (len (.text output)))'
assert s.count(needle)==1
s=s.replace(needle,'        (println "stub-emit {} {} {}" (.label stub) (.target stub) (len (.text output)))\n'+needle,1)
needle='      (match (finish-stubs! (mut output) stubs (mut labels) (mut branches))'
assert s.count(needle)==1
s=s.replace(needle,'      (println "emit-tail {}" (len (.text output)))\n'+needle,1)
needle='      (match (fixups/relax-aligned! (mut output)'
assert s.count(needle)==1
s=s.replace(needle,'      (println "pre-fixup {}" (len (.text output)))\n'+needle,1)
try:
 p.write_text(s)
 result=subprocess.run(['/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-call-result-projections/build/bin/coil-candidate','run','build/frame-origin-audit/replay.coil','--backend','llvm','-O1','--no-debug','--debug-checks','--sanitize=address'],env=dict(os.environ,COIL_LIBRARY_STATE='0'),capture_output=True,text=True)
 Path('build/frame-origin-audit/result.txt').write_text(result.stdout+result.stderr)
 result.check_returncode()
finally:p.write_bytes(original)
