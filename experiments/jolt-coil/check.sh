#!/bin/sh
set -eu

repo=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
cd "$repo"
jolt_commit=865a79f4ba71abf1954b59cadaed94cb8b56816f
jolt_dir=${JOLT_DIR:-"$repo/.coil/jolt-coil/jolt"}

if [ ! -d "$jolt_dir/.git" ]; then
  mkdir -p "$(dirname -- "$jolt_dir")"
  git clone https://github.com/jolt-lang/jolt.git "$jolt_dir"
  git -C "$jolt_dir" checkout --detach "$jolt_commit"
  git -C "$jolt_dir" submodule update --init --recursive
fi

actual_commit=$(git -C "$jolt_dir" rev-parse HEAD)
if [ "$actual_commit" != "$jolt_commit" ]; then
  echo "jolt-coil: expected Jolt $jolt_commit, found $actual_commit" >&2
  echo "jolt-coil: remove $jolt_dir or set JOLT_DIR to the pinned checkout" >&2
  exit 1
fi

chez=${JOLT_CHEZ:-}
if [ -z "$chez" ]; then
  if command -v chezscheme >/dev/null 2>&1; then
    chez=chezscheme
  elif command -v scheme >/dev/null 2>&1; then
    chez=scheme
  else
    echo "jolt-coil: Chez Scheme is required to run the bootstrap emitter" >&2
    exit 1
  fi
fi

actual=$(cd "$jolt_dir" && "$chez" --script "$repo/experiments/jolt-coil/emit-basic.ss")
expected=$(sed -n '1p' "$repo/experiments/jolt-coil/expected-basic.ss")
if [ "$actual" != "$expected" ]; then
  echo "jolt-coil: emitted Scheme changed" >&2
  echo "expected: $expected" >&2
  echo "actual:   $actual" >&2
  exit 1
fi

coil_form=$(printf '%s\n' "$actual" | sed 's/^(jolt-n+ /(+ /')
if [ "$coil_form" = "$actual" ]; then
  echo "jolt-coil: the M0 adapter did not recognize emitted form: $actual" >&2
  exit 1
fi

if [ -n "${COIL_SCHEME:-}" ]; then
  scheme_host=$COIL_SCHEME
elif [ -x "$repo/build/examples/mini-scheme" ]; then
  scheme_host=$repo/build/examples/mini-scheme
else
  echo "jolt-coil: set COIL_SCHEME to a Coil-built stdin Scheme host" >&2
  exit 1
fi

output=$(printf '%s\n' "$coil_form" | "$scheme_host")
if [ "$output" != "3" ]; then
  echo "jolt-coil: Coil execution failed: expected 3, got $output" >&2
  exit 1
fi

m1_output=$(coil run "$repo/experiments/jolt-coil/m1-fixed-arity.scm")
if [ "$m1_output" != "42
42" ]; then
  echo "jolt-coil: fixed-arity closure gate failed" >&2
  echo "expected: 42 / 42" >&2
  echo "actual: $m1_output" >&2
  exit 1
fi

nested_source=$(tr '\n' ' ' < "$repo/experiments/jolt-coil/m2-nested.clj")
nested_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$nested_source")
case "$nested_emitted" in
  *"(jolt-invoke1"*"(lambda (x)"*"(lambda (y)"*"(if (jolt-n> y 10)"*) ;;
  *)
    echo "jolt-coil: nested-program emission lost an expected construct" >&2
    echo "actual: $nested_emitted" >&2
    exit 1
    ;;
esac

m2_output=$(coil run "$repo/experiments/jolt-coil/m2-nested.scm")
if [ "$m2_output" != "144" ]; then
  echo "jolt-coil: nested closure/control-flow gate failed: expected 144, got $m2_output" >&2
  exit 1
fi

apply_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" '(apply + [1 2 3])')
apply_expected='(let* ((_a$1 (jolt-add-value)) (_a$2 (jolt-vector3 1 2 3))) (jolt-invoke-list _a$1 _a$2))'
if [ "$apply_emitted" != "$apply_expected" ]; then
  echo "jolt-coil: apply emission changed" >&2
  echo "expected: $apply_expected" >&2
  echo "actual:   $apply_emitted" >&2
  exit 1
