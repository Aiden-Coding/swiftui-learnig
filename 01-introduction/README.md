# 01. SwiftUI 是什么与开发环境准备

## 学习目标

- 理解 SwiftUI 的核心定位
- 知道学习 SwiftUI 需要准备哪些工具
- 建立“声明式 UI”的基本概念

## 中文讲解

SwiftUI 是 Apple 推出的声明式界面框架。你不需要一步一步告诉系统“先创建标签，再设置位置，再更新颜色”，而是直接描述“界面现在应该长什么样”。当数据变化时，SwiftUI 会重新计算并刷新界面。

对新手来说，SwiftUI 的最大优势是写法统一。文本、图片、按钮、列表、导航都遵循类似的组合方式，你会很快发现很多界面都只是把不同的 View 拼在一起。

学习 SwiftUI 前，建议准备好 Xcode 15 或更新版本，并熟悉最基础的 Swift 语法。你不需要先成为 Swift 专家，但至少应该看得懂变量、结构体、函数和简单的数组。

## English Notes

SwiftUI is Apple's declarative UI framework. Instead of telling the system every step to build and update the screen, you describe what the UI should look like for the current state.

One major benefit for beginners is consistency. Text, images, buttons, lists, and navigation all follow the same composition style, so you can build many screens by combining small views.

Before starting, prepare Xcode 15 or later and make sure you understand basic Swift syntax such as variables, structs, functions, and simple arrays.

## 示例代码

```swift
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
    }
}
```

这段代码已经体现了 SwiftUI 的基本形式：定义一个遵守 `View` 协议的结构体，然后在 `body` 中描述界面。

This snippet already shows the SwiftUI pattern: define a struct that conforms to `View`, then describe the interface in `body`.

## 常见错误

- 以为 SwiftUI 和 UIKit 一样需要手动更新界面
- 还没理解 `body` 的意义，就急着记大量修饰符
- 没有准备练习项目，只停留在阅读层面

## 本章小结

你学会了 SwiftUI 是一个声明式 UI 框架，也知道了开始学习前应准备的开发环境和基础知识。

What you learned: SwiftUI is a declarative UI framework, and you now know the basic setup and background knowledge needed before learning it.
