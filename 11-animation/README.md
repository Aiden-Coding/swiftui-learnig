# 11. 动画：状态变化、withAnimation、transition

## 学习目标

- 理解 SwiftUI 动画和状态变化之间的关系
- 学会使用 `withAnimation` 和基础 `transition`
- 能给界面增加简单但清晰的动态反馈

## 中文讲解

SwiftUI 动画的核心并不是“手动控制每一帧”，而是“当状态变化时，让界面变化更平滑”。这和 SwiftUI 的整体思想是一致的：先改变状态，再让框架决定如何更新界面。

`withAnimation` 是最容易入门的方式。你把状态更新包在它里面，SwiftUI 就会尝试对相关变化加上动画。`transition` 则常用于控制某个 View 出现和消失时的方式，比如淡入淡出、滑入滑出。

动画不需要很多。对初学者来说，最有价值的动画通常是反馈型动画，例如展开、收起、显示提示、切换状态。只要节奏清楚，界面就会更易懂。

## English Notes

The core of SwiftUI animation is not frame-by-frame control. It is about making state changes feel smooth. This matches the SwiftUI mindset: change the state first, then let the framework update the UI.

`withAnimation` is the easiest starting point. When you wrap a state update inside it, SwiftUI animates the related visual changes. `transition` is commonly used for how a view appears or disappears, such as fade or slide.

You do not need many animations. For beginners, the most useful animations are feedback animations like expand, collapse, show, hide, and state changes.

## 示例代码

```swift
import SwiftUI

struct AnimationExampleView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack(spacing: 16) {
            Button(isExpanded ? "Hide Details" : "Show Details") {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()
                }
            }

            if isExpanded {
                Text("SwiftUI animations are driven by state changes.")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.orange.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .padding()
    }
}
```

这个例子里，文本区块的出现和消失都是由状态切换驱动的。

In this example, the details view appears and disappears as a direct result of state changes.

## 常见错误

- 还没想清楚状态，就急着加动画
- 动画很多，但没有帮助用户理解界面变化
- 只会加动画，不知道出现和消失还可以配合 `transition`

## 本章小结

你学会了 SwiftUI 动画的入门方式，也理解了动画本质上是状态变化的视觉反馈。

What you learned: you can now add simple state-driven animations with `withAnimation` and `transition`.
