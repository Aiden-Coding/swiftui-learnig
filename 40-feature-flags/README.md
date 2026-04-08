# 40. Feature Flag 基础

## 学习目标

- 理解 Feature Flag 的用途
- 学会用开关控制功能发布
- 能降低新功能上线风险

## 中文讲解

Feature Flag 可以让你在不重新发版的情况下控制功能开关，是灰度发布和应急回滚的重要手段。

入门先从本地配置开关开始，后续再接远程配置平台。

## English Notes

Feature flags let you control feature rollout without full releases. They are useful for gradual rollout and fast rollback.

Start with local toggles before remote config integration.

## 示例代码

```swift
enum FeatureFlag {
    static let newProfile = false
}
```

## 常见错误

- 开关长期不清理
- 开关命名不清晰
- 功能逻辑与开关逻辑耦合过深

## 本章小结

你学会了 Feature Flag 的基础实践。

What you learned: you can now gate new features safely with simple flags.
