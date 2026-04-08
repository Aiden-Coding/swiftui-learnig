# 08. 表单与输入：TextField、Toggle、Picker

## 学习目标

- 学会处理用户输入
- 理解表单控件如何与状态结合
- 能写出一个简单的设置或资料编辑界面

## 中文讲解

表单是应用中非常常见的一类界面，比如登录、个人资料、设置项、筛选条件。SwiftUI 提供了很多适合输入场景的控件，其中最常见的是 `TextField`、`Toggle` 和 `Picker`。

这些控件通常不会单独使用，而是和状态绑定在一起。也就是说，输入框里的文字、开关的开闭状态、选中的选项，都会直接映射到某个状态值。

对于新手来说，表单章节很重要，因为它把前面学过的状态管理和界面组件真正连了起来。你会第一次明显感受到“数据变化就驱动 UI”。

## English Notes

Forms are common in apps for login, profile editing, settings, and filters. SwiftUI provides several controls for input, especially `TextField`, `Toggle`, and `Picker`.

These controls are usually connected to state. The text in a field, the on/off value of a toggle, and the selected picker option all map directly to state values.

This chapter matters because it brings together earlier lessons about state and views. You can clearly see how changing data drives the interface.

## 示例代码

```swift
import SwiftUI

struct SettingsFormView: View {
    @State private var username = ""
    @State private var notificationsEnabled = true
    @State private var selectedLevel = "Beginner"

    let levels = ["Beginner", "Intermediate", "Advanced"]

    var body: some View {
        Form {
            TextField("Username", text: $username)

            Toggle("Enable Notifications", isOn: $notificationsEnabled)

            Picker("Learning Level", selection: $selectedLevel) {
                ForEach(levels, id: \.self) { level in
                    Text(level)
                }
            }
        }
        .navigationTitle("Settings")
    }
}
```

这个例子展示了典型的输入型界面：多个控件共同读写状态。

This example shows a classic input screen where multiple controls read from and write to state.

## 常见错误

- 忘记输入控件几乎都需要绑定值
- `Picker` 能显示出来，但没有理解 `selection` 对应的状态
- 把表单页面写得太复杂，导致学习重点被分散

## 本章小结

你学会了常见表单控件的入门用法，也看到了它们如何和状态系统一起工作。

What you learned: you now know how basic input controls work in SwiftUI and how they connect directly to state.
