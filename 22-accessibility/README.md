# 22. 无障碍基础：让更多人能用你的 App

## 学习目标

- 理解无障碍不是附加项，而是产品质量的一部分。
- 认识 `accessibilityLabel`、`accessibilityHint` 等基础能力。
- 能为一个简单页面补上基础无障碍信息。

## 场景引入

如果一个按钮只有图标、没有文字，很多用户看一眼也许能猜到它的意思；但对使用 VoiceOver 的用户来说，如果你没有提供额外说明，这个按钮可能几乎不可用。

无障碍的意义就在这里：让不同使用方式的用户，都能理解和操作你的界面。

## 本章术语先看懂

- `无障碍`：帮助更多用户访问和使用界面的能力。
- `VoiceOver`：Apple 设备上的屏幕朗读功能。
- `accessibilityLabel`：给控件提供更清晰的可读名称。
- `accessibilityHint`：进一步说明控件操作后的结果。

## 一句话理解

无障碍不是“给少数人加功能”，而是让界面表达更完整。

## 完整示例代码

```swift
import SwiftUI

struct AccessibilityLessonView: View {
    @State private var isFavorite = false

    var body: some View {
        VStack(spacing: 20) {
            Text("SwiftUI 学习卡片")
                .font(.title2)
                .fontWeight(.bold)

            Text("这是一节关于状态管理的课程。")
                .foregroundStyle(.secondary)

            Button {
                isFavorite.toggle()
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 28))
                    .foregroundStyle(isFavorite ? .red : .gray)
            }
            .accessibilityLabel(isFavorite ? "取消收藏课程" : "收藏课程")
            .accessibilityHint("双击后会切换课程的收藏状态")

            Button("开始学习") {
                print("开始学习")
            }
            .buttonStyle(.borderedProminent)
            .accessibilityHint("双击后进入当前课程内容")
        }
        .padding()
    }
}

#Preview {
    AccessibilityLessonView()
}
```

## 代码拆解（小白重点）

- 图标按钮如果只有图像，最好主动补上 `accessibilityLabel`。
- `accessibilityHint` 适合告诉用户“点了之后会发生什么”。
- 对视觉用户 obvious 的东西，不代表对朗读用户也清楚。

## 新手常见误区

- 觉得无障碍是后期再做的事。
- 只有图标没有文字，也没有补 label。
- 页面看起来没问题，就以为所有用户都能顺畅使用。

## 新手排错流程

1. 遇到纯图标按钮时，先检查是否需要补 `accessibilityLabel`。
2. 操作结果不明显时，检查是否需要补 `accessibilityHint`。
3. 页面信息很多但朗读很乱时，检查控件语义是否清晰。

## 章节小测（带答案）

### 题 1

为什么图标按钮通常更需要 `accessibilityLabel`？

参考答案：因为图标本身未必能被朗读系统准确表达。

### 题 2

`accessibilityHint` 适合说明什么？

参考答案：适合说明操作后会发生什么。

### 题 3

为什么无障碍应该尽早考虑？

参考答案：因为它本身就是界面表达和产品质量的一部分，不是可有可无的附加项。

## 练习任务

- 基础练习：给页面里的每个按钮都检查一遍无障碍说明是否足够。
- 加强练习：把一个只有图标的操作区改成“图标 + 文本”或补充 label。
- 挑战练习：为一个设置页设计更清晰的无障碍文案。

## 本章小结

学完这章后，你应该已经知道：无障碍不是特别高级的额外工作，而是帮助界面更完整表达的一部分。

## 本章完成标准

学完这一章后，你至少应该能做到：

- 知道无障碍不是附加项，而是界面表达的一部分
- 能主动给纯图标按钮补 `accessibilityLabel`
- 能理解“你看得懂”和“所有用户都能顺畅理解”不是一回事

## 学完这一章后马上可以做的练习

回到你前面做过的一个页面，检查：

- 纯图标按钮有没有补 label
- 某些操作是否需要 hint
- 页面关键信息是否容易被朗读理解

只要你改过一次，就会开始有明显的无障碍意识。

## 下一章为什么建议继续学发布流程

当你已经开始思考“别人能不能顺利使用你的页面”以后，下一步很自然就会进入：

- 一个应用从本地写完，到真正上线给别人用，中间要经过什么

所以建议接着看：

- [23 发布流程基础：从开发到上线要经过什么](/D:/Documents/GitHub/swiftui-learnig/23-release-workflow/README.md)
