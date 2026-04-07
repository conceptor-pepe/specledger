# Test Review Policy

> Repository-level white-box / black-box review policy. This defines what a "complete" `test-review.md` means for this project.

## Purpose

- define required test thinking for this repository
- describe which evidence is sufficient for `pass`, `risk`, and `fail`
- encode project-specific regression hotspots

## Required Review Dimensions

| Dimension ID | Dimension | Required For | Evidence Standard |
|-------------|-----------|--------------|-------------------|
| `TEST-DIM-001` | `happy path` | `all changes` | `must identify the main success path and its expected evidence` |
| `TEST-DIM-002` | `error path` | `all backend behavior changes` | `must inspect operator-visible failure handling, not only return values` |
| `TEST-DIM-003` | `boundary / invalid input` | `all API / DTO / stateful changes` | `must cover zero values, nils, duplicates, empty input, or permissions as applicable` |
| `TEST-DIM-004` | `idempotency / retry / concurrency` | `writes, async flow, callbacks, migrations` | `must review duplicate execution and partial-failure behavior` |
| `TEST-DIM-EXTRA-*` | `<project-specific>` | `<when>` | `<what counts as enough evidence>` |

## Case Design Rules

- every `CASE-*` must map to:
  - at least one `TASK-*`
  - at least one `REQ-*` or justified N/A
- add project-specific mandatory dimensions:
  - `<quota calculation>`
  - `<migration rollback>`
  - `<cross-tenant isolation>`

## Result Semantics

- `pass`: `<project-specific meaning>`
- `risk`: `<project-specific meaning>`
- `fail`: `<project-specific meaning>`

## Regression Watchlist

- modules with fragile behavior:
  - `<module-a>`
  - `<module-b>`
- scenarios that must always be reviewed:
  - `<duplicate callback>`
  - `<partial rollback>`

## Release Blocking Rules

- release must be blocked when:
  - `<critical dimension missing>`
  - `<risk level exceeds threshold>`
- release may proceed with risk when:
  - `<allowed condition>`

## Change Control

- owner: `<team / role>`
- last reviewed: `<YYYY-MM-DD>`
