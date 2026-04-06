# Spec Delta: 2026-04-04-add-team-join-audit

## Affected Specs

- `docs/specs/team/business.md`

## ADDED

### Requirement: Team Join Audit

- requirement id: `REQ-001`
- related design ids: `DES-001`, `DES-002`, `DES-003`
- related task ids: `TASK-001`, `TASK-002`

The system MUST record an audit event when a user joins a team.

#### Scenario: Successful join

- WHEN a user accepts a valid invitation
- THEN an audit event is recorded

#### Scenario: Retry join success event

- WHEN the successful join flow is retried with the same event key
- THEN the system does not create duplicate audit records

## MODIFIED

### Requirement: Team Join Completion

- requirement id: `REQ-002`
- related design ids: `DES-003`
- related task ids: `TASK-001`

The system MUST treat the join transaction and audit write as one consistent success path in the first version.

#### Scenario: Audit write failure

- WHEN the membership creation succeeds but audit persistence fails
- THEN operators can observe the failure and the flow is not silently accepted

## Notes

- first version keeps synchronous write behavior to avoid adding an async delivery channel
- audit record uses a stable event key to preserve idempotency across retries
