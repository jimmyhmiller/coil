#!/usr/bin/env bash
# Check out the tpde backend's package (Coil.toml: tpde = { path = "../coil-tpde" })
# beside this checkout, at the commit scripts/native/tpde.rev pins. A checkout
# that already has ../coil-tpde (a developer's) is left alone.
set -euo pipefail
root=$(cd "$(dirname "$0")/../.." && pwd)
dest="$root/../coil-tpde"
rev=$(tr -d '[:space:]' < "$root/scripts/native/tpde.rev")
if [ -d "$dest/.git" ]; then
  echo "coil-tpde: using $dest ($(git -C "$dest" rev-parse --short HEAD))"
  exit 0
fi
git init -q "$dest"
git -C "$dest" fetch -q --depth 1 https://github.com/jimmyhmiller/coil-tpde.git "$rev"
git -C "$dest" checkout -q FETCH_HEAD
echo "coil-tpde: $dest at $rev"
