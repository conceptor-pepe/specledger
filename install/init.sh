#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  specledger/install/init.sh --target <repo-dir> [--profile backend-brownfield] [--tool all]

Example:
  specledger/install/init.sh --target /path/to/repo
  specledger/install/init.sh --target /path/to/repo --profile minimal
  specledger/install/init.sh --target /path/to/repo --profile go-service --tool cursor
EOF
}

target_dir=""
profile="backend-brownfield"
tool_mode="all"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      shift
      target_dir="${1:-}"
      ;;
    --profile)
      shift
      profile="${1:-}"
      ;;
    --tool)
      shift
      tool_mode="${1:-}"
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
  shift
done

if [[ -z "$target_dir" ]]; then
  echo "--target is required" >&2
  usage
  exit 1
fi

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
manifest="$root_dir/profiles/$profile/manifest.tsv"

if [[ ! -f "$manifest" ]]; then
  echo "Profile manifest not found: $manifest" >&2
  echo "Available profiles:" >&2
  find "$root_dir/profiles" -mindepth 1 -maxdepth 1 -type d -printf '  - %f\n' >&2
  exit 1
fi

mkdir -p "$target_dir"

should_install_path() {
  local rel_dst="$1"

  case "$tool_mode" in
    all)
      return 0
      ;;
    none)
      case "$rel_dst" in
        .cursor/commands/*|.github/prompts/*)
          return 1
          ;;
      esac
      return 0
      ;;
    cursor)
      case "$rel_dst" in
        .github/prompts/*)
          return 1
          ;;
      esac
      return 0
      ;;
    copilot)
      case "$rel_dst" in
        .cursor/commands/*)
          return 1
          ;;
      esac
      return 0
      ;;
    cursor,copilot|copilot,cursor)
      return 0
      ;;
    *)
      echo "Unsupported --tool value: $tool_mode" >&2
      echo "Supported values: all, none, cursor, copilot, cursor,copilot" >&2
      exit 1
      ;;
  esac
}

while IFS=$'\t' read -r src rel_dst; do
  [[ -z "$src" ]] && continue
  if ! should_install_path "$rel_dst"; then
    continue
  fi
  src_path="$root_dir/$src"
  dst_path="$target_dir/$rel_dst"

  if [[ ! -f "$src_path" ]]; then
    echo "Missing source file: $src_path" >&2
    exit 1
  fi

  mkdir -p "$(dirname "$dst_path")"
  cp "$src_path" "$dst_path"
done < "$manifest"

mkdir -p "$target_dir/docs/changes/archive"

cat <<EOF
Initialized SpecLedger profile:
  profile: $profile
  tools: $tool_mode
  target: $target_dir

Installed:
  - docs/templates/*
  - docs/specs/README.md
  - docs/changes/README.md
  - .cursor/rules/specledger-spec.mdc
  - .cursor/commands/specledger-*.md
  - .github/prompts/specledger-*.prompt.md
  - scripts/specledger-*.sh

Next:
  1. review installed files
  2. install global adapters if needed
  3. create your first change
EOF
