#!/bin/sh
set -eu

# Build the exact, deliberately small libcurl used by Coil's hosted HTTP client.
# The output is a static archive; HTTP-free programs never reference it and the
# linker therefore copies none of it into their executable. Every object is
# position-independent: `coil build --shared` links these same archives into a
# shared library, and ELF refuses absolute/PC32 relocations there.
CURL_VERSION=8.21.0
CURL_SHA256=aa1b66a70eace83dc624508745646c08ae561de512ab403adffb93ac87fc72e6
MBEDTLS_VERSION=3.6.6
MBEDTLS_SHA256=8fb65fae8dcae5840f793c0a334860a411f884cc537ea290ce1c52bb64ca007a

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
machine=$(uname -m)
system=$(uname -s)

case "$system" in
  Darwin) target="$machine-macos" ;;
  Linux) target="$machine-linux" ;;
  *) echo "build-curl: $system is not supported" >&2; exit 1 ;;
esac

output_dir="$repo_dir/build/bin/native/curl/$target"
work_dir=$(mktemp -d)
trap 'rm -rf "$work_dir"' EXIT HUP INT TERM
archive="$work_dir/curl.tar.xz"
source_dir="$work_dir/source"
build_dir="$work_dir/build"

mkdir -p "$source_dir" "$build_dir" "$output_dir"
curl -fsSL "https://curl.se/download/curl-$CURL_VERSION.tar.xz" -o "$archive"
sha256() {
  if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | awk '{print $1}'
  else shasum -a 256 "$1" | awk '{print $1}'
  fi
}
actual=$(sha256 "$archive")
if [ "$actual" != "$CURL_SHA256" ]; then
  echo "build-curl: curl archive checksum mismatch" >&2
  exit 1
fi
tar -xf "$archive" -C "$source_dir" --strip-components=1

cd "$build_dir"
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
tls_args="--with-mbedtls=$mbed_install"

CFLAGS="$size_cflags" "$source_dir/configure" \
  --disable-shared --enable-static --with-pic $tls_args \
  --without-libpsl --without-zstd --without-brotli --without-libidn2 \
  --without-libssh2 --without-nghttp2 --disable-ldap --disable-ldaps \
  --disable-ftp --disable-file --disable-dict --disable-gopher \
  --disable-imap --disable-mqtt --disable-pop3 --disable-rtsp \
  --disable-smb --disable-smtp --disable-telnet --disable-tftp \
  --disable-manual --disable-docs --disable-debug --enable-optimize \
  --disable-dependency-tracking
make -C lib -j"$(sysctl -n hw.logicalcpu 2>/dev/null || echo 4)"
cp lib/.libs/libcurl.a "$output_dir/libcurl.a"
cp "$mbed_install/lib/libmbedtls.a" "$output_dir/libmbedtls.a"
cp "$mbed_install/lib/libmbedx509.a" "$output_dir/libmbedx509.a"
cp "$mbed_install/lib/libmbedcrypto.a" "$output_dir/libmbedcrypto.a"

# Prove the archives link into a shared object, whole, the way a --shared Coil
# build uses them; a non-PIC object fails here instead of in a user's link.
if [ "$system" = Linux ]; then
  "${CC:-cc}" -shared -o "$work_dir/pic-probe.so" \
    -Wl,--whole-archive "$output_dir/libcurl.a" "$output_dir/libmbedtls.a" \
    "$output_dir/libmbedx509.a" "$output_dir/libmbedcrypto.a" -Wl,--no-whole-archive \
    -lz -lpthread || {
    echo "build-curl: the bundled archives do not link into a shared object (not PIC?)" >&2
    exit 1
  }
fi

echo "built $output_dir"
ls -lh "$output_dir"/*.a
