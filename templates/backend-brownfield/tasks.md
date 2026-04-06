# Tasks: <change-name>

## 1. Planning Gate

- [ ] 1.1 完成 change 初始化
- [ ] 1.2 完成 `REQ-*` spec delta
- [ ] 1.3 完成 `DES-*` 设计确认
- [ ] 1.4 确认本次拆分的最小可提交 task 边界

## 2. Task Breakdown

> Each row should be a smallest shippable slice. The goal, files/modules, acceptance criteria, and test case mapping must be specific enough that a reviewer can judge whether this task can be committed independently.

| Task ID | Goal | Requirement IDs | Design IDs | Dependency | Files / Modules | Acceptance Criteria | Test Case IDs | Independently Committable | Status |
|---------|------|-----------------|------------|------------|-----------------|---------------------|---------------|---------------------------|--------|
| `TASK-001` | `<smallest shippable slice>` | `REQ-001` | `DES-001` | `<none or task ids>` | `<files>` | `<done means what>` | `CASE-001` | `<yes/no>` | `<todo/in-progress/done>` |

## 3. Implementation Gate

- [ ] 3.1 完成 `TASK-001` 代码变更
- [ ] 3.2 更新契约 / 文档 / 可观测性
- [ ] 3.3 自检边界条件、异常路径、回滚路径

## 4. Verification Gate

- [ ] 4.1 执行编码规范审计
- [ ] 4.2 完成产品 / 架构 / 代码 / 测试四视角 Review
- [ ] 4.3 完成白盒测试评审
- [ ] 4.4 生成 commit summary

## 5. Archive Gate

- [ ] 5.1 回写长期 specs
- [ ] 5.2 回写纠错记忆 / 演进规则
- [ ] 5.3 完成 archive 记录
