# 19. SwiftData 基础：更现代地保存结构化数据

## 学习目标

- 理解 SwiftData 和简单本地存储的区别。
- 知道 `@Model`、`@Query`、`modelContext` 分别负责什么。
- 能看懂一个最基础的 SwiftData 增删查示例。

## 场景引入

前一章我们学了 `@AppStorage`，它很适合保存简单开关和少量设置。但如果你现在要做的是：

- 待办事项列表
- 学习笔记列表
- 习惯追踪记录

这类“有多条记录、每条记录还有多个字段”的数据，就更适合用 `SwiftData` 这样的结构化存储方案。

## 本章术语先看懂

- `SwiftData`：Apple 提供的现代本地数据持久化方案。
- `@Model`：把一个类型声明成可持久化的数据模型。
- `@Query`：从本地数据库查询模型数据。
- `modelContext`：负责插入、删除、保存数据的环境对象。

## 一句话理解

`@AppStorage` 更像“记设置”，`SwiftData` 更像“存一张有结构的数据表”。

## 完整示例代码

```swift
import SwiftUI
import SwiftData

@Model
final class StudyNote {
    var title: String
    var createdAt: Date

    init(title: String, createdAt: Date = .now) {
        self.title = title
        self.createdAt = createdAt
    }
}

struct SwiftDataNotesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \StudyNote.createdAt, order: .reverse) private var notes: [StudyNote]

    @State private var newTitle = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                HStack {
                    TextField("输入新的学习笔记标题", text: $newTitle)
                        .textFieldStyle(.roundedBorder)

                    Button("新增") {
                        addNote()
                    }
                    .buttonStyle(.borderedProminent)
                }

                List {
                    ForEach(notes) { note in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(note.title)
                                .font(.headline)

                            Text(note.createdAt.formatted(date: .abbreviated, time: .shortened))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: deleteNotes)
                }
                .listStyle(.plain)
            }
            .padding()
            .navigationTitle("学习笔记")
        }
    }

    private func addNote() {
        let trimmed = newTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        let note = StudyNote(title: trimmed)
        modelContext.insert(note)
        newTitle = ""
    }

    private func deleteNotes(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(notes[index])
        }
    }
}

#Preview {
    SwiftDataNotesView()
        .modelContainer(for: StudyNote.self, inMemory: true)
}
```

## 代码拆解（小白重点）

- `@Model` 让 `StudyNote` 变成可持久化的数据模型。
- `@Query` 负责把本地数据查询出来，并在数据变化时自动刷新页面。
- `modelContext` 是操作 SwiftData 的入口，常用来插入和删除数据。

## SwiftData 和前面知识的关系

- `@State`：当前页面临时状态
- `@AppStorage`：简单配置持久化
- `ObservableObject`：共享运行时数据
- `SwiftData`：结构化本地数据存储

## 新手常见误区

- 把 SwiftData 当成“更高级的数组”。
- 预览里忘记配置 `.modelContainer(...)`。
- 简单设置项也急着用 SwiftData，反而增加复杂度。

## 新手排错流程

1. 预览报错时，先检查 `#Preview` 是否配置了 `modelContainer`。
2. 新增后列表不刷新时，检查是不是通过 `modelContext.insert(...)` 添加。
3. 删除无效时，检查 `onDelete` 是否连到了正确函数。

## 章节小测（带答案）

### 题 1

什么类型的数据更适合 SwiftData？

参考答案：多条记录、字段较多、需要结构化管理的数据。

### 题 2

`@Query` 的作用是什么？

参考答案：查询本地数据，并在数据变化时驱动界面自动更新。

### 题 3

`modelContext` 常用来做什么？

参考答案：插入、删除和管理模型数据。

## 练习任务

- 基础练习：给笔记增加“是否重点”字段。
- 加强练习：只显示最近 7 天创建的笔记。
- 挑战练习：把笔记列表改造成“学习打卡记录”模型。

## 本章小结

学完这章后，你应该已经知道：当数据不再只是几个开关，而是成批、成结构地存在时，SwiftData 会比简单本地存储更适合你。
