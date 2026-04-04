#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: xiezhi/scripts/xiezhi-verify.sh <change-dir>" >&2
  exit 1
fi

change_dir="${1%/}"
required=(
  change.md
  spec-delta.md
  design.md
  tasks.md
  audit.md
  test-review.md
  commit-summary.md
)

for file in "${required[@]}"; do
  if [[ ! -f "$change_dir/$file" ]]; then
    echo "Missing file: $change_dir/$file" >&2
    exit 1
  fi
done

if rg -n '<[^>]+>' "$change_dir" >/dev/null 2>&1; then
  echo "Placeholders remain in $change_dir" >&2
  exit 1
fi

echo "Verify passed: $change_dir"
