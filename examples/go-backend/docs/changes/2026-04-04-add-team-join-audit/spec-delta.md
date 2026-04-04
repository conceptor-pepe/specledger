# Spec Delta: 2026-04-04-add-team-join-audit

## Affected Specs

- `specs/team/business.md`

## ADDED

### Requirement: Team Join Audit

The system MUST record an audit event when a user joins a team.

#### Scenario: Successful join

- WHEN a user accepts a valid invitation
- THEN an audit event is recorded
