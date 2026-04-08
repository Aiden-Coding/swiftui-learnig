# 45. 数据埋点基础

## 学习目标

- 理解埋点在产品优化中的作用
- 学会定义关键事件和属性
- 能建立最小埋点方案

## 中文讲解

没有埋点就难以判断功能是否真的被使用。埋点应服务决策，不是越多越好。

入门建议先覆盖关键漏斗：进入、点击、完成、退出。

## English Notes

Without analytics, product decisions rely on guesses. Instrumentation should answer specific product questions.

Start with key funnel events first.

## 示例代码

```swift
struct Analytics {
    static func track(_ event: String, properties: [String: String] = [:]) { }
}
```

## 常见错误

- 事件命名不统一
- 关键路径未埋点
- 埋点没有版本管理

## 本章小结

你学会了埋点设计的最小闭环。

What you learned: you can now define and track meaningful product events.
