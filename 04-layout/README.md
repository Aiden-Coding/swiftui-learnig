# 04. 布局系统：VStack、HStack、ZStack、Spacer

## 学习目标

- 理解 SwiftUI 里最常见的三种布局容器。
- 知道什么时候该用纵向、横向、叠层布局。
- 学会用 `Spacer` 控制留白与对齐。

## 场景引入

很多新手写界面时最痛苦的不是控件，而是“为什么它总排不整齐”。这通常不是因为 SwiftUI 难，而是你还没建立布局思维。

## 本章术语先看懂

- `VStack`：纵向排列
- `HStack`：横向排列
- `ZStack`：叠层排列
- `Spacer`：占据可用剩余空间

## 一句话理解

SwiftUI 页面大部分都可以理解成：把很多小 View 放进不同的 Stack 里。

## 手把手操作步骤

1. 创建文件 `ProfileCardLayoutView.swift`。
2. 粘贴代码并运行。
3. 观察头像区、标题区和背景区分别用了什么布局。
4. 删掉 `Spacer()` 看一下差异。

## 完整示例代码

```swift
import SwiftUI

struct ProfileCardLayoutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .font(.largeTitle)

                VStack(alignment: .leading) {
                    Text("小白同学")
                        .font(.headline)
                    Text("SwiftUI 初学者")
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.blue.opacity(0.12))
                    .frame(height: 80)

                Text("今日学习 40 分钟")
            }
        }
        .padding()
    }
}

#Preview {
    ProfileCardLayoutView()
}
```

## 代码拆解（小白重点）

- 最外层 `VStack` 决定整体从上到下排列。
- `HStack` 负责头像和文本左右排列。
- 内层 `VStack` 负责名字和身份说明上下排列。
- `Spacer()` 把信息推向左侧。
- `ZStack` 让背景和文字叠在一起。

## 新手排错流程

1. 元素挤在一起时，先检查 `spacing` 和 `padding`。
2. 内容没有被推开时，检查是不是少了 `Spacer()`。
3. 背景和文字没有叠在一起时，确认是不是用错了 Stack 类型。

## 章节小测（带答案）

### 题 1

`VStack`、`HStack`、`ZStack` 的区别是什么？

参考答案：分别用于纵向、横向和叠层布局。

### 题 2

`Spacer()` 的作用是什么？

参考答案：占据剩余空间，用来推开布局中的元素。

### 题 3

什么时候适合用 `ZStack`？

参考答案：当背景和前景内容要叠在一起时。

## 练习任务

- 基础练习：在资料卡右上角增加一个“会员”标签。
- 加强练习：把学习时间区域改成左右两列内容。
- 挑战练习：自己做一个课程卡片布局。

## 本章完成标准

学完这一章后，你至少应该能做到：

- 能分清 `VStack`、`HStack`、`ZStack` 的适用场景
- 能在布局里正确使用 `Spacer()`
- 能自己搭出一个简单卡片布局，而不是只会堆组件

## 学完这一章后马上可以做的练习

试着自己做一个“课程资料卡”：

- 左边放图标
- 中间放标题和说明
- 右边放状态标签

这个练习能很快帮你发现自己到底会不会判断“上下、左右、叠层”。

## 这一章最适合配合哪份资源一起用

如果你总觉得布局要靠乱试，建议配合看：

- [00 学习指南](/D:/Documents/GitHub/swiftui-learnig/00-learning-guide/README.md)

重点不是继续乱试，而是先判断布局关系，再选容器。

## 下一章为什么要学状态管理

前面几章你已经开始能把页面搭出来了。

下一步最关键的问题就是：

- 用户一点击，界面为什么会变
- 页面上的数据到底归谁管

所以最自然的下一章就是：

- [05 状态管理基础：@State、@Binding](/D:/Documents/GitHub/swiftui-learnig/05-state/README.md)

## 本章学习提示

布局最怕乱试。先判断内容是上下、左右还是叠层，再选择容器，会轻松很多。

## 本章小结

这一章之后，你已经开始具备真正“搭页面”的能力。后面的卡片、表单、列表，本质上都离不开这些基础布局容器。
