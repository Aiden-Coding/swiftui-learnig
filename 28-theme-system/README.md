# 28. 主题系统基础：让页面颜色和样式更统一

## 学习目标

- 理解为什么项目变大后要有统一样式。
- 学会用颜色和简单样式常量减少重复。
- 能建立一个基础版的主题配置思路。

## 场景引入

当你做的页面越来越多时，如果每一页都自己写颜色、圆角、间距，很快就会出现：

- 同样的按钮长得不一样
- 页面风格不统一
- 改主色时要到处找

主题系统的目标，就是让这些公共样式集中管理，而不是散落在每个页面里。

## 本章术语先看懂

- `主题系统`：统一管理颜色、字体、间距、圆角等设计规则的方式。
- `设计令牌`：可复用的样式常量，比如主色、边距、字号。
- `一致性`：同类元素在不同页面中保持统一风格。

## 一句话理解

主题系统不是为了高级，而是为了让界面统一、可维护、好修改。

## 示例代码

```swift
import SwiftUI

enum AppTheme {
    static let primaryColor = Color.blue
    static let secondaryBackground = Color(.secondarySystemBackground)
    static let cardCornerRadius: CGFloat = 16
    static let screenPadding: CGFloat = 16
}

struct ThemeSystemDemoView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("今日推荐课程")
                .font(.title2)
                .fontWeight(.bold)

            VStack(alignment: .leading, spacing: 8) {
                Text("SwiftUI 状态管理")
                    .font(.headline)

                Text("从 `@State` 到数据流组织，适合基础巩固。")
                    .foregroundStyle(.secondary)

                Button("开始学习") {
                    print("开始学习")
                }
                .buttonStyle(.borderedProminent)
                .tint(AppTheme.primaryColor)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppTheme.secondaryBackground)
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.cardCornerRadius))
        }
        .padding(AppTheme.screenPadding)
    }
}

#Preview {
    ThemeSystemDemoView()
}
```

## 代码拆解（小白重点）

- `AppTheme` 把常用样式集中放在一个地方。
- 页面里不直接写一堆零散数值，而是引用主题常量。
- 以后如果主色改了，通常只需要改主题定义，而不是每个页面逐个找。

## 新手常见误区

- 每个页面都自己写颜色和间距。
- 主题系统一开始就设计得过于复杂。
- 还没统一规则，就已经在几十个页面里复制样式。

## 新手排错流程

1. 页面风格不统一时，先盘点重复出现的颜色和间距。
2. 样式改动牵一发动全身时，检查是否该提取公共常量。
3. 主题文件越来越乱时，先从颜色、间距、圆角三类最常见内容开始整理。

## 章节小测（带答案）

### 题 1

为什么项目变大后更需要主题系统？

参考答案：因为页面一多，如果没有统一样式，维护成本会迅速上升。

### 题 2

把颜色和圆角提成常量的好处是什么？

参考答案：能减少重复，提高一致性，也更方便整体调整。

### 题 3

为什么主题系统不建议一开始就设计得过度复杂？

参考答案：因为新手阶段先解决重复和不统一的问题更重要，过度设计反而增加理解成本。

## 练习任务

- 基础练习：再增加一个按钮次级颜色。
- 加强练习：把标题字体样式也提取成统一规则。
- 挑战练习：把前面几章的小页面都改成复用同一套主题常量。

## 本章小结

学完这章后，你应该已经知道：主题系统的核心价值，不是显得专业，而是让页面风格统一、改动成本更低。
