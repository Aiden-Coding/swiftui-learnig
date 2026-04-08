# 22. 无障碍基础

## 学习目标

- 理解为什么无障碍是产品质量的一部分
- 学会使用基础无障碍修饰符
- 能让常见控件更容易被辅助技术理解

## 中文讲解

无障碍不是“后期再补”的可选项，而是高质量应用的一部分。SwiftUI 提供了较好的无障碍支持，我们可以通过语义标签和提示信息提升可访问性。

对于入门者，先做到三件事：有意义的文本、可读的控件标签、明确的交互提示。这样即使不做复杂适配，也能让体验明显更好。

如果你的界面用了大量图标按钮，尤其要补充无障碍标签，避免读屏只读出不清晰的默认内容。

## English Notes

Accessibility is not an optional late-stage task. It is a core quality dimension of your app. SwiftUI provides strong built-in support for accessible UI.

As a beginner, focus on three basics: meaningful text, readable control labels, and clear interaction hints.

Icon-only controls especially need explicit accessibility labels.

## 示例代码

```swift
import SwiftUI

struct AccessibilityExampleView: View {
    var body: some View {
        Button {
            // trigger save
        } label: {
            Image(systemName: "square.and.arrow.down")
        }
        .accessibilityLabel("Save note")
        .accessibilityHint("Saves your current content locally")
    }
}
```

## 常见错误

- 图标按钮没有语义标签
- 颜色对比过低影响可读性
- 只关注视觉排版，忽略读屏体验

## 本章小结

你学会了 SwiftUI 无障碍的基础做法，能够让界面对更多用户友好。

What you learned: you can now apply basic accessibility practices in SwiftUI views.
