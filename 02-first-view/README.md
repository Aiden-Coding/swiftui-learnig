# 02. 第一个 View 与基本语法

## 学习目标

- 理解 `View`、`body`、修饰符的基本关系
- 看懂最常见的 SwiftUI 视图结构
- 能写出一个简单的欢迎页面

## 中文讲解

在 SwiftUI 里，每一个界面单元都是一个 View。一个 View 通常是结构体，遵守 `View` 协议，并通过 `body` 返回界面内容。

`body` 返回的并不是“运行后再生成的界面脚本”，而是当前界面的声明。你可以把它理解成一份描述书：告诉 SwiftUI 这里有一个文本、它用了什么字体、它有多少边距。

SwiftUI 里最常见的写法是“基础 View + 修饰符”。例如 `Text("Hello")` 是基础 View，后面的 `.font(.title)`、`.padding()` 就是在给它添加样式和布局信息。

## English Notes

In SwiftUI, every piece of UI is a view. A view is usually a struct that conforms to the `View` protocol and provides content through `body`.

The `body` does not describe imperative steps. It describes the UI for the current moment. You can think of it as a declaration of what should appear on screen.

The most common SwiftUI pattern is "base view plus modifiers". `Text("Hello")` is the base view, while modifiers such as `.font(.title)` and `.padding()` add style and layout behavior.

## 示例代码

```swift
import SwiftUI

struct FirstScreen: View {
    var body: some View {
        Text("Welcome to SwiftUI")
            .font(.title)
            .fontWeight(.bold)
            .padding()
    }
}
```

这段代码展示了一个最小的页面结构。`Text` 是内容，修饰符决定视觉效果。

This example shows the smallest useful SwiftUI screen. `Text` provides the content, and modifiers define the appearance.

## 常见错误

- 忘记 `body` 是计算属性，不是函数
- 把修饰符顺序完全当成无关紧要
- 看到 `some View` 就紧张，其实先把它当成“某种 View”即可

## 本章小结

你学会了 SwiftUI 视图的最基本结构，也理解了 `body` 和修饰符是如何一起描述界面的。

What you learned: you can now read and write a basic SwiftUI view, and you understand how `body` and modifiers work together.
