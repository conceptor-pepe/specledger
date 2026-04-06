# Install

## Repository Mode

Initialize a repository with a profile:

```bash
specledger/install/init.sh --target /path/to/repo --profile backend-brownfield
specledger/install/init.sh --target /path/to/repo --profile go-service --tool cursor
specledger/install/init.sh --target /path/to/repo --profile go-service --tool claude
specledger/install/init.sh --target /path/to/repo --profile backend-brownfield --tool cursor,claude,krio
specledger/install/init.sh --target /path/to/repo --profile minimal --tool none
```

Default profile:

- `backend-brownfield`

Available profiles:

- `minimal`
- `go-service`
- `backend-brownfield`

Tool install modes:

- `all`
- `none`
- `cursor`
- `copilot`
- `claude`
- `krio`
- comma-separated combinations such as `cursor,copilot`, `cursor,claude`, or `claude,krio`

## Global Adapter Mode

Some tools need global installation instead of repository-local files.

Example:

- Codex prompts can be installed to `$CODEX_HOME/prompts/` or `~/.codex/prompts/`

Use:

```bash
specledger/adapters/codex/install.sh
```

## Installed Repository Assets

The init script installs:

- `docs/templates/*`
- `docs/specs/README.md`
- `docs/changes/README.md`
- `.cursor/rules/specledger-spec.mdc`
- `.cursor/commands/specledger-*.md`
- `.github/prompts/specledger-*.prompt.md`
- `.claude/prompts/specledger-*.md`
- `.krio/prompts/specledger-*.md`
- `scripts/specledger-*.sh`
- `scripts/specld-*.sh`

See profile differences in `specledger/docs/profiles.md`.

Adapter usage details:

- `specledger/docs/adapters.md`
