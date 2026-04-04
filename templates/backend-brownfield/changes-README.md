# Changes

`changes/` stores the current change lifecycle.

Recommended structure:

```text
changes/
├── <yyyy-mm-dd-change-name>/
│   ├── change.md
│   ├── spec-delta.md
│   ├── design.md
│   ├── tasks.md
│   ├── review.md
│   ├── audit.md
│   ├── test-review.md
│   ├── commit-summary.md
│   └── archive.md
└── archive/
```

Use change folders for high-risk backend changes before implementation begins.
