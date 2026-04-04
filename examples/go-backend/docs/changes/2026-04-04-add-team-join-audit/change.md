# Change: 2026-04-04-add-team-join-audit

## Background

Add an explicit audit trail when a user joins a team.

## Scope

- add join audit record behavior

## Non-Goals

- no billing changes

## Impact

- Modules: team
- APIs: N/A
- Data: team audit record

## Risks

- event duplication

## Rollback

Disable the write path and revert the audit record consumer if needed.
