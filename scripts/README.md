# Scripts

These scripts are the execution layer of Xiezhi.

They should remain reusable across repositories and CI environments.

## Core Scripts

- `xiezhi-new-change.sh`
- `xiezhi-verify.sh`
- `xiezhi-archive.sh`
- `xiezhi-check-pr.sh`
- `check.sh`
- `release-preflight.sh`
- `extract-standalone.sh`

## Rule

Scripts enforce workflow mechanics. They should avoid embedding product-specific business logic.
