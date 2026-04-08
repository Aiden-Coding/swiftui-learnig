# 13. 组件拆分与复用

## 学习目标

- 理解什么时候应该把 UI 拆成独立组件
- 学会通过参数让组件可复用
- 能把重复界面抽成更清晰的结构

## 中文讲解

当你在多个页面里反复写相同的样式或布局时，说明已经到了该拆组件的时候。组件化的核心不是“把代码切碎”，而是让重复逻辑集中管理，减少维护成本。

一个可复用组件通常要有清晰输入，比如标题、图标、颜色、动作回调。这样它才能在不同场景下使用，而不是只能服务一个页面。

初学阶段建议从小组件开始，例如信息卡片、标签、行项目。等习惯后再逐步拆更复杂模块。

## English Notes

When you keep repeating the same UI structure across screens, it is a good signal to extract a reusable component. Componentization is not about splitting code for its own sake. It is about centralizing repeated patterns and reducing maintenance cost.

A reusable view should have clear inputs such as title, icon, color, and action. That makes it flexible across multiple contexts.

At the beginner stage, start with small reusable pieces like cards, badges, and row items.

## 示例代码

```swift
import SwiftUI

struct InfoCard: View {
    let title: String
    let subtitle: String
    let icon: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(.blue)
            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(.headline)
                Text(subtitle).foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(.blue.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
```

这个组件通过参数控制显示内容，可以在多个页面复用。

This component is reusable because its content is fully controlled by inputs.

## 常见错误

- 为了复用而复用，拆出很多没人用的组件
- 组件输入不清晰，导致只能复制改名
- 把业务逻辑和样式全部耦合在同一个组件里

## 本章小结

你学会了通过参数化方式拆出可复用 SwiftUI 组件，并提升界面代码可维护性。

What you learned: you can now extract repeated UI into parameterized reusable SwiftUI views.
