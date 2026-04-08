# 43. 依赖管理基础

## 学习目标

- 理解第三方依赖引入标准
- 学会控制依赖数量与版本
- 能降低供应链和维护风险

## 中文讲解

第三方库能加速开发，但也会带来维护成本和安全风险。引入前要评估活跃度、兼容性、替代成本。

建议设定最小规则：能用系统能力就不用外部库；必须引入时记录原因和退出方案。

## English Notes

Dependencies speed up delivery but add risk and maintenance cost. Evaluate activity, compatibility, and lock-in before adoption.

Prefer native platform capabilities when possible.

## 示例代码

```text
Dependency Decision Record
- Why needed
- Alternatives considered
- Version strategy
- Exit plan
```

## 常见错误

- 为小问题引入重型库
- 版本长期不更新
- 没有依赖清单和负责人

## 本章小结

你学会了依赖治理的基础方法。

What you learned: you can now adopt dependencies with clearer control and accountability.
