# 02. 第一个 View 与基本语法

## 学习目标

- 看懂一个最基础的 SwiftUI 视图结构。
- 理解 `View`、`body`、修饰符之间的关系。
- 能自己写出一个带标题和说明文字的小页面。

## 场景引入（为什么这一章重要）

很多小白学 SwiftUI 的第一个难点不是控件，也不是动画，而是“我根本不知道一段 SwiftUI 代码应该怎么读”。

比如你看到这种代码：

```swift
Text("Welcome")
    .font(.title)
    .padding()
```

你可能会疑惑：

- `Text` 是函数吗？
- `.font()` 是不是在修改它？
- 为什么 SwiftUI 总是这种一行接一行的写法？

这章就是专门解决这个问题的。

## 本章术语先看懂

- `View`：界面单元
- `body`：视图真正显示的内容
- `modifier`：修饰符，用来给视图加样式或行为
- `some View`：表示“返回某种视图”，你现在可以先把它理解成“一个界面结果”

## 一句话理解

一个 SwiftUI 页面通常就是：基础视图 + 修饰符。

## 手把手操作步骤

1. 创建文件 `ModifierDemoView.swift`。
2. 粘贴下面代码并运行。
3. 改一个修饰符，观察页面变化。
4. 再自己增加一行说明文字。

## 完整示例代码

```swift
import SwiftUI

struct ModifierDemoView: View {
    var body: some View {
        Text("欢迎学习 SwiftUI")
            .font(.title)
            .fontWeight(.semibold)
            .padding()
            .background(.blue.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ModifierDemoView()
}
```

## 代码拆解（小白重点）

- `Text("欢迎学习 SwiftUI")` 是基础视图。
- `.font(.title)` 让文字变大。
- `.padding()` 增加留白。
- `.background(...)` 增加背景。
- `.clipShape(...)` 把背景裁成圆角。

## 修饰符顺序为什么重要

下面两种写法效果不同：

```swift
Text("Hello")
    .padding()
    .background(.blue)
```

```swift
Text("Hello")
    .background(.blue)
    .padding()
```

第一种背景会包住 padding，第二种不会。这个差异你后面会经常遇到。

## 新手排错流程

1. 如果样式不对，先检查修饰符顺序。
2. 如果代码报错，先查是不是修饰符名字拼错。
3. 如果背景或圆角没生效，确认是不是修饰到了正确的 View。

## 章节小测（带答案）

### 题 1

SwiftUI 最常见的写法模式是什么？

参考答案：基础视图加修饰符。

### 题 2

修饰符顺序重要吗？

参考答案：重要，因为顺序会影响最终显示效果。

### 题 3

`.padding()` 的作用是什么？

参考答案：给视图增加内边距。

## 练习任务

- 基础练习：把标题改成绿色主题。
- 加强练习：再加一行副标题文字。
- 挑战练习：做两个版本，对比不同修饰符顺序的显示差异。

## 本章学习提示

不要急着背几十个修饰符。先学会“从里到外读代码”，效率会高很多。

## 本章小结

学完这章，你应该已经能看懂一个简单 SwiftUI 视图是怎么由基础视图和修饰符一步步拼出来的。
