# 18. 小项目实战：做一个学习打卡应用

## 学习目标

- 把前面学过的多个知识点串起来使用。
- 理解一个小项目通常由哪些页面和状态组成。
- 能做出一个可运行的基础版学习打卡页面。

## 场景引入

学到这里，如果你还一直停留在“单个按钮”“单个列表”“单个表单”，会很难真正进入项目思维。所以这一章我们不再只练一个小点，而是把前面学过的内容串成一个小应用。

我们要做的是一个“学习打卡器”：

- 展示今天的学习任务
- 点击后可以切换完成状态
- 顶部显示今日完成进度
- 底部可以添加新的学习任务

## 这个项目会用到哪些知识点

- `NavigationStack`
- `@State`
- `List`
- `TextField`
- 条件渲染
- 组件拆分

## 完整示例代码

```swift
import SwiftUI

struct StudyCheckInAppView: View {
    @State private var newTaskTitle = ""
    @State private var tasks: [DailyStudyTask] = [
        DailyStudyTask(title: "看完 SwiftUI 状态管理章节", isDone: true),
        DailyStudyTask(title: "完成布局练习 3 题", isDone: false),
        DailyStudyTask(title: "复习导航和表单", isDone: false)
    ]

    var completedCount: Int {
        tasks.filter(\.isDone).count
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                VStack(spacing: 8) {
                    Text("今日学习进度")
                        .font(.headline)

                    Text("\(completedCount) / \(tasks.count)")
                        .font(.system(size: 30, weight: .bold))

                    ProgressView(value: Double(completedCount), total: Double(max(tasks.count, 1)))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))

                List {
                    Section("今日任务") {
                        ForEach($tasks) { $task in
                            HStack {
                                Button {
                                    task.isDone.toggle()
                                } label: {
                                    Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(task.isDone ? .green : .gray)
                                }
                                .buttonStyle(.plain)

                                Text(task.title)
                                    .strikethrough(task.isDone, color: .secondary)
                                    .foregroundStyle(task.isDone ? .secondary : .primary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                .listStyle(.insetGrouped)

                VStack(spacing: 10) {
                    TextField("输入新的学习任务", text: $newTaskTitle)
                        .textFieldStyle(.roundedBorder)

                    Button("添加任务") {
                        addTask()
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .navigationTitle("学习打卡")
        }
    }

    private func addTask() {
        let trimmed = newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        tasks.append(DailyStudyTask(title: trimmed, isDone: false))
        newTaskTitle = ""
    }
}

struct DailyStudyTask: Identifiable {
    let id = UUID()
    let title: String
    var isDone: Bool
}

#Preview {
    StudyCheckInAppView()
}
```

## 代码拆解（小白重点）

- 顶部区域负责给用户即时反馈，让用户知道今天完成了多少。
- `ForEach($tasks)` 让我们能直接修改每一项任务的完成状态。
- 新任务输入先进入状态，再由按钮统一处理，是很常见的页面组织方式。

## 新手常见误区

- 一上来就想做很大的项目，结果代码完全失控。
- 页面写出来了，但逻辑全堆在 `body` 里。
- 没考虑空输入和边界情况。

## 新手排错流程

1. 添加任务无效时，先检查输入框是否绑定到了 `newTaskTitle`。
2. 点击勾选无效时，检查 `ForEach` 是否拿到了绑定版本。
3. 进度条不对时，检查完成数量计算逻辑。

## 章节小测（带答案）

### 题 1

为什么做小项目能帮助你更快进步？

参考答案：因为它能把多个零散知识点串起来，形成完整思维。

### 题 2

为什么 `addTask()` 要过滤空白输入？

参考答案：为了避免添加没有实际内容的无效任务。

### 题 3

当项目开始变长时，下一步应该做什么？

参考答案：逐步拆分函数、组件和数据结构，让代码保持清晰。

## 练习任务

- 基础练习：增加删除任务功能。
- 加强练习：增加“只看未完成”筛选。
- 挑战练习：把这个项目接上本地持久化，让任务在重启后仍然存在。

## 本章小结

学完这章后，你已经不只是会写单个 SwiftUI 控件了，而是开始拥有把多个基础能力组合成一个小产品的能力。
