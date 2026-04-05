# Quick Start

## 1. Initialize A Repository

```bash
specledger/install/init.sh --target /path/to/repo --profile backend-brownfield
```

If you want a lighter setup, use:

```bash
specledger/install/init.sh --target /path/to/repo --profile minimal
specledger/install/init.sh --target /path/to/repo --profile go-service --tool cursor
```

## 2. Create A Change

```bash
/path/to/repo/scripts/specledger-new-change.sh add-team-credit-flow
```

## 3. Prepare The Brief

Use your adapter command:

- `specledger:new-change`
- `specledger:spec-brief`

Then fill:

- `spec-delta.md`
- `design.md`
- `tasks.md`

## 4. Verify Before Delivery

```bash
/path/to/repo/scripts/specledger-verify.sh /path/to/repo/docs/changes/<date>-add-team-credit-flow
```

## 5. Archive

```bash
/path/to/repo/scripts/specledger-archive.sh /path/to/repo/docs/changes/<date>-add-team-credit-flow
```
