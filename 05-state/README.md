# 05. 状态管理基础：@State、@Binding

## 学习目标

- 理解 SwiftUI 为什么需要状态驱动界面
- 学会使用 `@State` 保存本地可变数据
- 理解 `@Binding` 如何把可编辑状态传给子视图

## 中文讲解

SwiftUI 的一个核心思想是：界面是状态的结果。当状态变化时，界面也应该随之更新。你不需要手动刷新标签或按钮文字，而是只更新数据本身。

`@State` 适合定义当前视图自己拥有的数据，比如计数器数字、开关状态、输入框内容。这个值一变化，依赖它的界面就会自动重新渲染。

当子视图也需要修改这份数据时，可以使用 `@Binding`。你可以把它理解成“对子视图开放一个可读可写的状态引用”。

## English Notes

One core SwiftUI idea is that the interface is a result of state. When the state changes, the UI updates automatically. You do not manually refresh labels or controls.

`@State` is used for local mutable data owned by the current view, such as a counter value, a toggle state, or a text field string. When the value changes, SwiftUI redraws the dependent UI.

When a child view also needs to edit that data, you can pass a `@Binding`. A binding is a read-write connection to state owned elsewhere.

## 示例代码

```swift
import SwiftUI

struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(count)")
                .font(.title2)

            StepButton(count: $count)
        }
        .padding()
    }
}

struct StepButton: View {
    @Binding var count: Int

    var body: some View {
        Button("Add 1") {
            count += 1
        }
        .buttonStyle(.borderedProminent)
    }
}
```

这里 `CounterView` 拥有状态，`StepButton` 通过 `@Binding` 修改这份状态。

Here, `CounterView` owns the state, while `StepButton` edits that state through a binding.

## 常见错误

- 把不会变化的常量也写成 `@State`
- 误以为子视图里也应该重新创建一份独立状态
- 没理解 `$count` 是把绑定传出去，而不是把整数本身传出去

## 本章小结

你学会了 SwiftUI 里最基础也最重要的数据驱动模式：用 `@State` 存本地状态，用 `@Binding` 向下传递可编辑数据。

What you learned: you now understand state-driven UI in SwiftUI and can use `@State` with `@Binding` for simple data flow.
