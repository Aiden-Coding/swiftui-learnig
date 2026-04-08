# 25. Swift 并发基础：async/await 与 Task

## 学习目标

- 理解 Swift 并发在 SwiftUI 中的核心价值
- 学会 `async/await` 与 `Task` 的基础使用
- 能在不阻塞 UI 的前提下执行异步流程

## 中文讲解

SwiftUI 强调流畅交互，因此耗时操作不应阻塞主线程。Swift 并发提供了更直观的写法来处理异步任务，最常见的是 `async/await` 和 `Task`。

你可以把 `Task` 理解为一个可管理的异步工作单元。它能让我们在按钮点击或视图生命周期中启动异步逻辑，并在完成后更新状态。

入门阶段重点是“会正确更新 UI 状态”，而不是同时处理所有并发细节。

## English Notes

SwiftUI depends on smooth interaction, so long-running work should never block the main thread. Swift concurrency gives you clear async tools, especially `async/await` and `Task`.

You can think of `Task` as a managed async unit of work. It lets you start async logic from UI events and update state when it finishes.

At this stage, focus on safe UI state updates rather than advanced concurrency patterns.

## 示例代码

```swift
import SwiftUI

struct ConcurrencyExampleView: View {
    @State private var message = "Idle"

    var body: some View {
        VStack(spacing: 12) {
            Text(message)
            Button("Run Async Task") {
                Task {
                    message = "Loading..."
                    try? await Task.sleep(for: .seconds(1))
                    message = "Done"
                }
            }
        }
        .padding()
    }
}
```

## 常见错误

- 异步任务开始了但没有更新加载状态
- 忽略任务取消和重复触发
- 在并发代码里混入过多 UI 细节

## 本章小结

你学会了在 SwiftUI 中使用 `Task` 和 `async/await` 执行基础异步流程。

What you learned: you can now run async work in SwiftUI without blocking the interface.