fi

m3_output=$(coil run "$repo/experiments/jolt-coil/m3-apply.scm")
if [ "$m3_output" != "6" ]; then
  echo "jolt-coil: vector/apply gate failed: expected 6, got $m3_output" >&2
  exit 1
fi

loop_source='((fn [limit] (loop [n limit acc 0] (if (zero? n) acc (recur (- n 1) (+ acc n))))) 5)'
loop_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$loop_source")
case "$loop_emitted" in
  *"(let [(mut loop2\$slot\$n\$cell)"*"(loop "*"(primitive/store! loop2\$slot\$acc\$cell"*) ;;
  *)
    echo "jolt-coil: loop/recur was not lowered to native Coil control flow" >&2
    echo "actual: $loop_emitted" >&2
    exit 1
    ;;
esac

m5_output=$(coil run "$repo/experiments/jolt-coil/m5-closure-loop.scm")
if [ "$m5_output" != "15" ]; then
  echo "jolt-coil: closure-nested loop/recur gate failed: expected 15, got $m5_output" >&2
  exit 1
fi

loop3_source='(loop [n 4 sum 0 product 1] (if (zero? n) (+ sum product) (recur (- n 1) (+ sum n) (* product n))))'
loop3_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$loop3_source")
case "$loop3_emitted" in
  *"(mut loop1\$slot\$product\$cell)"*"(primitive/store! loop1\$slot\$product\$cell"*) ;;
  *)
    echo "jolt-coil: arbitrary-arity loop lowering lost its third binding" >&2
    exit 1
    ;;
esac

m6_output=$(coil run "$repo/experiments/jolt-coil/m6-three-binding-loop.scm")
if [ "$m6_output" != "34" ]; then
  echo "jolt-coil: three-binding loop/recur gate failed: expected 34, got $m6_output" >&2
  exit 1
fi

str_source='(str "sum=" (loop [n 5 acc 0] (if (zero? n) acc (recur (- n 1) (+ acc n)))))'
str_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$str_source")
case "$str_emitted" in
  *'(var-deref "clojure.core" "str")'*"(jolt-invoke2"*) ;;
  *)
    echo "jolt-coil: clojure.core/str emission changed" >&2
    exit 1
    ;;
esac

m7_output=$(coil run "$repo/experiments/jolt-coil/m7-core-str.scm")
if [ "$m7_output" != "sum=15" ]; then
  echo "jolt-coil: core var/str gate failed: expected sum=15, got $m7_output" >&2
  exit 1
fi

println_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" '(println "hello" 42)')
println_expected='(jolt-invoke2 (var-deref "clojure.core" "println") "hello" 42)'
if [ "$println_emitted" != "$println_expected" ]; then
  echo "jolt-coil: println emission changed" >&2
  echo "expected: $println_expected" >&2
  echo "actual:   $println_emitted" >&2
  exit 1
fi

m8_output=$(coil run "$repo/experiments/jolt-coil/m8-println.scm")
if [ "$m8_output" != "hello 42" ]; then
  echo "jolt-coil: println gate failed: expected 'hello 42', got '$m8_output'" >&2
  exit 1
fi

vector_loop_source='(let [xs (conj [1 2 3] 4)] (loop [i 0 acc 0] (if (= i (count xs)) acc (recur (+ i 1) (+ acc (nth xs i))))))'
vector_loop_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$vector_loop_source")
case "$vector_loop_emitted" in
  *"(jolt-conj2 (jolt-vector3 1 2 3) 4)"*"(jolt-nth xs i)"*"loop1\$slot\$i\$cell"*) ;;
  *)
    echo "jolt-coil: vector loop emission changed" >&2
    exit 1
    ;;
esac

m9_output=$(coil run "$repo/experiments/jolt-coil/m9-vector-loop.scm")
if [ "$m9_output" != "10" ]; then
  echo "jolt-coil: vector collection loop failed: expected 10, got $m9_output" >&2
  exit 1
fi

