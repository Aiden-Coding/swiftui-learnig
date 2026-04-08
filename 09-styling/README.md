# 09. 样式与常用修饰符组织

## 学习目标

- 理解 SwiftUI 中“样式来自修饰符”的核心思路
- 学会组织字体、颜色、间距和圆角等常见视觉样式
- 知道什么时候该抽成复用组件

## 中文讲解

SwiftUI 的视觉样式通常不是写在单独的样式表里，而是通过修饰符直接附加在 View 上。像 `.font()`、`.foregroundStyle()`、`.padding()`、`.background()`、`.cornerRadius()` 都属于非常常见的样式修饰符。

刚开始学习时，很多人会把所有修饰符一股脑堆在一个 View 后面，虽然能运行，但会越来越难读。一个更好的习惯是先想清楚“这个 View 的内容是什么”和“这些修饰符是在表达什么视觉意图”。

当同一种视觉模式重复出现时，就可以考虑抽成复用的小组件，例如信息卡片、标签胶囊、标题区块。这样不仅更整洁，也更容易统一风格。

## English Notes

In SwiftUI, styling is usually attached directly to a view through modifiers rather than separated into a traditional stylesheet. Common styling modifiers include `.font()`, `.foregroundStyle()`, `.padding()`, `.background()`, and `.cornerRadius()`.

Beginners often pile many modifiers onto one view. It works, but it becomes hard to read. A better habit is to separate content from visual intent and think about what each modifier is doing.

When the same look appears multiple times, it is a good signal to extract a reusable component such as a card, badge, or section header.

## 示例代码

```swift
import SwiftUI

struct StylingExampleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Daily Progress")
                .font(.title2)
                .fontWeight(.bold)

            Text("You completed 3 lessons today.")
                .foregroundStyle(.secondary)

            Text("On Track")
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(.green.opacity(0.15))
                .clipShape(Capsule())
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.blue.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}
```

这个例子展示了如何用修饰符把普通文本组合成更像真实产品界面的视觉区块。

This example shows how modifiers can turn plain text into a section that feels closer to a real product UI.

## 常见错误

- 修饰符写太长但没有分清主次
- 把颜色、字号、边距改得很多，却没有统一视觉层级
- 重复写同一组样式却没有考虑复用

## 本章小结

你学会了 SwiftUI 中常见样式修饰符的作用，也知道了什么时候该把重复样式抽成更清晰的组件。

What you learned: you now understand how SwiftUI styling is built with modifiers and when to extract repeated patterns into reusable views.
