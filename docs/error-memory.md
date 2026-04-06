# Error Memory

This file stores recurring deviation patterns found during implementation, review, and test review.

## Purpose

- turn one-off mistakes into repository rules
- stop the same drift from reappearing in future changes
- make review findings feed templates and verification scripts

## Workflow

1. Record the deviation in the current change folder `error-memory.md`.
2. If the issue is reusable, sync the lesson into this file with a stable `MEM-*` ID.
3. Update at least one of: template, rule, verify script, example, or checklist.
4. Reference the applied lesson in the next relevant change.

## Canonical Lesson Format

- lesson id: `MEM-001`
- symptom: what drift happened
- root cause: why the team or tool allowed it
- prevention rule: what will now be required
- gate update: where the prevention was encoded
- status: `new` / `applied` / `retired`

## Lessons

### MEM-001

- symptom: change artifacts looked complete but were not traceable across requirements, design, tasks, review, and tests
- root cause: templates were generic and `verify` only checked file existence and coarse status
- prevention rule: all change artifacts must use stable traceability IDs and cross-reference them
- gate update: templates updated with `REQ-*`, `DES-*`, `TASK-*`, `REV-*`, `CASE-*`; `specledger-verify.sh` now checks cross-artifact references
- status: applied

### MEM-002

- symptom: task lists were stage checklists instead of smallest shippable slices
- root cause: `tasks.md` template described workflow phases but not delivery boundaries
- prevention rule: each task must declare its own goal, dependencies, touched files, acceptance criteria, test cases, and independent commit boundary
- gate update: `tasks.md` template upgraded and verified by `specledger-verify.sh`
- status: applied
