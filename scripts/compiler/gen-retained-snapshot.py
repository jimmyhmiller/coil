#!/usr/bin/env python3
"""Generate precise compiler-metadata graph visitors from declared Coil types.

Visitors copy only typed live ranges and rewrite only declared pointers. Unknown
opaque fields fail generation until their ownership is explicitly classified.
"""
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[2]
TOKEN = re.compile(r';[^\n]*|#\\(?:[A-Za-z]+|.)|"(?:\\.|[^"\\])*"|[()\[\]]|[^\s()\[\]";]+')
class Vector(list): pass

def read(text):
    tokens = [m.group() for m in TOKEN.finditer(text) if not m.group().startswith(';')]
    def node(i):
        t = tokens[i]
        if t not in ('(', '['): return t, i+1
        closing = ')' if t == '(' else ']'
        items=Vector() if t=='[' else []; i+=1
        while tokens[i] != closing:
            item,i=node(i); items.append(item)
        return items,i+1
    forms=[]; i=0
    while i<len(tokens):
        item,i=node(i); forms.append(item)
    return forms

def freeze(t): return tuple(map(freeze,t)) if isinstance(t,list) else t

def render(t):
    if not isinstance(t,tuple): return t
    if t[0]=='fnptr': return '(fnptr '+t[1]+' ['+' '.join(map(render,t[2]))+'] '+render(t[3])+')'
    return '('+' '.join(map(render,t))+')'

modules={}; definitions={}
for path in list((ROOT/'src/compiler').glob('*.coil'))+list((ROOT/'src/stdlib').glob('*.coil')):
    if path.name in ('guide.coil','retained_snapshot.coil'): continue
    forms=read(path.read_text())
    module=next((f[1] for f in forms if isinstance(f,list) and len(f)>1 and f[0]=='module'),None)
    if not module: continue
    own={f[1]:f for f in forms if isinstance(f,list) and len(f)>2 and f[0] in ('defstruct','defsum','deftrait')}
    imports=[f for f in forms if isinstance(f,list) and len(f)>1 and f[0]=='import']
    modules[module]=(own,imports)
    for name,form in own.items(): definitions[module+'.'+name]=(module,form)

PRIMITIVES={'i8','i16','i32','i64','u8','u16','u32','u64','isize','usize','f32','f64','bool','void','never','Code','CodeBuilder'}
def resolve(name,mod,params):
    if name in params:return params[name]
    if name.lstrip(':') in PRIMITIVES:return name.lstrip(':')
    if name in definitions:return name
    own,imports=modules[mod]
    if name in own:return mod+'.'+name
    if '/' in name:
        alias,leaf=name.split('/',1)
        for imp in imports:
            if ':as' in imp and imp[imp.index(':as')+1]==alias:
                return imp[1][1:-1]+'.'+leaf
    candidates=[]
    for imp in imports:
        imported=imp[1][1:-1]
        if ':use' not in imp:continue
        use=imp[imp.index(':use')+1]
        if (use=='*' or name in use) and imported+'.'+name in definitions:
            candidates.append(imported+'.'+name)
    if len(set(candidates))==1:return candidates[0]
    if 'coil.core.'+name in definitions:return 'coil.core.'+name
    raise ValueError(('unresolved metadata type',name,mod,candidates))

def qualify(t,mod,params):
    if isinstance(t,str):return resolve(t,mod,params)
    head=t[0]
    if head in ('ptr','ref','mut','slice','array','dyn','fnptr'):
        if head=='fnptr':return ('fnptr',t[1],tuple(qualify(x,mod,params) for x in t[2]),qualify(t[3],mod,params))
        if head=='array':return ('array',qualify(t[1],mod,params),str(t[2]))
        return (head,qualify(t[1],mod,params))
    return (resolve(head,mod,params),)+tuple(qualify(x,mod,params) for x in t[1:])

