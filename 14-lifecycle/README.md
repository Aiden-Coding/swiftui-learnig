# 14. 视图生命周期：页面什么时候出现、什么时候消失

## 学习目标

- 理解 `.onAppear`、`.onDisappear`、`.task` 的常见用途。
- 学会在页面显示和离开时安排逻辑。
- 知道什么逻辑适合页面出现时执行。

## 场景引入

很多真实需求都和“页面什么时候出现”有关，比如：

- 页面打开时自动加载数据
- 页面出现后开始计时
- 页面关闭时停止某些任务

这些需求都属于生命周期问题。虽然 SwiftUI 的生命周期写法比旧框架简单很多，但依然需要你有清晰思路。

## 本章术语先看懂

- `.onAppear`：视图出现在屏幕上时触发。
- `.onDisappear`：视图离开屏幕时触发。
- `.task`：视图出现时触发异步任务。
- `生命周期`：视图从出现到消失之间的重要时机点。

## 一句话理解

生命周期代码的核心，就是在对的时机做对的事。

## 完整示例代码

```swift
import SwiftUI

struct StudySessionView: View {
    @State private var seconds = 0
    @State private var note = "正在准备学习建议..."
    @State private var timer: Timer?

    var body: some View {
        VStack(spacing: 16) {
            Text("本次学习时长")
                .font(.headline)

            Text("\(seconds) 秒")
                .font(.system(size: 34, weight: .bold))

            Text(note)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
        }
        .padding()
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
        .task {
            await loadNote()
        }
    }

    private func startTimer() {
        stopTimer()

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            seconds += 1
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    @MainActor
    private func loadNote() async {
        try? await Task.sleep(for: .seconds(1))
        note = "建议你先学习 20 分钟基础内容，再进行 10 分钟练习。"
    }
}

#Preview {
    StudySessionView()
}
```

## 代码拆解（小白重点）

- `.onAppear` 里启动计时器，表示页面一出现就开始计时。
- `.onDisappear` 里停止计时器，避免页面离开后逻辑还在跑。
- `.task` 很适合做异步加载，比如请求数据、读缓存、等待结果。

## `.onAppear` 和 `.task` 怎么选

- 同步且轻量的逻辑，优先考虑 `.onAppear`。
- 异步逻辑，优先考虑 `.task`。

比如：

- 记录曝光、启动动画、开始计时：适合 `.onAppear`
- 请求数据、异步读取：适合 `.task`

## 新手常见误区

- 把所有逻辑都塞进 `.onAppear`。
- 页面离开时忘记清理定时器或监听器。
- 误以为生命周期只会触发一次。

## 新手排错流程

1. 计时器变快时，检查是否重复创建了多个定时器。
2. 页面离开后还在计时时，检查 `.onDisappear` 是否正确清理。
3. 异步内容不更新时，检查 `.task` 是否真的执行到完成分支。

## 章节小测（带答案）

### 题 1

页面一出现就要记录访问日志，适合放在哪里？

参考答案：适合放在 `.onAppear`。

### 题 2

页面一打开就请求数据，优先考虑什么？

参考答案：优先考虑 `.task`。

### 题 3

为什么页面离开时要停止定时器？

参考答案：避免逻辑继续执行，造成资源浪费和状态错误。

## 练习任务

- 基础练习：增加“暂停计时”按钮。
- 加强练习：把秒数改成“分:秒”格式。
- 挑战练习：增加一个离开页面时保存学习时长的说明设计。

## 本章小结

学完这章后，你应该已经知道：生命周期不是难概念，它只是帮你把“什么时候做什么”组织得更合理。
