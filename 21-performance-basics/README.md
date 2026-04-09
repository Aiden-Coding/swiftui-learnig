# 21. 性能基础：先把页面做对，再把页面做快

## 学习目标

- 理解 SwiftUI 性能问题最常见的来源。
- 知道哪些写法容易让页面变卡。
- 学会用简单思路优化列表和复杂视图。

## 场景引入

很多新手一听到“性能优化”就会觉得很高级，好像只有大项目才需要。其实不是。只要你写过长列表、复杂页面、频繁刷新的界面，就可能碰到：

- 滑动不顺
- 页面切换卡顿
- 数据一改，整页都在重绘

性能优化不一定要从复杂工具开始。第一步往往只是先看清楚：到底什么地方在做多余的事。

## 本章术语先看懂

- `重绘`：状态变化后，SwiftUI 重新计算和渲染界面。
- `惰性加载`：只在需要显示时才创建内容。
- `大视图`：结构太长、职责太多的视图。
- `性能瓶颈`：导致页面卡顿或消耗过高的关键点。

## 一句话理解

性能优化的第一原则不是“加技巧”，而是减少不必要的计算和渲染。

## 一个常见的低效写法

```swift
var body: some View {
    ScrollView {
        VStack {
            ForEach(0..<1000, id: \.self) { index in
                CourseRow(title: "课程 \(index)")
            }
        }
    }
}
```

这段代码能跑，但如果内容很多，就不够高效。因为 `VStack` 会一次性把所有子视图都构建出来。

## 更合适的写法

```swift
import SwiftUI

struct PerformanceCourseListView: View {
    let courses = Array(1...1000).map { "课程 \($0)" }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(courses, id: \.self) { course in
                    CourseRow(title: course)
                }
            }
            .padding()
        }
    }
}

struct CourseRow: View {
    let title: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text("这是该课程的简介信息")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
    }
}

#Preview {
    PerformanceCourseListView()
}
```

## 代码拆解（小白重点）

- `LazyVStack` 不会一开始就把所有内容都创建出来，更适合长列表。
- 把 `CourseRow` 抽成独立小组件后，结构更清楚，也更容易定位性能问题。
- 性能优化常常和“职责拆分”一起出现，不只是某个神奇 API。

## 新手最容易遇到的性能问题

- 在列表里放太重的视图。
- 页面里计算逻辑太多，`body` 过长。
- 状态定义范围太大，一改就让很多不相关内容一起刷新。
- 明明是长列表，却还在用一次性渲染的容器。

## 新手排错流程

1. 先确认是不是列表很多、内容很多导致卡顿。
2. 把超长 `body` 拆成几个子组件，再观察卡顿是否缓解。
3. 长滚动内容优先检查是否可以换成 `LazyVStack` 或 `List`。
4. 先减少明显重复计算，再谈更细的优化。

## 章节小测（带答案）

### 题 1

为什么长列表更适合 `LazyVStack`？

参考答案：因为它会按需创建内容，不会一次性把所有行都构建出来。

### 题 2

性能优化第一步最重要的事情是什么？

参考答案：先找到哪里在做不必要的计算和渲染。

### 题 3

为什么把大视图拆小也有助于性能问题排查？

参考答案：因为结构更清楚，更容易定位哪一块导致卡顿。

## 练习任务

- 基础练习：把列表项增加一个图标和标签。
- 加强练习：尝试把 `CourseRow` 再拆成信息区和操作区。
- 挑战练习：做一个带搜索的长列表，观察输入和列表刷新的关系。

## 本章小结

学完这章后，你应该已经建立一个基础性能观念：优化不是一上来用高级技巧，而是先避免明显低效的结构。
