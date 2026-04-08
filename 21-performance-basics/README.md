# 21. 性能优化基础

## 学习目标

- 理解 SwiftUI 常见性能问题出现在哪里
- 学会做基础层面的性能自检
- 能避免初学阶段最常见的性能陷阱

## 中文讲解

SwiftUI 性能问题通常不是因为“框架慢”，而是因为数据更新范围太大、视图计算太重或不必要的重复渲染。优化第一步不是盲调参数，而是先找出热点。

新手最该关注的是列表场景和频繁状态变更场景。只要把数据粒度控制好、减少不必要的计算、避免过度嵌套，就能得到明显收益。

性能优化应当循序渐进，先保证正确，再追求快。

## English Notes

SwiftUI performance issues are often caused by broad state updates, heavy view computation, or unnecessary re-rendering, not by the framework itself.

For beginners, the highest-impact areas are lists and frequently changing state. Better data granularity and simpler view logic usually bring clear improvements.

Optimize step by step: correctness first, then speed.

## 示例代码

```swift
import SwiftUI

struct PerfRow: Identifiable {
    let id = UUID()
    let title: String
}

struct PerformanceListView: View {
    @State private var rows = (1...200).map { PerfRow(title: "Row \($0)") }

    var body: some View {
        List(rows) { row in
            Text(row.title)
        }
    }
}
```

这个示例强调使用稳定标识和清晰的数据结构，这是列表性能的第一步。

This sample highlights stable identity and clean data modeling as the first step for list performance.

## 常见错误

- 在 `body` 里做重计算
- 列表项没有稳定身份
- 状态设计过大，导致小改动触发大范围刷新

## 本章小结

你学会了 SwiftUI 入门阶段最关键的性能意识和自检方向。

What you learned: you now know how to prevent common early SwiftUI performance pitfalls.
