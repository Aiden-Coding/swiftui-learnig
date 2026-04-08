# 15. 数据流进阶：Observable 与状态共享

## 学习目标

- 理解页面之间共享状态的基本方案
- 学会使用 `@Observable` 或 `ObservableObject` 思路组织数据
- 能把状态从“单页面”提升到“多页面共享”

## 中文讲解

当应用只有一个页面时，`@State` 就够了。但在多页面或多组件协作场景，状态需要被共享和集中管理，这时就要引入可观察数据模型。

现代 SwiftUI 可以使用 `@Observable`（或兼容场景下使用 `ObservableObject`）来表示“当模型变化时，依赖它的界面会刷新”。这样你可以把业务数据从视图中抽离出来，结构更清晰。

入门阶段不必过早追求复杂架构。先做到“模型负责数据，视图负责展示”就已经是很大的进步。

## English Notes

`@State` is enough for a single-screen case, but multi-screen apps usually require shared state. This is where observable models become useful.

In modern SwiftUI, you can use `@Observable` (or `ObservableObject` in compatible setups) so UI updates automatically when model data changes.

At this stage, keep it simple: model handles data, view handles presentation.

## 示例代码

```swift
import SwiftUI
import Observation

@Observable
final class UserSettings {
    var username: String = "Guest"
    var notificationsEnabled: Bool = true
}

struct SharedStateView: View {
    @State private var settings = UserSettings()

    var body: some View {
        VStack(spacing: 12) {
            Text("User: \(settings.username)")
            Toggle("Notifications", isOn: $settings.notificationsEnabled)
        }
        .padding()
    }
}
```

这个示例演示了模型数据变化如何自动驱动界面刷新。

This sample shows how model changes can automatically drive UI updates.

## 常见错误

- 还在单页面阶段就过度设计数据层
- 模型和视图职责混乱，导致维护困难
- 共享状态过多，边界不清晰

## 本章小结

你学会了把状态提升到可共享模型，并用可观察机制驱动多处界面更新。

What you learned: you can now move from local view state to shared observable data flow.
