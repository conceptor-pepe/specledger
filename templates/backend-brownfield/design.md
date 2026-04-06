# <change-name> - Full Design (Phase 0.5: Step 1-4)

> This file is the phase 0.5 design source of truth for the current change. Update this file before implementation if the design changes.
> Link every design item with stable IDs so `spec-delta.md`, `tasks.md`, `review.md`, and `test-review.md` can trace back to the same intent.

---

## Step 1: Data Structure Design

### 1.0 Requirement Mapping

| Design ID | Requirement IDs | Summary |
|-----------|-----------------|---------|
| `DES-001` | `REQ-001` | `<what this design item satisfies>` |

### 1.1 Database Tables (new or changed)

#### Table `<table_name>`

| Column | Type | Constraint | Description |
|--------|------|------------|-------------|
| `<column>` | `<type>` | `<constraint>` | `<purpose>` |

Schema decision:

- design id: `DES-00X`
- related requirements: `REQ-00X`
- migration / compatibility note: `<none or detail>`

### 1.2 Model Layer

| Design ID | Module | Change | Reason |
|-----------|--------|--------|--------|
| `DES-00X` | `<module>` | `<model or struct change>` | `<why>` |

### 1.3 DTO Layer

| Design ID | DTO | Direction | Fields | Notes |
|-----------|-----|-----------|--------|-------|
| `DES-00X` | `<dto>` | `<request/response/internal>` | `<fields>` | `<constraint>` |

### 1.4 Key Data Flow

```text
<request>
  -> <service>
  -> <repository>
  -> <storage or response>
```

---

## Step 2: API Contract Definition

### 2.1 API List

| API | Route | Method | Auth | Description |
|-----|-------|--------|------|-------------|
| `<name>` | `<path>` | `<method>` | `<required or not>` | `<summary>` |

API mapping:

- design id: `DES-00X`
- requirement ids: `REQ-00X`
- impacted specs: `docs/specs/<domain>/api.md`

### 2.2 Request Contract

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `<field>` | `<type>` | `<yes/no>` | `<meaning>` |

### 2.3 Response Contract

| Field | Type | Description |
|-------|------|-------------|
| `<field>` | `<type>` | `<meaning>` |

### 2.4 Constraints

- `<status/stage or other semantic rule>`
- `<error or compatibility rule>`
- `<idempotency / timeout / retry / auth / observability rule>`

---

## Step 3: Module Coupling Analysis

### 3.1 Dependency Graph

```text
<module A>
  -> <module B>
  -> <module C>
```

Coupling mapping:

- design id: `DES-00X`
- related requirements: `REQ-00X`
- owner module: `<module>`

### 3.2 Coupling Analysis

| Shared Resource | Coupling Type | Direction | Risk | Mitigation |
|-----------------|---------------|-----------|------|------------|
| `<resource>` | `<type>` | `<A->B>` | `<risk>` | `<mitigation>` |

### 3.3 Shared Ownership

- owner: `<module>`
- consumers: `<modules>`

### 3.4 Transaction And Constraints

- transaction boundary: `<details>`
- lock order: `<details>`
- idempotency: `<details>`
- consistency requirement: `<details>`
- failure visibility: `<log/metric/alert/user-facing behavior>`

---

## Step 4: Task Split

### 4.1 Execution Order

| Task ID | Goal | Design IDs | Dependency | Files | Independently Committable | Complexity |
|---------|------|------------|------------|-------|---------------------------|------------|
| `TASK-001` | `<task>` | `DES-001` | `<dependency>` | `<files>` | `<yes/no>` | `<low/medium/high>` |

### 4.2 Acceptance Criteria

- `TASK-001`: `<criterion>`
- `TASK-001`: `<criterion>`

### 4.3 Risk Points

- `RISK-001`: `<risk>`
- `RISK-002`: `<risk>`

### 4.4 Review And Test Mapping

| Task ID | Requirement IDs | Review Focus | Test Case IDs |
|---------|-----------------|--------------|---------------|
| `TASK-001` | `REQ-001` | `<architecture/product/test focus>` | `CASE-001` |

### 4.5 Risk Coverage Mapping

| Risk ID | Owner Task IDs | Review Finding IDs | Test Case IDs | Mitigation Summary |
|---------|----------------|--------------------|---------------|--------------------|
| `RISK-001` | `TASK-001` | `REV-001` | `CASE-001` | `<how this risk is contained>` |
