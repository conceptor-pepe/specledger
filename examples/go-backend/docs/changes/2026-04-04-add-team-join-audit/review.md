# Review: 2026-04-04-add-team-join-audit

## Findings

### Finding 1

- severity: low
- location: team join flow
- issue: duplicate write risk if retries are not idempotent
- resolution: require a stable join event key for audit writes

## Open Questions

- should audit writes be asynchronous in a future revision?

## Decisions

- keep audit creation synchronous in the first version
