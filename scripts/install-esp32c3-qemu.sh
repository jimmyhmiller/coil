#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

release=esp-develop-9.2.2-20260417
case "$(uname -s):$(uname -m)" in
  Darwin:arm64)
    platform=aarch64-apple-darwin
    sha=67bff66ff7158f272ce167fc211c0f8f4c1a79b6f6174350678a6d5035644b30 ;;
  Darwin:x86_64)
    platform=x86_64-apple-darwin
    sha=a47c38c6e2eb9f5028eda9585dce999ce02b8983a2cdf71c48cfb10a14ae25fe ;;
  Linux:aarch64|Linux:arm64)
    platform=aarch64-linux-gnu
    sha=a9f7b98636008edcf7a11c96f10b3a3ec83c2a890fc54c3e3ceb3ec9edace427 ;;
  Linux:x86_64)
    platform=x86_64-linux-gnu
    sha=547f03e04701a92cbb699f7f7d015adc1f5b5ef93cbb94c0dd9b7107e2d84e77 ;;
  *) echo "unsupported host: $(uname -s) $(uname -m)" >&2; exit 1 ;;
esac

archive="qemu-riscv32-softmmu-${release//-/_}-${platform}.tar.xz"
url="https://github.com/espressif/qemu/releases/download/$release/$archive"
destination="$PWD/build/toolchains/qemu-esp32c3"
temporary="$(mktemp -d)"
trap 'rm -rf "$temporary"' EXIT

echo "+ download $url"
curl --fail --location --retry 3 "$url" --output "$temporary/$archive"
actual="$(shasum -a 256 "$temporary/$archive" | awk '{print $1}')"
if [[ "$actual" != "$sha" ]]; then
  echo "QEMU checksum mismatch: expected $sha, got $actual" >&2
  exit 1
fi

mkdir -p "$destination"
tar -xJf "$temporary/$archive" -C "$destination"
binary="$destination/qemu/bin/qemu-system-riscv32"
[[ -x "$binary" ]] || { echo "archive did not contain $binary" >&2; exit 1; }
"$binary" -machine help | grep -q esp32c3
echo "installed Espressif QEMU: $binary"
