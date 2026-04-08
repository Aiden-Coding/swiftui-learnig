# 28. 主题系统：颜色、字体与设计一致性

## 学习目标

- 理解为什么项目需要统一主题定义
- 学会抽离颜色和文本样式常量
- 能减少“到处写死样式”带来的维护问题

## 中文讲解

当页面变多时，如果每个地方都手写颜色和字体，后期改版会很痛苦。主题系统的核心是集中定义视觉规范，让界面保持一致并可快速调整。

入门可以先从最小主题做起：主色、背景色、标题样式、正文样式。不要追求复杂 token 体系，先解决重复和不一致问题。

主题系统是“代码组织能力”和“产品视觉稳定性”的连接点。

## English Notes

As your app grows, hardcoded colors and fonts everywhere become expensive to maintain. A theme system centralizes visual rules and keeps UI consistent.

Start simple with primary color, background color, title style, and body style. Solve duplication first before building advanced token systems.

A theme system bridges engineering structure and product consistency.

## 示例代码

```swift
import SwiftUI

enum AppTheme {
    static let primary = Color.blue
    static let pageBackground = Color(.systemBackground)
}

struct ThemeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(AppTheme.primary)
    }
}

extension View {
    func themeTitle() -> some View {
        modifier(ThemeTitle())
    }
}
```

## 常见错误

- 主题定义和业务逻辑混在一起
- 没有统一命名规则导致难维护
- 先上复杂体系却没有真实需求

## 本章小结

你学会了建立最小主题系统来提升 SwiftUI 项目的一致性与可维护性。

What you learned: you can now centralize core styling rules with a simple SwiftUI theme setup.
