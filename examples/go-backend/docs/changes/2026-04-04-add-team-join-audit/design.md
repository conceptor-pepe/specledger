# 2026-04-04-add-team-join-audit - Full Design (Phase 0.5: Step 1-4)

> This file is the phase 0.5 design source of truth for the current change.

---

## Step 1: Data Structure Design

### 1.0 Requirement Mapping

| Design ID | Requirement IDs | Summary |
|-----------|-----------------|---------|
| `DES-001` | `REQ-001` | 增加团队加入审计表及记录模型 |
| `DES-002` | `REQ-001` | 定义写入链路所需的事件字段和幂等键 |
| `DES-003` | `REQ-001`, `REQ-002` | 设计同步写入和失败可观测策略 |

### 1.1 Database Tables (new or changed)

#### Table `team_join_audit`

| Column | Type | Constraint | Description |
|--------|------|------------|-------------|
| `id` | bigint | PK | audit record id |
| `team_id` | bigint | NOT NULL | team id |
| `user_id` | bigint | NOT NULL | joined user id |
| `event_key` | varchar(64) | UNIQUE | idempotent join event key |
| `created_at` | datetime | NOT NULL | audit timestamp |

Schema decision:

- design id: `DES-001`
- related requirements: `REQ-001`
- migration / compatibility note: 新增独立审计表，不影响既有团队加入接口

### 1.2 Model Layer

| Design ID | Module | Change | Reason |
|-----------|--------|--------|--------|
| `DES-001` | `internal/team/model` | add `TeamJoinAuditRecord` model | 对齐审计表字段 |
| `DES-002` | `internal/team/service` | add audit write input containing `team_id`, `user_id`, `event_key` | 保证写入链路数据完整 |

### 1.3 DTO Layer

| Design ID | DTO | Direction | Fields | Notes |
|-----------|-----|-----------|--------|-------|
| `DES-002` | `JoinAuditEvent` | `internal` | `team_id`, `user_id`, `event_key` | 仅内部服务流转，不新增外部 API DTO |

### 1.4 Key Data Flow

```text
invitation accepted
  -> membership created
  -> build JoinAuditEvent with stable event_key
  -> audit repository writes team_join_audit
  -> operator-visible error if audit write fails
```

---

## Step 2: API Contract Definition

### 2.1 API List

No new API in the first version.

API mapping:

- design id: `DES-002`
- requirement ids: `REQ-001`
- impacted specs: `docs/specs/team/business.md`

### 2.2 Request Contract

No external request contract change in the first version.

### 2.3 Response Contract

No external response contract change in the first version.

### 2.4 Constraints

- audit write failures must be visible to operators
- no user-facing API contract changes
- join success retries must reuse the same event key
- first version keeps synchronous processing for simpler consistency

---

## Step 3: Module Coupling Analysis

### 3.1 Dependency Graph

```text
team invitation service
  -> membership flow
  -> audit writer
```

Coupling mapping:

- design id: `DES-003`
- related requirements: `REQ-001`, `REQ-002`
- owner module: `internal/team/service`

### 3.2 Coupling Analysis

| Shared Resource | Coupling Type | Direction | Risk | Mitigation |
|-----------------|---------------|-----------|------|------------|
| join success event | direct call | membership -> audit | duplicate writes on retry | stable event key |
| membership transaction result | synchronous dependency | membership -> audit | audit write failure hidden from operators | emit explicit error and log |

### 3.3 Shared Ownership

- owner: membership flow
- consumer: audit writer

### 3.4 Transaction And Constraints

- transaction boundary: membership success and audit creation should remain consistent
- lock order: unchanged
- idempotency: avoid duplicate join audit events
- consistency requirement: successful team join must produce one audit record
- failure visibility: audit persistence failure must be observable in logs or returned error path

---

## Step 4: Task Split

### 4.1 Execution Order

| Task ID | Goal | Design IDs | Dependency | Files | Independently Committable | Complexity |
|---------|------|------------|------------|-------|---------------------------|------------|
| `TASK-001` | 增加团队加入审计模型与同步写入路径 | `DES-001`, `DES-002`, `DES-003` | none | `internal/team/model`, `internal/team/service`, `internal/team/repository` | yes | medium |
| `TASK-002` | 回写变更文档、评审与测试结论 | `DES-003` | `TASK-001` | `docs/changes/...`, `docs/specs/team/business.md` | yes | low |

### 4.2 Acceptance Criteria

- `TASK-001`: successful team joins create one audit record
- `TASK-001`: retries do not create duplicate audit records
- `TASK-002`: docs artifacts and long-term spec stay consistent

### 4.3 Risk Points

- `RISK-001`: duplicate writes if retries do not reuse the same event key
- `RISK-002`: audit write failures become silent if they are swallowed in service flow

### 4.4 Review And Test Mapping

| Task ID | Requirement IDs | Review Focus | Test Case IDs |
|---------|-----------------|--------------|---------------|
| `TASK-001` | `REQ-001`, `REQ-002` | 幂等、一致性、失败可见性 | `CASE-001`, `CASE-002`, `CASE-003` |
| `TASK-002` | `REQ-001` | 规格与实现追溯一致 | `CASE-004` |

### 4.5 Risk Coverage Mapping

| Risk ID | Owner Task IDs | Review Finding IDs | Test Case IDs | Mitigation Summary |
|---------|----------------|--------------------|---------------|--------------------|
| `RISK-001` | `TASK-001` | `REV-001` | `CASE-002` | 通过稳定 `event_key` 约束重试幂等，避免重复审计写入 |
| `RISK-002` | `TASK-001`, `TASK-002` | `REV-002`, `REV-003` | `CASE-003`, `CASE-004` | 同步写入失败必须可观测，且文档中保留明确追溯链说明 |
