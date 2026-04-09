# 15. 可观察数据流：让多个页面共享数据变化

## 学习目标

- 理解为什么某些数据不适合只放在 `@State` 里。
- 学会使用 `ObservableObject`、`@Published`、`@StateObject`、`@ObservedObject`。
- 能看懂一个共享任务列表的基础示例。

## 场景引入

当一份数据只在当前页面使用时，`@State` 非常好用。但如果你遇到这种情况：

- 首页显示待完成任务数量
- 列表页可以修改任务状态
- 修改后多个地方都要同步刷新

这时候就需要一份“可被多个视图共同观察”的数据对象。

## 本章术语先看懂

- `ObservableObject`：可被多个视图观察的数据对象。
- `@Published`：属性变化时自动通知界面刷新。
- `@StateObject`：创建并持有一个可观察对象。
- `@ObservedObject`：接收外部传入的可观察对象。

## 一句话理解

一份数据只要需要被多个视图同时读取和修改，就值得考虑放进可观察对象里。

## 完整示例代码

```swift
import SwiftUI

final class TaskStore: ObservableObject {
    @Published var tasks: [StudyTask] = [
        StudyTask(title: "完成 SwiftUI 布局练习", isDone: false),
        StudyTask(title: "阅读状态管理章节", isDone: true),
        StudyTask(title: "实现一个导航页面", isDone: false)
    ]

    var completedCount: Int {
        tasks.filter(\.isDone).count
    }

    func toggleTask(_ task: StudyTask) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isDone.toggle()
    }
}

struct StudyTask: Identifiable {
    let id = UUID()
    let title: String
    var isDone: Bool
}

struct ObservableTaskHomeView: View {
    @StateObject private var store = TaskStore()

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                VStack(spacing: 6) {
                    Text("已完成 \(store.completedCount) / \(store.tasks.count)")
                        .font(.title3)
                        .fontWeight(.semibold)

                    ProgressView(value: Double(store.completedCount), total: Double(store.tasks.count))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 16))

                TaskListSection(store: store)
            }
            .padding()
            .navigationTitle("学习任务")
        }
    }
}

struct TaskListSection: View {
    @ObservedObject var store: TaskStore

    var body: some View {
        List {
            ForEach(store.tasks) { task in
                Button {
                    store.toggleTask(task)
                } label: {
                    HStack {
                        Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(task.isDone ? .green : .gray)

                        Text(task.title)
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ObservableTaskHomeView()
}
```

## 代码拆解（小白重点）

- `TaskStore` 是共享数据中心。
- `@Published var tasks` 一变化，依赖它的界面就会刷新。
- 首页用 `@StateObject` 创建并持有 `store`。
- 子视图用 `@ObservedObject` 接收这份共享对象。

## 新手常见误区

- 每个页面都各自创建一份 `TaskStore`，导致数据不同步。
- 忘记给关键属性加 `@Published`，界面不刷新。
- 把只属于局部页面的状态也硬塞进共享对象里。

## 新手排错流程

1. 数据不同步时，先检查是不是创建了多份对象。
2. 属性变了但界面没更新时，检查是否加了 `@Published`。
3. 子视图拿不到最新数据时，检查传入的是不是同一个 `store`。

## 章节小测（带答案）

### 题 1

什么时候比 `@State` 更适合用 `ObservableObject`？

参考答案：当一份数据要被多个视图共同读取和修改时。

### 题 2

`@Published` 的作用是什么？

参考答案：在属性变化时通知界面刷新。

### 题 3

`@StateObject` 和 `@ObservedObject` 的核心区别是什么？

参考答案：前者用于创建并持有对象，后者用于接收外部对象。

## 练习任务

- 基础练习：增加一个“只看未完成任务”的筛选。
- 加强练习：增加新增任务输入框。
- 挑战练习：把顶部统计卡片抽成单独组件，并继续共享同一个 `store`。

## 本章小结

学完这章后，你应该已经理解：当数据要跨多个视图同步变化时，就不能只靠局部状态，而要把共享数据组织成可观察对象。
