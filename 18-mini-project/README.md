# 18. 小项目实战：做一个学习打卡应用

## 学习目标

- 把前面学过的多个知识点串起来使用。
- 理解一个小项目通常由哪些页面和状态组成。
- 能做出一个可运行的基础版学习打卡页面。
- 建立“从零散知识点走向完整产品雏形”的感觉。

## 场景引入

学到这里，如果你还一直停留在“单个按钮”“单个列表”“单个表单”，会很难真正进入项目思维。所以这一章我们不再只练一个小点，而是把前面学过的内容串成一个小应用。

我们要做的是一个“学习打卡器”：

- 展示今天的学习任务
- 点击后可以切换完成状态
- 顶部显示今日完成进度
- 底部可以添加新的学习任务

它不大，但已经非常接近真实产品中一个完整功能模块的样子了。

## 做这个项目到底在练什么

这章最重要的，不只是做出一个页面，而是在练这几件事：

1. 把多个知识点串成一个完整功能闭环。
2. 让页面不只是“能显示”，还要“能交互、能反馈、能新增内容”。
3. 开始建立一点“产品感”，知道用户在这个页面要完成什么任务。

## 这个项目会用到哪些知识点

- `NavigationStack`
- `@State`
- `List`
- `TextField`
- 条件渲染
- 组件拆分
- 基础数据组织

## 先想清楚这个页面的最小闭环

一个合格的小项目，不一定功能很多，但至少应该有一个完整闭环。

这个页面的闭环就是：

- 用户看到任务
- 用户能标记完成
- 用户能新增任务
- 页面能实时反馈完成进度

只要这条链路是通的，这个项目就已经比很多“只有静态页面”的练习更有价值。

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

### 顶部进度区

这块区域不是装饰，而是在给用户即时反馈：

- 今天完成了多少
- 还有多少没完成

这类“数据反馈区”在真实产品里非常常见。

### 中间任务列表

`ForEach($tasks)` 是这章的关键点之一。

它的作用是：

- 遍历任务数组
- 同时拿到每一项的绑定
- 所以你可以直接改 `task.isDone`

### 底部新增任务输入区

这里体现了一个很常见的页面组织方式：

- 输入框先把文字存进状态变量
- 按钮负责触发添加逻辑
- 添加成功后再清空输入框

### `addTask()` 为什么要先去空格

因为用户可能只输入空格。如果不做这步处理，你就会得到一条“看起来是空白”的任务，这会让页面体验很奇怪。

## 这一章最值得学到的，不只是代码

更重要的是你开始知道：

- 一个页面不只是把组件摆出来
- 而是要围绕用户任务组织结构
- 页面要有输入、输出、反馈和边界处理

这就是为什么“小项目”阶段会让人进步很快。因为你终于开始从“零散知识点”走向“完整体验”。

## 新手最容易掉进的坑

### 坑 1：一上来就想做一个很大的 App

如果基础还没稳，项目越大越容易乱。先把一个小闭环做完整，反而更能提升能力。

### 坑 2：页面写出来了，但逻辑全堆在 `body` 里

当你开始觉得 `body` 很长、很乱时，其实已经在提醒你：下一步可以考虑拆函数、拆组件了。

### 坑 3：没考虑空输入和边界情况

比如新增任务时，空字符串要不要允许？
这种小问题，正是“练项目思维”的开始。

## 新手排错流程

1. 添加任务无效时，先检查输入框是否绑定到了 `newTaskTitle`。
2. 点击勾选无效时，检查 `ForEach` 是否拿到了绑定版本。
3. 进度条不对时，检查完成数量计算逻辑。
4. 新任务加上去了但输入框没清空时，检查 `addTask()` 最后有没有把输入重置。
5. 如果页面越来越乱，说明已经到了该拆分的阶段。

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

## 下一步推荐怎么接着学

这一章之后，最推荐的不是立刻换一个新项目，而是继续给这个小项目补能力，比如：

- 接第 16 章，补本地持久化
- 接第 17 章，提炼纯逻辑做测试
- 接第 20 章，尝试做结构拆分

这样你会明显感受到“同一个项目被一点点做完整”的成长感。

## 本章小结

学完这一章后，你已经不只是会写单个 SwiftUI 控件了，而是开始拥有把多个基础能力组合成一个小产品雏形的能力。这一步非常重要，因为它意味着你开始进入真正的项目学习阶段。
