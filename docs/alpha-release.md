# Alpha Release: 0.1.0-alpha.1

## Release Goal

Ship the first public SpecLedger alpha as a working repository prototype.

This release is not about completeness. It is about proving that SpecLedger is already a coherent product:

- installable
- profile-driven
- adapter-aware
- script-backed
- reviewable as a standalone repository

## What This Alpha Includes

- core SpecLedger README and product positioning
- semantic versioning via `VERSION`
- three installable profiles:
  - `minimal`
  - `go-service`
  - `backend-brownfield`
- repository init flow with optional tool selection
- Cursor, GitHub Copilot, and Codex adapter prototypes
- workflow scripts:
  - change creation
  - verify
  - archive pre-check
  - PR gate check
- repository self-check and release preflight
- example repository snapshot

## What This Alpha Does Not Include

- a separate public repository yet
- a stable adapter installation story for every tool
- full CI/release automation outside the prototype
- a polished website or documentation portal
- multiple complete example applications

## Release Message

Suggested external framing:

> SpecLedger is a gate-driven engineering framework for AI-assisted software development. This alpha release introduces the first installable repository prototype, with profiles, workflow scripts, and multi-tool adapters.

For a copy-ready release body, see:

- `docs/release-notes-0.1.0-alpha.1.md`
- `docs/release-body-0.1.0-alpha.1.md`

## Validation Before Release

- run `specledger/scripts/check.sh`
- run `specledger/scripts/release-preflight.sh`
- verify `specledger/scripts/extract-standalone.sh` produces a valid standalone root
- verify install flows for `minimal`, `go-service`, and `backend-brownfield`
- review README, profiles, and quick start for public readability

## Exit Criteria

This alpha is ready when:

- all release-preflight checks pass
- README is understandable without private team context
- profiles and init flow are demonstrated by the example repo
- maintainers agree on the first public positioning
