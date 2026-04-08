# 39. 离线优先基础

## 学习目标

- 理解离线优先的产品意义
- 学会基础缓存与回退策略
- 能在无网场景保持关键功能可用

## 中文讲解

很多真实使用场景并不稳定联网。离线优先的核心是“即使没网也能做关键操作”，然后在恢复网络后同步数据。

入门可以从本地缓存读取开始，网络失败时展示上次成功结果，并给出明确状态提示。

## English Notes

Real users are often on unstable networks. Offline-first means core actions still work and data syncs later.

Begin with local cache fallback and clear status communication.

## 示例代码

```swift
enum DataSource {
    case network
    case cache
}
```

## 常见错误

- 无网时直接空白页面
- 缓存存在但没有版本策略
- 没有同步冲突处理思路

## 本章小结

你学会了离线优先的基础思路和最小实现方向。

What you learned: you can now design a basic cache fallback path for offline scenarios.
