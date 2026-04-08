# 16. 数据持久化入门：AppStorage 与本地保存

## 学习目标

- 理解为什么需要持久化状态
- 学会使用 `@AppStorage` 保存轻量设置
- 知道何时该升级到更完整的存储方案

## 中文讲解

如果用户退出应用后所有设置都丢失，体验会很差。SwiftUI 提供了 `@AppStorage`，可以很方便地把简单偏好保存到 `UserDefaults`，例如主题、开关、用户名等。

`@AppStorage` 适合轻量 key-value 数据，不适合复杂结构或大量记录。对于更复杂的场景，你可以后续学习 SwiftData、Core Data 或文件存储。

入门阶段先掌握“保存一个设置并在重启后恢复”，就能建立持久化的基础认知。

## English Notes

If user settings disappear every time the app restarts, the experience suffers. SwiftUI provides `@AppStorage` for simple persistence with `UserDefaults`.

`@AppStorage` works well for lightweight key-value data such as preferences and toggles. For complex structured data, you should move to stronger storage options later.

Beginner goal: save one setting and restore it after relaunch.

## 示例代码

```swift
import SwiftUI

struct PersistenceExampleView: View {
    @AppStorage("display_name") private var displayName = "Guest"

    var body: some View {
        Form {
            TextField("Display Name", text: $displayName)
            Text("Hello, \(displayName)")
        }
    }
}
```

这个示例展示了最小可用的本地持久化流程。

This sample demonstrates the smallest practical local persistence flow.

## 常见错误

- 把复杂业务数据全部塞进 `UserDefaults`
- 忘记给 key 做清晰命名
- 误以为持久化后就不需要状态管理

## 本章小结

你学会了使用 `@AppStorage` 做轻量持久化，并理解了它的使用边界。

What you learned: you can now persist simple SwiftUI settings with `@AppStorage`.
