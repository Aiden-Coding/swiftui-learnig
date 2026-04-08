# 19. SwiftData 入门

## 学习目标

- 理解 SwiftData 在 SwiftUI 项目中的定位
- 学会定义最基础的数据模型
- 能完成新增、查询、删除的最小闭环

## 中文讲解

当应用需要保存结构化数据时，`@AppStorage` 就不够用了。SwiftData 是 Apple 提供的现代本地数据方案，和 SwiftUI 集成度很高，适合做对象化的数据存储与查询。

入门阶段你只需要掌握三件事：定义模型、插入数据、读取数据。先让数据能稳定地保存和展示，再考虑更复杂的关系和迁移。

SwiftData 在学习路径里是从“轻量持久化”走向“结构化持久化”的关键一步。

## English Notes

When your app needs structured local data, `@AppStorage` is no longer enough. SwiftData is Apple's modern local persistence framework and integrates well with SwiftUI.

At the beginner stage, focus on three essentials: model definition, insertion, and querying. Build a stable data loop first, then move to advanced relationships and migrations.

SwiftData is the bridge from lightweight persistence to structured data management.

## 示例代码

```swift
import SwiftUI
import SwiftData

@Model
final class TaskItem {
    var title: String
    var isDone: Bool

    init(title: String, isDone: Bool = false) {
        self.title = title
        self.isDone = isDone
    }
}

struct SwiftDataListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [TaskItem]

    var body: some View {
        List(items) { item in
            Text(item.title)
        }
        .toolbar {
            Button("Add") {
                modelContext.insert(TaskItem(title: "New Task"))
            }
        }
    }
}
```

## 常见错误

- 把 SwiftData 当成“自动解决所有数据问题”的工具
- 没有先定义清晰模型就开始堆功能
- 在入门阶段过早引入复杂关系

## 本章小结

你学会了 SwiftData 的基础使用方式，并理解了它在 SwiftUI 数据层中的角色。

What you learned: you can now build a minimal structured persistence loop with SwiftData.
