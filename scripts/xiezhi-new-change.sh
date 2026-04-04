#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  xiezhi/scripts/xiezhi-new-change.sh <change-name>
  xiezhi/scripts/xiezhi-new-change.sh <change-name> --date YYYY-MM-DD
EOF
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

change_name="$1"
shift
change_date="$(date +%F)"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --date)
      shift
      change_date="${1:-}"
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
  shift
done

if [[ ! "$change_name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  echo "change-name must use kebab-case" >&2
  exit 1
fi

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
change_dir="$root_dir/examples/go-backend/changes/${change_date}-${change_name}"
template_dir="$root_dir/templates/backend-brownfield"

mkdir -p "$change_dir"

for name in change spec-delta tasks; do
  sed "s/<change-name>/${change_date}-${change_name}/g" "$template_dir/$name.md" >"$change_dir/$name.md"
done

cat >"$change_dir/design.md" <<EOF
# Design: ${change_date}-${change_name}

## Overview

<fill design details>
EOF

for file in review.md audit.md test-review.md commit-summary.md archive.md; do
  cat >"$change_dir/$file" <<EOF
# ${file%.md}: ${change_date}-${change_name}

<fill content>
EOF
done

echo "Created change: $change_dir"
