#!/usr/bin/env bash
# link-host-linux.sh ROOT OBJECT OUTDIR
# Link OBJECT (ROOT's src/compiler/main.coil emitted by any backend) into a
# working compiler OUTDIR/bin/coil on x86-64 Linux, and prove it works.
#
# The link line is the one `coil build src/compiler/main.coil --link-flag
# -L$LIBDIR --link-flag -Wl,-rpath,$LIBDIR --link-flag -lLLVM --link-flag -lm`
# hands to cc on Linux (captured by pointing COIL_CC at a logging wrapper; the
# code is append-bundled-curl! and the final link in src/compiler/driver.coil):
#
#   cc OBJ -o OUT -Wl,--gc-sections <the --link-flag values>
#      libcurl.a libmbedtls.a libmbedx509.a libmbedcrypto.a
#      -lz -lpthread -Wl,--gc-sections -lm
#
# The compiler finds its library by walking up from its own location, so OUTDIR
# gets lib/coil/{stdlib,compiler,prelude.coil} and bin/native as symlinks into
# ROOT, and bin/coil.toolchain is ROOT's stamp (the sources the object came from).
set -euo pipefail
[ $# -eq 3 ] || { echo "usage: link-host-linux.sh ROOT OBJECT OUTDIR" >&2; exit 2; }
R=$(realpath "$1"); OBJ=$(realpath "$2"); mkdir -p "$3"; O=$(realpath "$3")
[ "$(uname -s)-$(uname -m)" = Linux-x86_64 ] || { echo "link-host-linux.sh: x86-64 Linux only" >&2; exit 2; }
[ -f "$R/src/compiler/main.coil" ] || { echo "link-host-linux.sh: $R is not a Coil checkout" >&2; exit 2; }
LLVM_CONFIG=${LLVM_CONFIG:-llvm-config-21}
LIBDIR=$("$LLVM_CONFIG" --libdir)
[ -e "$LIBDIR/libLLVM.so" ] || { echo "link-host-linux.sh: no libLLVM.so in $LIBDIR" >&2; exit 1; }
A=$R/build/bin/native/curl/x86_64-linux
for l in curl mbedtls mbedx509 mbedcrypto; do
  [ -f "$A/lib$l.a" ] || { echo "link-host-linux.sh: missing $A/lib$l.a (scripts/native/build-curl.sh)" >&2; exit 1; }
done
unset_coil=(); for v in $(compgen -e | grep '^COIL_' || true); do unset_coil+=(-u "$v"); done
clean() { env "${unset_coil[@]}" COIL_LIBRARY_STATE=0 "$@"; }

mkdir -p "$O/bin" "$O/lib/coil"
ln -sfn "$R/src/stdlib" "$O/lib/coil/stdlib"
ln -sfn "$R/src/compiler" "$O/lib/coil/compiler"
ln -sfn "$R/src/compiler/prelude.coil" "$O/lib/coil/prelude.coil"
ln -sfn "$R/build/bin/native" "$O/bin/native"
link=(cc "$OBJ" -o "$O/bin/coil.linking" -Wl,--gc-sections
      "-L$LIBDIR" "-Wl,-rpath,$LIBDIR" -lLLVM -lm
      "$A/libcurl.a" "$A/libmbedtls.a" "$A/libmbedx509.a" "$A/libmbedcrypto.a"
      -lz -lpthread -Wl,--gc-sections -lm)
printf '%s\n' "${link[@]}" > "$O/link-command.txt"
clean "${link[@]}"
mv "$O/bin/coil.linking" "$O/bin/coil"
python3 "$R/scripts/compiler/toolchain_stamp.py" stamp > "$O/bin/coil.toolchain"

# The host must be a working compiler: it reports its version, and a program it
# builds (its own default backend, then run) prints what it should.
version=$(clean "$O/bin/coil" --version)
mkdir -p "$O/check"
printf '(defn main [] (-> i64)\n  (println "hello from the linked host")\n  0)\n' > "$O/check/hello.coil"
(cd "$O/check" && clean "$O/bin/coil" build hello.coil -o "$O/check/hello" > "$O/check/build.log" 2>&1) \
  || { echo "link-host-linux.sh: the linked host failed to build hello world:" >&2; cat "$O/check/build.log" >&2; exit 1; }
said=$("$O/check/hello")
[ "$said" = "hello from the linked host" ] \
  || { echo "link-host-linux.sh: hello world printed '$said'" >&2; exit 1; }
echo "linked $O/bin/coil ($version; hello world ok)"
