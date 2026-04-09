# 05. 状态管理基础：@State、@Binding

## 学习目标

- 理解 SwiftUI 为什么强调“状态驱动界面”。
- 学会使用 `@State` 保存当前视图的数据。
- 学会使用 `@Binding` 把可修改的数据传给子视图。

## 场景引入

你写了一个按钮，点击后想让数字加一，结果要么界面不更新，要么子视图改不了父视图的数据。这些问题本质上都和“状态”有关。

## 本章术语先看懂

- `@State`：当前视图自己拥有、自己维护的可变状态
- `@Binding`：对子视图开放的可读可写引用
- `状态驱动 UI`：界面不是手动刷新的，而是根据状态自动重绘

## 一句话理解

谁拥有数据，谁定义 `@State`；谁只是帮忙修改数据，谁接收 `@Binding`。

## 手把手操作步骤

1. 创建父视图和子视图。
2. 粘贴代码并运行。
3. 点击按钮，观察父视图中的数字变化。
4. 把按钮文字改成“增加”，确认逻辑不受影响。

## 完整示例代码

```swift
import SwiftUI

struct CounterParentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 12) {
            Text("当前值：\(count)")
                .font(.title3)

            CounterButtonView(count: $count)
        }
        .padding()
    }
}

struct CounterButtonView: View {
    @Binding var count: Int

    var body: some View {
        Button("加 1") {
            count += 1
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    CounterParentView()
}
```

## 代码拆解（小白重点）

- `@State private var count = 0` 表示父视图拥有这份状态。
- `$count` 不是值，而是绑定。
- 子视图里的 `@Binding var count` 表示它可以修改父视图的状态。
- 点击按钮后，父视图的数据发生变化，界面自动刷新。

## 新手排错流程

1. 按钮能点但数字不变时，先检查父视图是不是用了 `@State`。
2. 检查传值时是不是用了 `$count`。
3. 检查子视图是不是用 `@Binding` 接收。

## 章节小测（带答案）

### 题 1

`@State` 通常放在哪里？

参考答案：放在拥有这份数据的视图里。

### 题 2

什么时候要用 `@Binding`？

参考答案：当子视图需要修改父视图的数据时。

### 题 3

`count` 和 `$count` 的区别是什么？

参考答案：`count` 是值，`$count` 是绑定。

## 练习任务

- 基础练习：增加一个“减 1”按钮。
- 加强练习：把“加 1”和“减 1”都拆到子视图里。
- 挑战练习：增加一个“重置为 0”按钮。

## 本章学习提示

状态这一章非常关键。你后面学表单、列表、动画、网络加载，都会不断用到状态驱动的思维。

## 本章小结

学完这章后，你应该已经真正理解：SwiftUI 的界面不是手动刷新出来的，而是状态变化后自动更新出来的。