def definition(t):
    head=t[0] if isinstance(t,tuple) else t
    mod,form=definitions[head]
    generic=isinstance(form[2],Vector) and (not form[2] or isinstance(form[2][0],str))
    parameters=dict(zip([p[0] if isinstance(p,list) else p for p in form[2]],t[1:])) if generic else {}
    tail=form[3:] if generic else form[2:]
    return head,mod,form[0],parameters,tail

ROOTS=['coil.compiler.loader.LS','coil.compiler.ast.Program','coil.compiler.ast.AstUnitState',
       ('coil.arraylist.ArrayList','coil.compiler.metaengine.MEEntry'), 'coil.reader.Sexp']
OVERRIDES={
 ('coil.compiler.loader.LS','semantic_maps'):('ptr','coil.compiler.comptime.SemMapsSnap'),
 ('coil.compiler.loader.LS','checker_context'):('ptr','coil.compiler.check.Cx'),
 ('coil.compiler.loader.SemanticWorkspaceSlot','value'):('ptr','coil.compiler.resolve.SemanticWorkspace'),
 ('coil.compiler.metaengine.MEEntry','interpcx'):('ptr','coil.compiler.interp.Interp'),
}
NULL_FIELDS={('coil.compiler.loader.LS','parent'),
 ('coil.compiler.check.Cx','anon_outer_env')}
EMPTY_LISTS={
 ('coil.compiler.loader.LS','out'),
 ('coil.compiler.check.Cx','cur_bounds'), ('coil.compiler.check.Cx','loops'),
 ('coil.compiler.check.Cx','anon_funcs'),
 ('coil.compiler.resolve.SemanticWorkspace','resolved_revisions')}
EMPTY_MAPS={
 ('coil.compiler.check.Cx','synth_cache'),
 ('coil.compiler.resolve.SemanticWorkspace','revision_heads'),
 ('coil.compiler.resolve.SemanticWorkspace','failed_parses')}

OPAQUE_FIELDS={('coil.compiler.loader.LS','code_session_state'),
               ('coil.compiler.metaengine.MEEntry','fp')}
ids={}; queue=[]; output=[]; used=set()
def ident(t):
    t=freeze(t)
    if t not in ids:ids[t]=len(ids);queue.append(t)
    return 'snapshot-'+str(ids[t])

def call(kind,t,value):return '('+ident(t)+'-'+kind+' g '+value+')'
def scalar(t):return isinstance(t,str) and t in PRIMITIVES