map_reduce_source='(reduce + 0 (map (fn [x] (* x x)) [1 2 3 4]))'
map_reduce_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$map_reduce_source")
case "$map_reduce_emitted" in
  *"(jolt-add-value)"*"(lambda (x)"*"(jolt-map "*"(jolt-reduce "*) ;;
  *)
    echo "jolt-coil: higher-order map/reduce emission changed" >&2
    exit 1
    ;;
esac

m10_output=$(coil run "$repo/experiments/jolt-coil/m10-map-reduce.scm")
if [ "$m10_output" != "30" ]; then
  echo "jolt-coil: higher-order map/reduce failed: expected 30, got $m10_output" >&2
  exit 1
fi

map_keyword_source='(get (assoc {:a 10 :b 20} :c (+ (get {:x 5} :x) 7)) :c)'
map_keyword_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$map_keyword_source")
case "$map_keyword_emitted" in
  *"(jolt-get (let*"*"(jolt-hash-map4"*"(keyword #f \"c\")"*"(jolt-assoc3 "*) ;;
  *)
    echo "jolt-coil: keyword/map emission changed" >&2
    exit 1
    ;;
esac

m11_output=$(coil run "$repo/experiments/jolt-coil/m11-map-keyword.scm")
if [ "$m11_output" != "12" ]; then
  echo "jolt-coil: keyword map get/assoc failed: expected 12, got $m11_output" >&2
  exit 1
fi

application_source=$(tr '\n' ' ' < "$repo/experiments/jolt-coil/m12-application.clj")
application_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$application_source")
case "$application_emitted" in
  *"(jolt-map "*"(jolt-reduce "*"(jolt-hash-map4 "*"(var-deref \"clojure.core\" \"str\")"*"(var-deref \"clojure.core\" \"println\")"*) ;;
  *)
    echo "jolt-coil: composed application emission changed" >&2
    exit 1
    ;;
esac

m12_output=$(coil run "$repo/experiments/jolt-coil/m12-application.scm")
if [ "$m12_output" != "sum=30
30" ]; then
  echo "jolt-coil: composed application failed" >&2
  echo "expected: sum=30 / 30" >&2
  echo "actual: $m12_output" >&2
  exit 1
fi

m12_generated_output=$("$repo/experiments/jolt-coil/run-clojure.sh" \
  "$repo/experiments/jolt-coil/m12-application.clj")
if [ "$m12_generated_output" != "sum=30
30" ]; then
  echo "jolt-coil: generated composed application failed" >&2
  echo "actual: $m12_generated_output" >&2
  exit 1
fi

nil_source='(+ (if nil 100 1) (if (= [1 2] [1 2]) 10 100) (if (nil? (seq [])) 20 100) (if (nil? (get {:a 1} :missing)) 30 100))'
nil_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$nil_source")
case "$nil_emitted" in
  *"(jolt-truthy? (jolt-nil-value))"*"(jolt=2 "*"(jolt-seq (jolt-vector0))"*"(jolt-n+4 "*) ;;
  *)
    echo "jolt-coil: nil/truth/equality emission changed" >&2
    exit 1
    ;;
esac

m13_output=$(coil run "$repo/experiments/jolt-coil/m13-nil-equality.scm")
if [ "$m13_output" != "61" ]; then
  echo "jolt-coil: nil/truth/equality failed: expected 61, got $m13_output" >&2
  exit 1
fi

defn_source='(do (defn twice [x] (* x 2)) (twice 21))'
defn_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$defn_source")
case "$defn_emitted" in
  *"(def-var-with-meta! \"user\" \"twice\""*"(lambda (x)"*"(var-deref \"user\" \"twice\")"*) ;;
  *)
    echo "jolt-coil: defn/var emission changed" >&2
    exit 1
    ;;
esac

m14_output=$(coil run "$repo/experiments/jolt-coil/m14-vars-defn.scm")
if [ "$m14_output" != "42" ]; then
  echo "jolt-coil: defn/var lookup failed: expected 42, got $m14_output" >&2
  exit 1
fi

multi_source='((fn ([x] x) ([x y] (+ x y))) 20 22)'
multi_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$multi_source")
case "$multi_emitted" in
  *"(lambda args"*"(= (length args) 1)"*"(= (length args) 2)"*"(let ((x (list-ref args 0)) (y (list-ref args 1)))"*) ;;
  *)
    echo "jolt-coil: multi-arity case-lambda lowering changed" >&2
    exit 1
    ;;
