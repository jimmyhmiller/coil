#!/bin/zsh
# Mutation testing: inject one bug into a COPY of the stdlib, run the suite,
# report which properties died. A mutation nothing catches = a coverage hole.
MR=/private/tmp/claude-501/-Users-jimmyhmiller-Documents-Code-projects-coil/37eccc5b-d0f3-4c26-bf3b-5c1f2feefe0f/scratchpad/mutroot
SRC=/Users/jimmyhmiller/Documents/Code/projects/coil/.claude/worktrees/property-testing
cd $SRC

mutate () {
  local name=$1 file=$2 from=$3 to=$4
  cp $SRC/src/stdlib/$file $MR/src/stdlib/$file
  perl -0pi -e "s/\Q$from\E/$to/" $MR/src/stdlib/$file
  if ! grep -qF "$to" $MR/src/stdlib/$file; then
    echo "MUTATION '$name' DID NOT APPLY"; return
  fi
  local out=$(COIL_PBT_SEED=424242 COIL_STDLIB_DIR=$MR coil test tests/prop/stdlib_props_test.coil 2>&1)
  local res=$(echo "$out" | grep -E "^test result:")
  local killers=$(echo "$out" | grep -B1 "FAILED after" | grep -o "^test [a-z0-9-]*" | sed 's/test //' | tr '\n' ',')
  echo "== $name"
  echo "   $res"
  echo "   killed by: ${killers:-NOTHING (coverage hole)}"
  cp $SRC/src/stdlib/$file $MR/src/stdlib/$file
}

mutate "al-slice reports len+1 (capacity slack leaks into view)" arraylist.coil \
  '(slice-new (load (field l data)) (load (field l len))))' \
  '(slice-new (load (field l data)) (primitive/iadd (load (field l len)) 1)))'

mutate "al-extend! copies n-1 elements (drops last)" arraylist.coil \
  '(mem-copy [T] (primitive/index (load (field l data)) old) src n)' \
  '(mem-copy [T] (primitive/index (load (field l data)) old) src (primitive/isub n 1))'

mutate "al-pop! does not decrement len" arraylist.coil \
  '(store! (field l len) (primitive/isub n 1))
          (Some v)' \
  '(Some v)'
