# 10. 模态展示：sheet、alert、confirmationDialog

## 学习目标

- 理解模态展示和导航的区别。
- 学会使用 `sheet` 和 `alert`。
- 知道什么时候该弹出页面，什么时候该弹出确认框。

## 场景引入

你做一个设置页时，可能会遇到两种常见交互：点“新增内容”弹出一个临时编辑页；点“删除内容”弹出一个确认提示。这两种都不是“进入新的内容层级”，而是临时打断当前流程，所以更适合用模态展示。

## 本章术语先看懂

- `sheet`：弹出一个临时页面
- `alert`：弹出一个提示或确认框
- `confirmationDialog`：弹出操作选择菜单
- `isPresented`：是否显示

## 一句话理解

导航是“往前走一层”，模态是“临时弹出来处理一件事”。

## 手把手操作步骤

1. 创建 `ModalDemoView`。
2. 粘贴代码并运行。
3. 点击“打开编辑页”。
4. 再点击“删除内容”，观察 alert。

## 完整示例代码

```swift
import SwiftUI

struct ModalDemoView: View {
    @State private var showSheet = false
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 12) {
            Button("打开编辑页") {
                showSheet = true
            }

            Button("删除内容") {
                showAlert = true
            }
            .foregroundStyle(.red)
        }
        .sheet(isPresented: $showSheet) {
            Text("这里是临时编辑页面")
                .presentationDetents([.medium])
        }
        .alert("确认删除？", isPresented: $showAlert) {
            Button("删除", role: .destructive) { }
            Button("取消", role: .cancel) { }
        }
        .padding()
    }
}

#Preview {
    ModalDemoView()
}
```

## 代码拆解（小白重点）

- `showSheet` 控制编辑页是否弹出。
- `showAlert` 控制确认框是否弹出。
- `.sheet(...)` 适合承载一小段临时页面流程。
- `.alert(...)` 适合短确认、短提醒。

## 什么时候用 sheet，什么时候用 alert

### 用 `sheet`

适合：新增内容、编辑资料、临时填写信息。

### 用 `alert`

适合：删除确认、危险提醒、简短提示。

## 新手排错流程

1. 按钮点了没弹窗时，先检查状态有没有改成 `true`。
2. 两种弹窗混在一起时，检查是不是误用了同一个状态变量。
3. 弹出页体验很差时，检查内容是否太少或缺少明确标题。

## 章节小测（带答案）

### 题 1

`sheet` 更适合用来做什么？

参考答案：临时完整页面，例如新增或编辑。

### 题 2

`alert` 更适合用来做什么？

参考答案：确认和提醒。

### 题 3

为什么这两种展示都要绑定状态？

参考答案：因为显示与隐藏本身就是界面状态的一部分。

## 练习任务

- 基础练习：把编辑页里的文字改成一个更完整的表单占位内容。
- 加强练习：删除确认后增加一个“已删除”提示。
- 挑战练习：再加一个 `confirmationDialog` 做操作选择。

## 本章完成标准

学完这一章后，你至少应该能做到：

- 知道导航和模态展示的区别
- 能用 `sheet` 做一个临时编辑页
- 能用 `alert` 做一个确认删除提示
- 能判断一个交互更适合用导航还是模态

## 学完这一章后最推荐马上做的练习

做一个“设置页里的操作区”：

- 一个按钮用于打开编辑昵称页
- 一个按钮用于删除账号前的确认

这个练习很小，但已经非常接近真实 App 场景。

## 这一章为什么很重要

因为从这一章开始，你写的页面不再只是“点击进入下一页”，而开始有：

- 临时任务处理
- 危险操作确认
- 更像产品真实流程的交互

这也是为什么学完这一章后，页面会明显更像 App，而不是组件练习。

## 下一步更适合接什么内容

当你已经会做基础页面、导航和模态后，下一步最自然的方向就是：

- 让页面更有动感
- 让加载过程更像真实应用

所以接下来非常适合继续看：

- [11 动画基础：让界面动起来](/D:/Documents/GitHub/swiftui-learnig/11-animation/README.md)
- [12 异步数据加载：加载中、成功、失败](/D:/Documents/GitHub/swiftui-learnig/12-async-data/README.md)

## 本章学习提示

模态展示最怕乱用。记住一句话：临时任务用模态，层级流转用导航。

## 本章小结

这一章之后，你已经能做出更像真实 App 的交互了。用户不只是点进去看内容，还能在当前流程中临时处理任务和确认动作。
