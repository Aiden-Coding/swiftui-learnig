# 10. 模态展示：sheet、alert、confirmationDialog

## 学习目标

- 理解模态展示和页面导航的区别
- 学会使用 `sheet`、`alert`、`confirmationDialog`
- 能根据交互目的选择合适的展示方式

## 中文讲解

不是所有界面跳转都适合放进导航栈。有时候我们只想临时展示一个编辑面板、提示框或操作菜单，这种场景就更适合使用模态展示。

`sheet` 通常用于展示一个临时但相对完整的界面，比如新增任务、编辑资料、选择筛选条件。`alert` 更适合简短提示或确认危险操作。`confirmationDialog` 则适合给用户几个操作选项。

学习这一章时，最重要的是理解交互语义。导航通常意味着“进入新的内容层级”，而模态通常意味着“打断当前流程，处理一个临时任务”。

## English Notes

Not every UI transition belongs in a navigation stack. Sometimes you only want to show a temporary editor, a warning, or a small action menu. These cases are better handled with modal presentation.

`sheet` is commonly used for temporary but richer content such as adding a task or editing a profile. `alert` is better for short messages or confirming a risky action. `confirmationDialog` is useful when the user needs to choose from a few actions.

The key idea is interaction meaning. Navigation usually means moving deeper into content, while a modal usually interrupts the current flow to complete a temporary task.

## 示例代码

```swift
import SwiftUI

struct ModalExampleView: View {
    @State private var showingSheet = false
    @State private var showingAlert = false

    var body: some View {
        VStack(spacing: 16) {
            Button("Show Sheet") {
                showingSheet = true
            }

            Button("Delete Item") {
                showingAlert = true
            }
            .foregroundStyle(.red)
        }
        .sheet(isPresented: $showingSheet) {
            NavigationStack {
                Text("Create a new note")
                    .navigationTitle("New Note")
            }
        }
        .alert("Delete this item?", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("This action cannot be undone.")
        }
    }
}
```

这个例子同时展示了临时页面和确认提示框两种典型模态交互。

This example shows two common modal interactions: a temporary sheet and a confirmation alert.

## 常见错误

- 把本来应该导航的页面做成弹窗
- `sheet` 弹出来了，但没有给内容足够清晰的标题
- 提示框里放了太多信息，导致用户很难快速决策

## 本章小结

你学会了 SwiftUI 中常见的模态展示方式，也理解了它们和导航的角色差异。

What you learned: you can now choose between `sheet`, `alert`, and `confirmationDialog` based on the meaning of the interaction.
