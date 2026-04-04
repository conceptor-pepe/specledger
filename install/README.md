# Install

## Repository Mode

Initialize a repository with a profile:

```bash
xiezhi/install/init.sh --target /path/to/repo --profile backend-brownfield
xiezhi/install/init.sh --target /path/to/repo --profile go-service --tool cursor
xiezhi/install/init.sh --target /path/to/repo --profile minimal --tool none
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
- `cursor,copilot`

## Global Adapter Mode

Some tools need global installation instead of repository-local files.

Example:

- Codex prompts can be installed to `$CODEX_HOME/prompts/` or `~/.codex/prompts/`

Use:

```bash
xiezhi/adapters/codex/install.sh
```

## Installed Repository Assets

The init script installs:

- `docs/templates/*`
- `docs/specs/README.md`
- `docs/changes/README.md`
- `.cursor/rules/xiezhi-spec.mdc`
- `.cursor/commands/xiezhi-*.md`
- `.github/prompts/xiezhi-*.prompt.md`
- `scripts/xiezhi-*.sh`

See profile differences in `xiezhi/docs/profiles.md`.
