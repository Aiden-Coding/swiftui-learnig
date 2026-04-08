# 14. 生命周期：onAppear、onDisappear、task

## 学习目标

- 理解视图出现和消失时可以做什么
- 学会区分 `onAppear` 与 `task` 的常见用法
- 能在合适时机触发初始化加载

## 中文讲解

SwiftUI 视图会随着状态变化不断重建，因此生命周期代码应该写得简洁、可重复执行、无副作用。常见入口包括 `onAppear`、`onDisappear` 和 `task`。

`onAppear` 适合轻量逻辑，比如埋点、重置局部状态。`task` 更适合异步任务，比如首次加载数据。两者都可能被多次触发，所以要避免重复请求或重复初始化。

写生命周期逻辑时，建议先问自己两个问题：这段逻辑是否可重复执行？如果页面很快切换，是否需要取消任务？

## English Notes

SwiftUI views are rebuilt frequently as state changes, so lifecycle code should be lightweight, repeatable, and safe to run more than once. Common hooks include `onAppear`, `onDisappear`, and `task`.

`onAppear` is good for lightweight effects like analytics or quick local setup. `task` is better for async work such as loading data.

Always consider repeat triggers and cancellation behavior when writing lifecycle logic.

## 示例代码

```swift
import SwiftUI

struct LifecycleExampleView: View {
    @State private var message = "Waiting..."

    var body: some View {
        Text(message)
            .onAppear {
                message = "View appeared"
            }
            .task {
                try? await Task.sleep(for: .seconds(1))
                message = "Async task finished"
            }
    }
}
```

这个示例演示了同步生命周期逻辑和异步任务入口的组合。

This sample combines a synchronous appear event with an async startup task.

## 常见错误

- 把重逻辑放在 `onAppear` 里阻塞界面
- 忽略生命周期会被重复触发的事实
- 异步任务没有考虑取消和幂等

## 本章小结

你学会了在 SwiftUI 中把初始化逻辑放在合适时机，并理解了生命周期的重复触发特性。

What you learned: you now know how to use `onAppear` and `task` safely for startup behavior.
