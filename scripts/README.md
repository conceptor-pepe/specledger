# Scripts

These scripts are the execution layer of SpecLedger.

They should remain reusable across repositories and CI environments.

## Core Scripts

- `specledger-new-change.sh`
- `specledger-verify.sh`
- `specledger-archive.sh`
- `specledger-check-pr.sh`
- `check.sh`
- `release-preflight.sh`
- `extract-standalone.sh`

## Rule

Scripts enforce workflow mechanics. They should avoid embedding product-specific business logic.
