# 23. 发布流程入门

## 学习目标

- 了解从开发到发布的基本路径
- 理解版本号、构建号和发布检查的重要性
- 能建立简化但可靠的发布清单

## 中文讲解

做完功能不等于可以发布。发布流程的价值在于降低线上风险，确保版本可追踪、可回滚、可验证。即使是小项目，也建议建立最小发布规范。

入门可以从一份轻量 checklist 开始：版本信息更新、关键功能回归、基础无障碍检查、崩溃日志关注、发布说明整理。流程越稳定，团队越省心。

你不需要一开始就接入完整 CI/CD，但要有“每次发布都做同样关键检查”的意识。

## English Notes

Feature completion does not mean release readiness. A release workflow reduces production risk and keeps versions traceable and verifiable.

Start with a lightweight checklist: version update, key regression checks, basic accessibility pass, crash monitoring, and release notes.

You do not need full CI/CD at first, but you do need consistent release discipline.

## 示例代码

```text
Release Checklist (Minimum)
1. Update app version and build number
2. Verify core flows: launch, login, create, edit
3. Run basic accessibility and UI sanity checks
4. Confirm analytics and crash reporting are active
5. Write short release notes
```

## 常见错误

- 临发布才临时测试，问题集中爆发
- 没有发布记录，后续难以排查线上问题
- 跳过关键回归流程

## 本章小结

你学会了小团队可落地的发布流程基础，能让迭代更稳定。

What you learned: you can now follow a practical minimum release workflow for SwiftUI apps.
