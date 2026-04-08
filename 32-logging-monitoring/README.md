# 32. 日志与监控：可观测性入门

## 学习目标

- 理解为什么应用需要可观测性
- 学会区分开发日志与生产监控
- 能建立最小日志与崩溃跟踪策略

## 中文讲解

没有日志和监控，线上问题几乎无法高效定位。可观测性的目标是回答三个问题：发生了什么、影响了谁、如何复现。

入门阶段建议先做两件事：关键流程埋点和崩溃监控接入。日志要有结构，避免“全是字符串”的混乱输出。

监控不是为了收集数据而收集，而是为了支撑排障和产品决策。

## English Notes

Without logs and monitoring, production issues are hard to diagnose. Observability should help answer what happened, who was affected, and how to reproduce.

At this stage, start with two basics: key flow logging and crash reporting. Keep logs structured and purposeful.

Monitoring is not about collecting everything. It is about supporting debugging and decision-making.

## 示例代码

```swift
import os

let logger = Logger(subsystem: "com.example.swiftui", category: "network")
logger.info("Request started for feed endpoint")
logger.error("Request failed with status: \(500)")
```

## 常见错误

- 日志过多但没有上下文信息
- 线上问题发生后才临时加监控
- 只看崩溃率，不看核心流程成功率

## 本章小结

你学会了可观测性的最小实践：结构化日志与基础监控。

What you learned: you can now set up practical baseline observability for SwiftUI apps.