def body(t):
    ty=render(t)
    if scalar(t):return '0','value'
    if isinstance(t,tuple):
        head=t[0]
        if head in ('fnptr',):return '0','value'
        if head=='dyn':
            if t[1]!='coil.alloc.Allocator':raise ValueError(('unclassified dyn',t))
            return '0','(.destination g)'
        if head in ('ptr','ref','mut'):
            inner=t[1]
            if scalar(inner):return '0','value' # Native/raw storage; containers describe their live ranges explicitly.
            return call('scan',inner,'value'),f'(p/cast {ty} (graph-address g (p/cast i64 value)))'
        if head=='slice':
            inner=t[1];ity=render(inner)
            walk=f'''(do (graph-range! g (p/cast i64 (slice-data value)) (* (len value) (p/sizeof {ity})) (p/alignof {ity}))
              (for [i 0 (len value)] {('0' if scalar(inner) else call('scan',inner,'(p/index (slice-data value) i)'))}) 0)'''
            relocate=f'(slice-new [{ity}] (p/cast (ptr {ity}) (if (= (len value) 0) 0 (graph-address g (p/cast i64 (slice-data value))))) (len value))'
            if inner=='u8': walk='(do (graph-mark-scope! g value) '+walk+' 0)'
            return walk,relocate
        if head=='array':raise ValueError(('inline array needs visitor',t))
    head,mod,kind,params,tail=definition(t);used.add(mod)
    if head=='coil.scratch.ScratchArena':
        return '0','(coil.scratch.ScratchArena :parent (.destination g) :current (p/cast (ptr coil.scratch.ScratchSegment) 0) :initial-cap 256 :closed false :total 0 :live 0 :peak 0 :reserved 0)'
    if head=='coil.arraylist.ArrayList':
        inner=t[1];ity=render(inner)
        walk=f'''(do (graph-range! g (p/cast i64 (.data value)) (* (.len value) (p/sizeof {ity})) (p/alignof {ity}))
          (for [i 0 (.len value)] {('0' if scalar(inner) else call('scan',inner,'(p/index (.data value) i)'))}) 0)'''
        value=f'''(coil.arraylist.ArrayList :data (p/cast (ptr {ity}) (if (= (.len value) 0) 0 (graph-address g (p/cast i64 (.data value)))))
          :len (.len value) :cap (.len value) :alc (.destination g))'''
        return walk,value
    if head=='coil.hashmap.HashMap':
        entry=('coil.hashmap.Entry',)+t[1:]; ety=render(entry)
        walk=f'''(do (graph-range! g (p/cast i64 (.slots value)) (* (.cap value) (p/sizeof {ety})) (p/alignof {ety}))
          {call('walk',('ptr','coil.hashmap.KeyOps'),'(.ops value)')}
          (for [i 0 (.cap value)]
            (let [item (p/index (.slots value) i)]
              (when (= (.state item) 1) {call('scan',entry,'item')} 0))) 0)'''
        value=f'''(coil.hashmap.HashMap :slots (p/cast (ptr {ety}) (if (= (.cap value) 0) 0 (graph-address g (p/cast i64 (.slots value)))))
          :cap (.cap value) :len (.len value) :tombs (.tombs value) :alc (.destination g)
          :ops {call('value',('ptr','coil.hashmap.KeyOps'),'(.ops value)')})'''
        return walk,value
    if kind=='defstruct':
        walks=[]; fields=[]
        if head in ('coil.compiler.ast.Expr','coil.reader.Sexp'):
            walks.append('(set! (mut (.live-nids g)) (.nid value) 0)')
        for name,raw,*rest in tail[0]:
            field=qualify(raw,mod,params);expr='(.'+name+' value)';key=(head,name)
            if name=='source' and field=='i64' and head!='coil.compiler.ast.SrcModEntry':
                walks.append('(set! (mut (.live-sources g)) '+expr+' 0)')
            if name=='ctxt' and field=='i64': walks.append('(set! (mut (.live-contexts g)) '+expr+' 0)')
            if head=='coil.compiler.ast.CoreDeclBox' and name in ('srcs','ctxts'):
                target='live-sources' if name=='srcs' else 'live-contexts'
                walks.append('(unless (= (p/cast i64 '+expr+') 0) (for [i 0 (len (load '+expr+'))] (set! (mut (.'+target+' g)) (get (load '+expr+') i) 0)) 0)')

            if key in EMPTY_LISTS:
                fields+=[':'+name, '(al-new ['+render(field[1])+'] (.destination g))'];continue
            if key in EMPTY_MAPS:
                ops='(.ops '+expr+')'
                walks.append(call('walk',('ptr','coil.hashmap.KeyOps'),ops))
                fields+=[':'+name, '(coil.hashmap.HashMap :slots (p/cast (ptr (coil.hashmap.Entry '+render(field[1])+' '+render(field[2])+')) 0) :len 0 :cap 0 :tombs 0 :alc (.destination g) :ops '+call('value',('ptr','coil.hashmap.KeyOps'),ops)+')'];continue
            if key in NULL_FIELDS:
                fields+=[':'+name,f'(p/cast {render(field)} 0)'];continue
            if key in OPAQUE_FIELDS:
                fields+=[':'+name,expr];continue
            if key in OVERRIDES:
                precise=OVERRIDES[key];cast=f'(p/cast {render(precise)} {expr})'
                walks.append(call('walk',precise,cast))
                fields+=[':'+name,f'(p/cast {render(field)} {call("value",precise,cast)})'];continue
            if isinstance(field,tuple) and field[0]=='ptr' and scalar(field[1]):
                raise ValueError(('unclassified raw pointer',head,name,field))
            walks.append(call('walk',field,expr));fields+=[':'+name,call('value',field,expr)]
        if head in ('coil.compiler.ast.ValueResEntry','coil.compiler.ast.TypeResEntry'):
            walks=['(set! (.weak-alias g) true)']+walks+['(set! (.weak-alias g) false)']
        if head=='coil.reader.Sexp': walks.append('(set! (mut (.live-scopes g)) (.hyg value) 0)')
        return '(do '+' '.join(walks)+' 0)', '('+head+' '+' '.join(fields)+')'
    walks=[];values=[]
    for variant in tail:
        name=mod+'.'+variant[0];fields=variant[1] if len(variant)>1 else [];args=['v'+str(i) for i in range(len(fields))]
        types=[qualify(f[1],mod,params) for f in fields]
        walks.append('('+name+' ['+' '.join(args)+'] (do '+' '.join(call('walk',f,a) for f,a in zip(types,args))+' 0))')
        values.append('('+name+' ['+' '.join(args)+'] ('+name+' '+' '.join(call('value',f,a) for f,a in zip(types,args))+'))')
    return '(match value '+' '.join(walks)+')','(match value '+' '.join(values)+')'

