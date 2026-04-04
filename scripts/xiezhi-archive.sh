#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: xiezhi/scripts/xiezhi-archive.sh <change-dir>" >&2
  exit 1
fi

change_dir="${1%/}"
for file in spec-delta.md audit.md test-review.md commit-summary.md archive.md; do
  if [[ ! -f "$change_dir/$file" ]]; then
    echo "Missing file: $change_dir/$file" >&2
    exit 1
  fi
done

echo "Archive pre-check passed: $change_dir"
echo "Next: update specs and move the directory into archive."