esac

m15_output=$(coil run "$repo/experiments/jolt-coil/m15-multi-arity.scm")
if [ "$m15_output" != "42" ]; then
  echo "jolt-coil: multi-arity function failed: expected 42, got $m15_output" >&2
  exit 1
fi

variadic_source='((fn [x & xs] (reduce + x xs)) 10 20 12)'
variadic_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$variadic_source")
case "$variadic_emitted" in
  *"(lambda (x . xs)"*"(jolt-rest-seq xs)"*"(jolt-register-variadic! 1"*) ;;
  *)
    echo "jolt-coil: variadic function emission changed" >&2
    exit 1
    ;;
esac

m16_output=$(coil run "$repo/experiments/jolt-coil/m16-variadic-fn.scm")
if [ "$m16_output" != "42" ]; then
  echo "jolt-coil: variadic function failed: expected 42, got $m16_output" >&2
  exit 1
fi

set_source='(+ (if (contains? #{1 2 3} 2) 1 100) (if (= #{1 2} #{2 1}) 10 100) (if (contains? (disj (conj #{1 2} 3) 2) 2) 100 20))'
set_emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$set_source")
case "$set_emitted" in
  *"(jolt-hash-set3 1 2 3)"*"(jolt=2 "*"(var-deref \"clojure.core\" \"disj\")"*"(jolt-n+3 "*) ;;
  *)
    echo "jolt-coil: set emission changed" >&2
    exit 1
    ;;
esac

m17_output=$(coil run "$repo/experiments/jolt-coil/m17-sets.scm")
if [ "$m17_output" != "31" ]; then
  echo "jolt-coil: set operations failed: expected 31, got $m17_output" >&2
  exit 1
fi

m20_generated_output=$("$repo/experiments/jolt-coil/run-clojure.sh" \
  "$repo/experiments/jolt-coil/m20-sequence-pipeline.clj")
if [ "$m20_generated_output" != "165" ]; then
  echo "jolt-coil: generated range/filter/map/reduce pipeline failed" >&2
  echo "actual: $m20_generated_output" >&2
  exit 1
fi

seed_prefix_output=$("$repo/experiments/jolt-coil/run-seed-smoke.sh" 111)
if [ "$seed_prefix_output" != "#t
0
def
2
9
2
2
#t" ]; then
  echo "jolt-coil: 111-form compiler prelude seed prefix failed" >&2
  echo "actual: $seed_prefix_output" >&2
  exit 1
fi

echo "jolt-coil: Clojure -> Jolt Scheme -> Coil arithmetic passed ($output)"
echo "jolt-coil: Jolt fixed-arity closures passed (42, 42)"
echo "jolt-coil: nested closures and control flow passed ($m2_output)"
echo "jolt-coil: vector/apply passed ($m3_output)"
echo "jolt-coil: closure-nested loop/recur passed ($m5_output)"
echo "jolt-coil: arbitrary-binding loop/recur passed ($m6_output)"
echo "jolt-coil: core var lookup and variadic str passed ($m7_output)"
echo "jolt-coil: core println passed ($m8_output)"
echo "jolt-coil: vector count/nth/conj loop passed ($m9_output)"
echo "jolt-coil: higher-order map/reduce passed ($m10_output)"
echo "jolt-coil: keyword map get/assoc passed ($m11_output)"
echo "jolt-coil: composed map/reduce/map/str/println application passed (sum=30, 30)"
echo "jolt-coil: nil, truthiness, structural equality, and empty seq passed ($m13_output)"
echo "jolt-coil: defn, mutable var root, deref, and invocation passed ($m14_output)"
echo "jolt-coil: multi-arity case-lambda dispatch passed ($m15_output)"
echo "jolt-coil: variadic function/rest dispatch passed ($m16_output)"
echo "jolt-coil: set membership/equality/conj/disj passed ($m17_output)"
echo "jolt-coil: direct range/filter/map/reduce Clojure pipeline passed ($m20_generated_output)"
echo "jolt-coil: first 111 real compiler prelude seed forms loaded as native code; macros, collections, variadics, and multi-exit recur invoked"
