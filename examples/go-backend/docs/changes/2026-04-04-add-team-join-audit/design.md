# Design: 2026-04-04-add-team-join-audit

## Overview

Add a team join audit write path after successful invitation acceptance.

## Data Structures

- tables/models: team join audit record
- DTOs: none
- data flow: invitation accepted -> membership created -> audit event written

## API Contract

- routes: none
- request: none
- response: none
- errors: audit write failure should be visible to operators

## Module Coupling

- call chain: team invitation service -> team membership flow -> audit writer
- cross-module dependencies: none
- reuse points: existing team membership success event

## Transactions And Constraints

- transaction boundary: membership success and audit creation should remain consistent
- lock order: unchanged
- idempotency: avoid duplicate join audit events
- invariants: successful team join must produce one audit record

## Compatibility

- backward compatibility: no API contract change
- migration: none
- rollout or switch: direct rollout
