# 29. 组件库入门：从复用到规范

## 学习目标

- 理解组件库和普通组件复用的区别
- 学会建立基础组件分类与命名规范
- 能把常用组件沉淀为团队资产

## 中文讲解

当项目进入多人协作阶段，仅有“零散可复用组件”还不够，需要更系统的组件库思维。组件库不仅是代码集合，还包含命名规范、使用约束和设计一致性。

可以先从高频基础组件开始沉淀，例如按钮、输入框、卡片、空状态。每个组件都应该有明确输入参数和适用场景说明。

组件库建设是长期工作，起步阶段先保证“可发现、可复用、可维护”。

## English Notes

In team-scale projects, scattered reusable views are not enough. A component library adds structure, naming consistency, and usage rules.

Start by collecting high-frequency primitives like buttons, text fields, cards, and empty states. Each component should have clear API inputs and intended use.

Treat this as long-term asset building: discoverable, reusable, maintainable.

## 示例代码

```swift
import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(title, action: action)
            .buttonStyle(.borderedProminent)
            .tint(.blue)
    }
}
```

## 常见错误

- 组件命名不统一，调用方难检索
- 组件参数过多，职责过重
- 缺少使用约定导致风格漂移

## 本章小结

你学会了把基础组件升级为可持续演进的组件库思路。

What you learned: you can now organize reusable SwiftUI views into a maintainable component library foundation.
