# Command Contract

All adapters must preserve the same command semantics.

## Commands

### `xiezhi:new-change`

Create a new change directory and scaffold required artifacts.

### `xiezhi:spec-brief`

Prepare `spec-delta.md`, `design.md`, and `tasks.md` before implementation.

### `xiezhi:verify`

Check audit, review, test review, and related docs before delivery.

### `xiezhi:commit-summary`

Generate the delivery-layer summary for the change.

### `xiezhi:archive`

Update long-term specs and complete archive records.

## Adapter Rule

Adapters may change transport or file format, but they must not change workflow meaning.
