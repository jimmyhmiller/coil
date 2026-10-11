#!/bin/sh
set -eu

# Build the exact, deliberately small libcurl used by Coil's hosted HTTP client.
# The output is a static archive; HTTP-free programs never reference it and the
# linker therefore copies none of it into their executable. Every object is
# position-independent: `coil build --shared` links these same archives into a
# shared library, and ELF refuses absolute/PC32 relocations there.
#
# The archives are a function of the pinned sources below and of this script, so
# one build serves every checkout and worktree on the machine. It is kept in
# `$XDG_CACHE_HOME/coil` (else `~/.cache/coil`) under a key naming both versions
# and this script's own hash, and copied from there into this checkout's
# build/bin/native/curl/<target>. A cached build costs a copy, so the bootstrap
# runs this every time (scripts/compiler/stage-lib.sh); an edit to this file
# changes the key and builds afresh.
CURL_VERSION=8.21.0
CURL_SHA256=aa1b66a70eace83dc624508745646c08ae561de512ab403adffb93ac87fc72e6
MBEDTLS_VERSION=3.6.6
MBEDTLS_SHA256=8fb65fae8dcae5840f793c0a334860a411f884cc537ea290ce1c52bb64ca007a
ARCHIVES="libcurl.a libmbedtls.a libmbedx509.a libmbedcrypto.a"

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
machine=$(uname -m)
system=$(uname -s)

case "$system" in
  Darwin) target="$machine-macos" ;;
  Linux) target="$machine-linux" ;;
  *) echo "build-curl: $system is not supported" >&2; exit 1 ;;
esac

sha256() {
  if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | awk '{print $1}'
  else shasum -a 256 "$1" | awk '{print $1}'
  fi
}

script_hash=$(sha256 "$repo_dir/scripts/native/build-curl.sh" | cut -c1-16)
cache_root=${XDG_CACHE_HOME:-$HOME/.cache}/coil/native/curl
entry="$cache_root/curl-$CURL_VERSION-mbedtls-$MBEDTLS_VERSION-$script_hash/$target"
output_dir="$repo_dir/build/bin/native/curl/$target"

# Removed on every exit; `staged` is emptied once the cache owns it.
work_dir=""
staged=""
trap 'rm -rf "$work_dir" "$staged"' EXIT
trap 'exit 1' HUP INT TERM

complete() {
  for a in $ARCHIVES; do [ -f "$1/$a" ] || return 1; done
}

# Download, verify and build the archives into the directory $1.
build_into() {
  work_dir=$(mktemp -d)
  archive="$work_dir/curl.tar.xz"
  source_dir="$work_dir/source"
  build_dir="$work_dir/build"

  mkdir -p "$source_dir" "$build_dir"
  curl -fsSL "https://curl.se/download/curl-$CURL_VERSION.tar.xz" -o "$archive"
  [ "$(sha256 "$archive")" = "$CURL_SHA256" ] || {
    echo "build-curl: curl archive checksum mismatch" >&2; exit 1;
  }
  tar -xf "$archive" -C "$source_dir" --strip-components=1

  size_cflags="-Os -ffunction-sections -fdata-sections -fPIC"
  mbed_archive="$work_dir/mbedtls.tar.bz2"
  mbed_source="$work_dir/mbedtls-source"
  mbed_build="$work_dir/mbedtls-build"
  mbed_install="$work_dir/mbedtls-install"
  mkdir -p "$mbed_source" "$mbed_build" "$mbed_install"
  curl -fsSL "https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$MBEDTLS_VERSION/mbedtls-$MBEDTLS_VERSION.tar.bz2" -o "$mbed_archive"
  [ "$(sha256 "$mbed_archive")" = "$MBEDTLS_SHA256" ] || {
    echo "build-curl: mbedTLS archive checksum mismatch" >&2; exit 1;
  }
  tar -xf "$mbed_archive" -C "$mbed_source" --strip-components=1
  cmake -S "$mbed_source" -B "$mbed_build" \
    -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX="$mbed_install" \
    -DCMAKE_C_FLAGS="$size_cflags" -DCMAKE_POSITION_INDEPENDENT_CODE=On \
    -DUSE_SHARED_MBEDTLS_LIBRARY=Off -DUSE_STATIC_MBEDTLS_LIBRARY=On \
    -DENABLE_TESTING=Off -DENABLE_PROGRAMS=Off
  cmake --build "$mbed_build" --parallel 1
  cmake --install "$mbed_build"

  (cd "$build_dir" &&
    CFLAGS="$size_cflags" "$source_dir/configure" \
      --disable-shared --enable-static --with-pic --with-mbedtls="$mbed_install" \
      --without-libpsl --without-zstd --without-brotli --without-libidn2 \
      --without-libssh2 --without-nghttp2 --disable-ldap --disable-ldaps \
      --disable-ftp --disable-file --disable-dict --disable-gopher \
      --disable-imap --disable-mqtt --disable-pop3 --disable-rtsp \
      --disable-smb --disable-smtp --disable-telnet --disable-tftp \
      --disable-manual --disable-docs --disable-debug --enable-optimize \
      --disable-dependency-tracking &&
    make -C lib -j"$(sysctl -n hw.logicalcpu 2>/dev/null || echo 4)")
  cp "$build_dir/lib/.libs/libcurl.a" "$1/libcurl.a"
  cp "$mbed_install/lib/libmbedtls.a" "$1/libmbedtls.a"
  cp "$mbed_install/lib/libmbedx509.a" "$1/libmbedx509.a"
  cp "$mbed_install/lib/libmbedcrypto.a" "$1/libmbedcrypto.a"

  # Prove the archives link into a shared object, whole, the way a --shared Coil
  # build uses them; a non-PIC object fails here instead of in a user's link.
  if [ "$system" = Linux ]; then
    "${CC:-cc}" -shared -o "$work_dir/pic-probe.so" \
      -Wl,--whole-archive "$1/libcurl.a" "$1/libmbedtls.a" \
      "$1/libmbedx509.a" "$1/libmbedcrypto.a" -Wl,--no-whole-archive \
      -lz -lpthread || {
      echo "build-curl: the bundled archives do not link into a shared object (not PIC?)" >&2
      exit 1
    }
  fi
}

# The entry is published with one symlink(2), which fails when it already exists:
# checkouts building at once each finish whole, and the one that loses discards its
# copy. Nothing ever sees a half-written entry. `-n`, because without it `ln` treats
# an existing link to a directory as that directory and puts the loser's link inside.
if ! complete "$entry"; then
  mkdir -p "$(dirname "$entry")"
  staged=$(mktemp -d "$entry.XXXXXX")
  build_into "$staged"
  if ln -sn "$(basename "$staged")" "$entry" 2>/dev/null; then
    staged=""
    echo "built $entry"
  fi
  complete "$entry" || { echo "build-curl: $entry is incomplete" >&2; exit 1; }
fi

# Into this checkout, each archive written whole and renamed over the old one.
mkdir -p "$output_dir"
for a in $ARCHIVES; do
  if ! cmp -s "$entry/$a" "$output_dir/$a"; then
    cp "$entry/$a" "$output_dir/.$a.incoming"
    mv -f "$output_dir/.$a.incoming" "$output_dir/$a"
  fi
done
echo "bundled curl: $output_dir"
