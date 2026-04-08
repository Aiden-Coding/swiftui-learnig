# 02. 第一个 View 与基本语法

## 学习目标

- 理解：知道这一章解决什么问题。
- 实操：能写出并运行最小示例。
- 迁移：能把本章知识点用到自己的页面。

## 场景引入（为什么要学）

能看懂代码但不会自己搭页面。

如果你在这个场景里反复卡住，这一章就是为你准备的。我们会从最小可用方案出发，再逐步增强。

## 核心概念（小白版）

掌握 View、body、修饰符三者关系。

可以先记住一句话：**先跑通，再解释；先简单，再复杂**。这会让你学习 SwiftUI 的效率明显更高。

## 手把手操作步骤

1. 在工程中创建本章练习视图：Chapter02PracticeView。
2. 先复制“完整示例代码”，保证一次编译通过。
3. 运行后观察界面，确认每个元素都按预期出现。
4. 改动一个小点（文字/颜色/间距），验证你能控制界面。
5. 增加一个交互（按钮点击或状态切换），观察刷新机制。
6. 完成后按“自测清单”逐项检查，再做“练习任务”。

## 完整示例代码（可直接运行）

```swift
import SwiftUI

struct Chapter02PracticeView: View {
    @State private var counter = 0
    @State private var showDetail = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("第 02 章：第一个 View 与基本语法")
                .font(.headline)

            Text("核心目标：掌握 View、body、修饰符三者关系。")
                .foregroundStyle(.secondary)

            HStack {
                Button("点我 +1") {
                    counter += 1
                }
                .buttonStyle(.borderedProminent)

                Button(showDetail ? "隐藏说明" : "显示说明") {
                    showDetail.toggle()
                }
                .buttonStyle(.bordered)
            }

            Text("当前计数：\(counter)")

            if showDetail {
                Text("练习提示：遇到 some View 不要慌，先把它当作“某种视图”。")
                    .font(.footnote)
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.blue.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
    }
}
```
## 代码拆解（逐行理解）

- @State private var counter = 0：定义本地状态，按钮点击后会变化。
- @State private var showDetail = false：控制说明区域显示/隐藏。
- 第一个 Button：演示最基础的状态修改。
- 第二个 Button：演示布尔状态切换 UI 的常见写法。
- if showDetail：SwiftUI 条件渲染，状态变化会自动刷新。
- .background + .clipShape：让提示区更像真实产品中的信息卡片。

## 排错流程（遇到报错先看这里）

1. 先看 Xcode 报错第一行，不要先改别处。
2. 检查是否少写了括号、逗号或引号。
3. 检查状态变量类型是否和控件绑定一致。
4. 把你刚改的最后 3 处代码撤回，看是否恢复。
5. 若仍失败，先运行最小版本，再逐步加回改动。

## 自测清单

- 我能不看文档写出本章最小示例。
- 我能解释为什么这里使用 @State。
- 我能自己增加一个交互并保证不报错。
- 我知道这个知识点在真实项目中的应用位置。

## 练习任务（建议必做）

- 基础练习：新建一个欢迎页面，尝试 3 个不同修饰符组合。
- 加强练习：新增一个输入控件，并把输入结果展示到界面中。
- 挑战练习：把示例拆成父子两个 View，并通过参数传值。

## 常见问题（新手高频）

### 1) 预览没有更新怎么办？

先确保编译通过；如果通过但不刷新，重启预览或直接跑模拟器。

### 2) 为什么按钮点击后没变化？

通常是状态没绑定到界面，或者改的不是当前显示的视图。

### 3) 我写得和教程不一样可以吗？

可以。只要你能解释你的写法、并且行为正确，就是有效学习。

## 本章学习提示

遇到 some View 不要慌，先把它当作“某种视图”。

## 本章小结

你已经完成第 02 章的核心学习。建议花 10 分钟做一次“复述训练”：不用看文档，口头讲清本章的概念、代码结构和排错方法，这会显著提升你的掌握度。
