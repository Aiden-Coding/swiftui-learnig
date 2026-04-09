# 25. Swift 并发基础：async、await 和 Task 怎么配合

## 学习目标

- 理解 Swift 并发为什么能让异步代码更好读。
- 学会区分 `async`、`await`、`Task` 的基本作用。
- 能看懂一个最基础的异步加载写法。

## 场景引入

以前很多异步代码会写成一层层回调，逻辑一复杂就很容易乱。Swift 并发的目标，就是让这种代码写起来更像顺序流程，更容易读。

对 SwiftUI 新手来说，不需要一开始就掌握所有并发细节。先把 `async`、`await`、`Task` 这三个角色分清楚，就已经能解决很多实际问题了。

## 本章术语先看懂

- `async`：声明一个函数是异步的。
- `await`：等待异步结果返回。
- `Task`：启动一个异步任务。
- `并发`：让多个任务更合理地被调度，而不是全都堵在主线程上。

## 一句话理解

`async` 是能力声明，`await` 是等待结果，`Task` 是启动工作。

## 完整示例代码

```swift
import SwiftUI

struct ConcurrencyDemoView: View {
    @State private var message = "点击按钮开始加载"
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 16) {
            Text(message)
                .multilineTextAlignment(.center)

            if isLoading {
                ProgressView()
            }

            Button("加载学习建议") {
                Task {
                    await loadSuggestion()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    @MainActor
    private func loadSuggestion() async {
        isLoading = true
        message = "正在加载中..."

        try? await Task.sleep(for: .seconds(1.5))

        message = "建议你今天先复习状态管理，再练习列表与导航。"
        isLoading = false
    }
}

#Preview {
    ConcurrencyDemoView()
}
```

## 代码拆解（小白重点）

- 按钮点击后，我们用 `Task` 启动异步工作。
- `loadSuggestion()` 被标记成 `async`，说明它里面会执行异步操作。
- `await Task.sleep(...)` 表示这里需要等待一段异步时间。
- 更新界面的代码放在 `@MainActor` 环境里，更符合 SwiftUI 页面更新要求。

## 新手常见误区

- 看到 `async` 就以为函数会自动执行。
- 忘记 `await`，导致调用方式不对。
- 异步结束后改界面状态，却没注意主线程更新问题。

## 新手排错流程

1. 函数明明是异步的却直接调用报错时，检查是否放在 `Task` 中或异步上下文里。
2. 调用异步函数时报错时，检查是否忘了 `await`。
3. 页面状态异常时，检查异步前后是否正确切换了 `isLoading`。

## 章节小测（带答案）

### 题 1

`Task` 最常见的用途是什么？

参考答案：用来启动一段异步任务。

### 题 2

`await` 的作用是什么？

参考答案：等待异步操作完成后再继续往下执行。

### 题 3

为什么异步页面通常要配合加载状态？

参考答案：因为用户需要知道页面当前是不是正在处理任务。

## 练习任务

- 基础练习：让按钮文案在加载时变成“加载中”。
- 加强练习：增加一个失败状态。
- 挑战练习：做两个异步步骤串联执行的演示页面。

## 本章小结

学完这章后，你应该已经知道：Swift 并发的核心价值，是让异步代码写得更像顺序逻辑，更容易理解和维护。

## 本章完成标准

学完这一章后，你至少应该能做到：

- 能分清 `async`、`await`、`Task` 的基本角色
- 能写一个最小异步加载按钮流程
- 能理解为什么异步页面通常需要加载状态

## 学完这一章后马上可以做的练习

做一个最小“加载建议”页面：

- 点按钮开始加载
- 显示加载中状态
- 1-2 秒后显示结果

这一步很适合帮你把并发基础从词汇变成可见行为。

## 下一章为什么建议继续学网络层

当你理解了并发基础以后，最自然的真实场景就是：

- 把异步能力放进实际数据请求里

所以建议接着看：

- [26 网络层基础：不要把请求代码直接塞进页面](/D:/Documents/GitHub/swiftui-learnig/26-networking-layer/README.md)
