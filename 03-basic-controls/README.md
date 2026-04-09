# 03. 文本、图片、按钮与基础组件

## 学习目标

- 会使用 `Text`、`Image`、`Button` 三个最常见控件。
- 能把三个控件组合成一个有交互的小模块。
- 理解点击按钮后界面为什么会变化。

## 场景引入

真实页面里最常见的元素通常就是文字、图标和按钮。很多功能页面，本质上都是这些基础组件排列组合出来的。

## 本章术语先看懂

- `Text`：显示文字
- `Image`：显示图片或系统图标
- `Button`：可点击交互控件
- `systemName`：使用系统自带 SF Symbols 图标

## 一句话理解

如果你掌握了文字、图片、按钮，你就已经具备搭建很多基础页面模块的能力了。

## 手把手操作步骤

1. 创建文件 `JoinCourseCardView.swift`。
2. 粘贴代码并运行。
3. 点击按钮，观察图标和文案变化。
4. 再自己换一个图标和按钮标题。

## 完整示例代码

```swift
import SwiftUI

struct JoinCourseCardView: View {
    @State private var joined = false

    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: joined ? "checkmark.seal.fill" : "star.circle.fill")
                .font(.system(size: 44))
                .foregroundStyle(joined ? .green : .orange)

            Text(joined ? "已加入学习计划" : "点击加入学习计划")

            Button(joined ? "已加入" : "立即加入") {
                joined = true
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    JoinCourseCardView()
}
```

## 代码拆解（小白重点）

- `joined` 决定当前界面显示哪种状态。
- `Image(systemName:)` 用系统图标，不用自己准备素材。
- `Button` 点击后修改状态。
- 状态变化后，图标和文案会自动更新。

## 新手排错流程

1. 图标不显示时，先检查 `systemName` 有没有拼错。
2. 点击没反应时，检查按钮 action 有没有改状态。
3. 文案没变化时，检查 `Text` 是否依赖同一个状态变量。

## 章节小测（带答案）

### 题 1

`Text`、`Image`、`Button` 分别负责什么？

参考答案：显示文字、显示图像/图标、处理点击交互。

### 题 2

为什么点击按钮后图标会变化？

参考答案：因为按钮修改了状态，而图标依赖这个状态。

### 题 3

`Image(systemName:)` 有什么好处？

参考答案：可以直接使用系统图标，不需要自己准备图片素材。

## 练习任务

- 基础练习：把“加入学习计划”改成“收藏课程”。
- 加强练习：加入后禁用按钮，防止重复点击。
- 挑战练习：再增加一段副标题说明当前状态。

## 本章学习提示

别小看基础组件。很多复杂页面，本质上都是把这些基础控件组合得更清晰、更合理。

## 本章小结

这一章结束后，你已经学会了最常见的三个基础控件，也第一次真正体验到了“状态变化会带动界面变化”。
