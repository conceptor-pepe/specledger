#!/usr/bin/env bash

set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
version_file="$root_dir/VERSION"

if [[ ! -f "$version_file" ]]; then
  echo "Missing VERSION file" >&2
  exit 1
fi

version="$(tr -d ' \n\t' < "$version_file")"
if [[ -z "$version" ]]; then
  echo "VERSION is empty" >&2
  exit 1
fi

echo "Running release preflight for version: $version"
"$root_dir/scripts/check.sh"

if ! rg -n "$version" "$root_dir/CHANGELOG.md" >/dev/null 2>&1; then
  echo "Version '$version' not mentioned in CHANGELOG.md" >&2
  exit 1
fi

echo "Release preflight passed for version: $version"
