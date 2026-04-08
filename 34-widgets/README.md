# 34. Widget 入门

## 学习目标

- 理解 Widget 在产品中的角色
- 认识时间线更新的基本机制
- 能完成一个最小可展示的小组件

## 中文讲解

Widget 让用户不打开 App 也能看到关键信息，例如待办进度、天气摘要、习惯打卡。它强调“快速可读”，而不是完整交互。

入门时先关注最小价值：一个明确场景、一个核心数据、一个清晰布局。过多信息会让小组件失去可读性。

Widget 开发和主 App 有共享关系，建议尽早规划数据来源和刷新策略。

## English Notes

Widgets surface key information without opening the app, such as task progress or quick status summaries. They prioritize glanceability over full interaction.

Start with one clear scenario, one core data point, and one simple layout.

Plan data sharing and refresh strategy early between the app and widget extension.

## 示例代码

```swift
import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let title: String
}

struct SimpleWidgetView: View {
    var entry: SimpleEntry
    var body: some View { Text(entry.title) }
}
```

## 常见错误

- 把 Widget 当成小型完整 App 页面
- 信息过载导致可读性差
- 刷新策略不明确造成数据过期

## 本章小结

你学会了 Widget 的基础定位和最小实现思路。

What you learned: you can now design a simple, useful widget with clear scope.
