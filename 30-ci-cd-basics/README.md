# 30. CI/CD 基础：自动化检查与交付

## 学习目标

- 理解 CI/CD 在 SwiftUI 项目中的核心价值
- 认识最小自动化流水线应该包含什么
- 能建立基础的提交检查意识

## 中文讲解

CI/CD 的意义是把重复检查自动化，减少人为遗漏。对于 SwiftUI 项目，最小流水线可以先覆盖：构建、测试、静态检查，再逐步扩展到打包与分发。

你不需要一步到位搭建复杂平台。先让每次提交都自动跑一轮基础检查，就已经能显著提升质量稳定性。

当团队规模变大时，CI/CD 也是协作效率的关键保障。

## English Notes

CI/CD automates repetitive quality checks and reduces manual mistakes. For SwiftUI projects, a minimum pipeline often starts with build, tests, and lint checks.

You do not need a full production pipeline on day one. Even simple automated checks per commit bring meaningful quality gains.

As teams grow, CI/CD becomes essential for delivery reliability.

## 示例代码

```text
Minimum CI Steps
1. Install dependencies
2. Build the app target
3. Run unit tests
4. Run lint or style checks
5. Report result in pull request
```

## 常见错误

- 只在本地测，合并前没有统一检查
- 流水线太慢，导致团队绕过流程
- 测试失败后没有明确处理规则

## 本章小结

你学会了 SwiftUI 项目最小 CI/CD 认知，能为后续自动化交付打基础。

What you learned: you now understand how to set up a practical baseline CI/CD workflow for app development.