for t in ROOTS:ident(t)
i=0
while i<len(queue):
    t=queue[i];name=ident(t);ty=render(t);walk,value=body(t)
    output += [f'''
(defn {name}-walk [(g (ptr Graph)) (value {ty})] (-> i64) {walk})
(defn {name}-value [(g (ptr Graph)) (value {ty})] (-> {ty}) {value})
(defn {name}-fix [(g (ptr Graph)) (from (ptr i8)) (to (ptr i8))] (-> i64)
  (set! (p/cast (ptr {ty}) to) ({name}-value g (load (p/cast (ptr {ty}) from)))) 0)
(defn {name}-scan [(g (ptr Graph)) (node (ptr {ty}))] (-> i64)
  (when (graph-enter! g (p/cast i64 node) (p/sizeof {ty}) (p/alignof {ty}) {i+1} (p/fnptr-of {name}-fix))
    ({name}-walk g (load node)) 0) 0)
'''];i+=1
imports='\n'.join('(import "'+m+'")' for m in sorted(used) if m != 'coil.core')
header=''';;; Generated by scripts/compiler/gen-retained-snapshot.py; do not edit.
(module coil.compiler.retained_snapshot)
(import "coil.primitive" :as p)
(import "coil.alloc" :use *)
(import "coil.arraylist" :use *)
(import "coil.slice" :use *)
(import "coil.compiler.retained_graph" :use *)
(import "coil.scratch" :as scratch)
'''
type_names='(defn snapshot-type-name [(kind i64)] (-> (slice u8)) (cond '+ ' '.join('(= kind '+str(i+1)+') "'+render(t).replace('\\','\\\\').replace('"','\\"')+'"' for t,i in ids.items())+' "unknown"))\n'
wrappers=''
for name,t in zip(('scan-loader!','scan-program!','scan-resolution!','scan-meta-entries!','scan-syntax!'), ROOTS):
    wrappers+='(defn '+name+' [(g (ptr Graph)) (root (ptr '+render(t)+'))] (-> i64) ('+ident(t)+'-scan g root))\n'
result=header+imports+'\n'+''.join(output)+type_names+wrappers
target=ROOT/'src/compiler/retained_snapshot.coil'
if '--check' in sys.argv:
    if not target.exists() or target.read_text()!=result:
        raise SystemExit('retained metadata visitors are stale; run scripts/compiler/gen-retained-snapshot.py')
else:
    target.write_text(result)
print('generated',len(ids),'precise metadata visitors')
