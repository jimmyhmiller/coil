#!/usr/bin/env bash
# mkhost-linux.sh ROOT COMPILER BACKEND OUTDIR [NAME=VALUE ...]
# With COMPILER, emit ROOT's src/compiler/main.coil to an object using BACKEND
# (-O3 --no-debug, default threads), and link it into a working compiler
# OUTDIR/bin/coil (link-host-linux.sh). NAME=VALUE settings (for example
# COIL_STOGIR_INLINE=small=80) are added to the environment of the emits.
#
# Prints, for the emit:
#   generation wall    the --timings spans of the default-thread emit that made
#                      the linked object (benchlib.py generation_wall says which spans)
#   generation serial  the sum of the BACKEND `coil-codegen` records of a second
#                      emit under COIL_TPDE_SERIAL=1 COIL_CODEGEN_TIMINGS=1
#                      (MKHOST_SERIAL=0 skips that emit and says so)
#   the sha256 of the linked object, and whether the serial emit made the same one
set -euo pipefail
[ $# -ge 4 ] || { echo "usage: mkhost-linux.sh ROOT COMPILER BACKEND OUTDIR [NAME=VALUE ...]" >&2; exit 2; }
T=$(dirname "$(realpath "$0")")
R=$(realpath "$1"); C=$(realpath "$2"); B=$3; mkdir -p "$4"; O=$(realpath "$4"); shift 4
for s in "$@"; do
  [[ $s =~ ^[A-Za-z_][A-Za-z0-9_]*=.*$ ]] || { echo "mkhost-linux.sh: not NAME=VALUE: $s" >&2; exit 2; }
done
[ -x "$C" ] || { echo "mkhost-linux.sh: $C is not executable" >&2; exit 2; }
unset_coil=(); for v in $(compgen -e | grep '^COIL_' || true); do unset_coil+=(-u "$v"); done
cd "$R"
emit=(emit-obj src/compiler/main.coil --backend "$B" -O3 --no-debug --timings)

env "${unset_coil[@]}" COIL_LIBRARY_STATE=0 "$@" "$C" "${emit[@]}" -o "$O/host.o" \
  > "$O/emit.out" 2> "$O/emit.err" \
  || { echo "mkhost-linux.sh: emit failed; see $O/emit.err" >&2; tail -5 "$O/emit.err" >&2; exit 1; }
python3 "$T/benchlib.py" wall "$B" "$O/emit.out" "$O/emit.err"
digest=$(sha256sum "$O/host.o" | cut -d' ' -f1)

if [ "${MKHOST_SERIAL:-1}" = 0 ]; then
  echo "generation serial: not measured (MKHOST_SERIAL=0)"
else
  env "${unset_coil[@]}" COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 COIL_CODEGEN_TIMINGS=1 "$@" \
    "$C" "${emit[@]}" -o "$O/serial.o" > "$O/serial.out" 2> "$O/serial.err" \
    || { echo "mkhost-linux.sh: serial emit failed; see $O/serial.err" >&2; exit 1; }
  python3 "$T/benchlib.py" serial "$B" "$O/serial.out" "$O/serial.err"
  serial=$(sha256sum "$O/serial.o" | cut -d' ' -f1)
  if [ "$serial" = "$digest" ]; then echo "serial emit object: identical"
  else echo "serial emit object: DIFFERENT ($serial)"; fi
fi
echo "object sha256 $digest"
echo "$*" > "$O/settings.txt"
"$T/link-host-linux.sh" "$R" "$O/host.o" "$O"
