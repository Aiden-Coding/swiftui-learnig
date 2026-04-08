# 04. 布局系统：VStack、HStack、ZStack、Spacer

## 学习目标

- 理解 SwiftUI 最常见的布局容器
- 知道垂直、水平、叠放布局分别适合什么场景
- 能通过 `Spacer` 控制留白和对齐

## 中文讲解

SwiftUI 的布局通常从几个核心容器开始：`VStack` 负责垂直排列，`HStack` 负责水平排列，`ZStack` 负责层叠显示。大部分基础页面都可以由这三种容器组合出来。

`Spacer` 是布局里非常重要的角色。它会占据可用剩余空间，因此常被用来把内容推到一边，或者在元素之间制造弹性空白。

学习布局时，不要只看代码。你最好一边改 `spacing`、`padding`、`alignment`，一边观察界面变化。布局是最适合“调一调就懂”的部分。

## English Notes

SwiftUI layout usually begins with a few core containers: `VStack` for vertical layout, `HStack` for horizontal layout, and `ZStack` for layered content. Most beginner screens can be built from these three.

`Spacer` is a key layout tool. It expands to take up available space, which makes it useful for pushing content apart or creating flexible empty space.

When learning layout, do not just read the code. Change values like `spacing`, `padding`, and `alignment` and observe the result on screen.

## 示例代码

```swift
import SwiftUI

struct LayoutExampleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .font(.largeTitle)

                VStack(alignment: .leading) {
                    Text("Taylor")
                        .font(.headline)
                    Text("iOS Learner")
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.blue.opacity(0.15))
                    .frame(height: 100)

                Text("Layered Content")
                    .font(.title3)
            }
        }
        .padding()
    }
}
```

这个例子同时展示了水平、垂直和层叠布局，也演示了 `Spacer` 如何把内容推开。

This example combines vertical, horizontal, and layered layout, and it also shows how `Spacer` pushes content apart.

## 常见错误

- 一上来就追求复杂布局，没有先掌握三种基础容器
- 看不懂对齐问题时，只会不停加 `padding`
- 不知道 `Spacer` 会吃掉剩余空间，导致排版结果出乎意料

## 本章小结

你学会了 SwiftUI 中最核心的布局容器，以及如何利用 `Spacer` 和修饰符控制结构与留白。

What you learned: you now understand the core layout containers and how `Spacer` helps control alignment and spacing.
