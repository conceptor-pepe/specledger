# Commit Summary: 2026-04-04-add-team-join-audit

## Background

Add an audit trail to make successful team joins easier to trace.

## File Summary

| File | Summary |
|------|---------|
| `docs/specs/team/business.md` | add join audit requirement |
| `docs/changes/2026-04-04-add-team-join-audit/*` | record the change lifecycle |

## Key Design Points

- keep the first version synchronous
- require idempotent audit writes

## Validation

- build: pass
- lint: pass
- test: pass
- audit: pass

## Test Review

- cases: 2
- fixed issues: 0
- optional follow-ups: 1

## Suggested Commit Message

```text
feat(team): add team join audit trail

- add a team join audit requirement
- document validation and review flow
```
