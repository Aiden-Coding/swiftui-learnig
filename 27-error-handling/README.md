# 27. 错误处理：用户反馈与恢复策略

## 学习目标

- 理解错误处理在产品体验中的价值
- 学会基础错误状态建模
- 能把失败场景转成清晰可恢复的 UI

## 中文讲解

错误处理不只是 `print(error)`，而是告诉用户发生了什么、还能做什么。好的错误处理可以显著降低用户挫败感，也方便开发排查问题。

在 SwiftUI 中，可以把错误抽成状态，例如 `loading`、`success`、`failure`。这样 UI 会更可预测，也更容易测试。

入门阶段建议先支持“失败提示 + 重试”，这是最有价值的最小闭环。

## English Notes

Error handling is more than logging. It should explain what happened and what the user can do next. Good error UX improves trust and maintainability.

In SwiftUI, model errors as states like `loading`, `success`, and `failure`. This makes UI predictable and testable.

A practical beginner baseline is: show error, provide retry.

## 示例代码

```swift
import SwiftUI

enum LoadState {
    case idle
    case loading
    case success([String])
    case failure(String)
}

struct ErrorHandlingView: View {
    @State private var state: LoadState = .idle

    var body: some View {
        VStack(spacing: 12) {
            switch state {
            case .idle:
                Text("Tap to load")
            case .loading:
                ProgressView()
            case .success(let items):
                Text("Loaded \(items.count) items")
            case .failure(let message):
                Text(message).foregroundStyle(.red)
            }
            Button("Retry") { state = .loading }
        }
    }
}
```

## 常见错误

- 失败后没有任何用户可执行动作
- 技术错误信息直接暴露给用户
- 错误状态与加载状态混在一起

## 本章小结

你学会了把错误处理从日志层提升到可恢复的用户体验层。

What you learned: you can now model and present failure states clearly in SwiftUI.
