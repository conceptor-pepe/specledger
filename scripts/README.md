# Scripts

These scripts are the execution layer of SpecLedger.

They should remain reusable across repositories and CI environments.

## Core Scripts

- `specledger-new-change.sh`
- `specledger-start.sh`
- `specledger-continue.sh`
- `specledger-approve.sh`
- `specledger-executor.sh`
- `specledger-driver.sh`
- `specledger-run.sh`
- `specledger-verify.sh`
- `specledger-archive.sh`
- `specledger-check-pr.sh`
- `specledger-workflow-lib.sh`
- `specld-start.sh`
- `specld-next.sh`
- `specld-approve.sh`
- `specld-exec.sh`
- `specld-run.sh`
- `check.sh`
- `release-preflight.sh`
- `extract-standalone.sh`

## Rule

Scripts enforce workflow mechanics. They should avoid embedding product-specific business logic.

`specledger-run.sh` is the preferred single-entry wrapper for stateful workflow driving.
