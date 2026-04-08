# 20. 架构基础：分层与职责

## 学习目标

- 理解为什么 SwiftUI 项目需要最小架构约束
- 学会区分视图层、状态层、数据层职责
- 能把小项目从“能跑”提升到“可维护”

## 中文讲解

随着功能增长，把所有代码都写进 View 会越来越难维护。架构不是为了复杂，而是为了让职责边界清晰，让多人协作和后续迭代更顺畅。

入门阶段可采用简单三层思路：View 负责展示和交互触发，State/Model 负责状态与规则，Data 层负责存储或请求。先做到这一步，就能避免大多数早期混乱。

不要急着套完整企业架构，先让代码具备可读、可测、可扩展的基本形态。

## English Notes

As your app grows, placing everything inside views becomes hard to maintain. Architecture should reduce complexity, not increase it, by making responsibilities explicit.

A practical beginner structure is three layers: View for presentation, State/Model for rules, and Data layer for storage or API interaction.

You do not need enterprise-level patterns yet. Focus on readable, testable, and extendable code boundaries.

## 示例代码

```swift
import SwiftUI

struct TodoState {
    var items: [String] = []

    mutating func add(_ title: String) {
        guard !title.isEmpty else { return }
        items.append(title)
    }
}

struct TodoView: View {
    @State private var state = TodoState()
    @State private var input = ""

    var body: some View {
        VStack {
            TextField("New item", text: $input)
            Button("Add") {
                state.add(input)
                input = ""
            }
            List(state.items, id: \.self) { Text($0) }
        }
        .padding()
    }
}
```

## 常见错误

- 把业务规则写散在多个按钮点击里
- 视图层直接处理复杂数据逻辑
- 一开始就追求复杂架构模板

## 本章小结

你学会了最小可行的架构分层思路，为项目长期维护打下基础。

What you learned: you can now separate responsibilities in SwiftUI code with a practical lightweight architecture.
