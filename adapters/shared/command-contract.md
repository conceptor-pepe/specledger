# Command Contract

All adapters must preserve the same command semantics.

## Commands

### `specledger:new-change`

Create a new change directory and scaffold required artifacts.

### `specledger:spec-brief`

Prepare `spec-delta.md`, `design.md`, and `tasks.md` before implementation.

### `specledger:verify`

Check audit, review, test review, and related docs before delivery.

### `specledger:commit-summary`

Generate the delivery-layer summary for the change.

### `specledger:archive`

Update long-term specs and complete archive records.

## Adapter Rule

Adapters may change transport or file format, but they must not change workflow meaning.
