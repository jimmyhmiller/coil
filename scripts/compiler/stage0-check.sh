# Shared by the four rebootstrap scripts. Source it, then call `stage0_check`.
#
# Every rebootstrap defaults STAGE0 to the committed seed — the one artifact
# guaranteed to be older than the source it is about to compile. When a language
# or stdlib change lands that the compiler itself uses, that default is exactly
# the binary that cannot build the tree, and stage1 dies with an ordinary-looking
# error pointing at some arbitrary source line:
#
#     error: import 'coil.primitive': not found      (namespace migration)
#     error: arm '_': expected a bind vector         (match catch-all arms)
#
# Both read as "the compiler is broken" rather than "your stage0 predates this
# syntax", which is a genuinely expensive misdiagnosis — it has cost time on both
# macOS and Linux. This probes the candidate BEFORE the real build and, on
# failure, says which of the two it is.

# stage0_check <stage0-binary> <seed-path> <src> [extra args passed to check…]
stage0_check() {
  local stage0="$1" seed="$2" src="$3"; shift 3
  local out
  # Stage 0 necessarily carries yesterday's bundled-module manifest. Let this
  # one compatibility probe discover newly added source-tree namespaces; the
  # compiler it produces embeds today's manifest and all later stages run with
  # strict bundle checking again.
  out=$(COIL_STRICT_BUNDLE=0 "$stage0" check "$src" "$@" 2>&1)
  [ $? -eq 0 ] && return 0

  echo "stage0 cannot compile the current source tree." >&2
  echo >&2
  echo "$out" | head -6 >&2
  echo >&2
  if [ "$stage0" = "$seed" ]; then
    cat >&2 <<EOF
This is the COMMITTED SEED, and it is too old for this tree. A seed embeds the
stdlib and the syntax it was built with, so any change the compiler itself
depends on makes the seed unable to rebuild the tree that ships it.

Fix: build a stage0 from a newer compiler and pass it explicitly —

    STAGE0=/path/to/newer/coil $0

then re-bless this seed in the same commit as the change that broke it, so the
next clean bootstrap works. On a host with no newer compiler, cross-emit one:

    coil emit-ir src/compiler/main.coil --target <triple>

(see bootstrap/seeds/native/linux-ir/NOTES.md for the link recipe).
EOF
  else
    cat >&2 <<EOF
STAGE0 was set explicitly to a binary that cannot build this tree. If it is
older than a language or stdlib change here, use a newer one; the committed seed
at $seed is not necessarily newer.
EOF
  fi
  return 1
}
