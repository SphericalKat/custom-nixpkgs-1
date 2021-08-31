#!/usr/bin/env bash

set -euxo pipefail

declare -a ITEMS=(
  adb-sync
  adx
  fclones
  gdrive
  git-quickfix
  lychee
  natls
  pidcat
  rust-script
)

PKG="${1:-}"
VERSION="${2:-}"

if [ -z "${PKG}" ]; then
  for item in "${ITEMS[@]}"; do
    nix-update --commit --build "${item}"
  done
elif [ -z "${VERSION}" ]; then
  nix-update --commit --build "${PKG}"
else
  nix-update --commit --build "${PKG}" --version "${VERSION}"
fi
