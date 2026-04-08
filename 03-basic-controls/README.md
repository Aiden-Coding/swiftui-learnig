# 03. 文本、图片、按钮与常用基础组件

## 学习目标

- 认识 `Text`、`Image`、`Button` 的基本用法
- 理解基础组件如何组合成简单界面
- 能写出一个带标题、图标和按钮的小模块

## 中文讲解

SwiftUI 中最常用的基础组件包括文本、图片和按钮。`Text` 用于展示文字，`Image` 用于显示系统图标或资源图片，`Button` 用于处理点击交互。

其中 `Image(systemName:)` 很适合入门练习，因为它可以直接使用 SF Symbols 图标，不需要你先准备素材。按钮则通常接收两个部分：点击时执行的动作，以及按钮显示的内容。

这些基础组件本身功能很简单，但配合布局容器后，就能组成卡片、欢迎区块、设置入口等大量真实界面。

## English Notes

The most common beginner-friendly controls in SwiftUI are `Text`, `Image`, and `Button`. `Text` displays words, `Image` shows icons or assets, and `Button` handles tap interaction.

`Image(systemName:)` is especially useful for practice because it gives you access to SF Symbols without importing custom assets. A button usually has two parts: the action and the label content.

These views are simple on their own, but once you place them inside layout containers, they can form many real UI sections.

## 示例代码

```swift
import SwiftUI

struct BasicControlsView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "star.fill")
                .font(.system(size: 40))
                .foregroundStyle(.yellow)

            Text("Start Learning SwiftUI")
                .font(.headline)

            Button("Begin") {
                print("Button tapped")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
```

这个例子里，`VStack` 把三个基础组件组织成一个清晰的小模块。

In this example, `VStack` arranges three basic controls into a small and readable section.

## 常见错误

- 把 `Image("star")` 和 `Image(systemName: "star")` 混用
- 按钮里只会写文字，不知道也可以放复杂内容
- 组件能显示出来就结束，没有继续调整层级和可读性

## 本章小结

你学会了最常见的三个基础组件，以及它们如何组合成一个简单但完整的小界面。

What you learned: you can now use `Text`, `Image`, and `Button` together to build a simple interactive section.
