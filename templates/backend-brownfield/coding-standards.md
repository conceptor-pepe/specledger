# Coding Standards Policy

> Repository-level coding standards. Keep this file specific to the codebase instead of copying a generic global rule set.

## Purpose

- define the local code quality bar
- capture project-specific conventions that global tool rules do not know
- provide the baseline referenced by `review.md` and `audit.md`

## Language And Framework Scope

- languages:
  - `<go>`
  - `<typescript>`
- frameworks / runtimes:
  - `<gin / gorm / grpc / react / celery>`

## Architectural Conventions

- module boundaries:
  - `<who may call whom>`
- transaction ownership:
  - `<where transactions start/end>`
- error ownership:
  - `<where errors must be logged / wrapped / translated>`
- observability ownership:
  - `<where logs / metrics / tracing are mandatory>`

## Local Coding Rules

| Rule ID | Area | Rule | Why It Exists | Enforcement |
|--------|------|------|---------------|-------------|
| `CODE-001` | `public functions` | `Go doc comments must include intent and @param / @return where needed` | `keeps APIs readable and reviewable` | `go-audit + review` |
| `CODE-002` | `functions` | `prefer short functions, early returns, and low nesting` | `reduces hidden branch bugs` | `go-audit + review` |
| `CODE-003` | `service / handler` | `error branches must log with enough business context` | `prevents silent production failures` | `go-audit + review` |
| `CODE-004` | `critical writes` | `success paths should emit traceable info logs` | `improves auditability and ops replay` | `go-audit + review` |
| `CODE-EXTRA-*` | `<project-specific>` | `<rule>` | `<reason>` | `<review / script / both>` |

## Naming / Data / API Rules

- identifiers:
  - `<naming constraint>`
- DTO / schema compatibility:
  - `<backward compatibility rule>`
- persistence invariants:
  - `<must not break data assumptions>`

## Allowed Exceptions

| Exception ID | Scenario | Approval | How To Mark It |
|-------------|----------|----------|----------------|
| `CODE-EX-001` | `<high-frequency hot path>` | `<owner>` | `<inline marker / review note>` |

## Change Control

- owner: `<team / role>`
- last reviewed: `<YYYY-MM-DD>`
