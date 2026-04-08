# 20. 架构基础：分层与职责

## 学习目标

- 理解：知道这章解决什么问题。
- 实操：能独立跑通最小示例。
- 迁移：能把本章能力用到自己的项目。

## 场景引入（你会在哪遇到它）

- 理解：知道这章解决什么问题。

## 本章术语先看懂

- 关键词：核心概念、实战迁移
- 一句话理解：围绕本章主题完成一个可运行业务片段。

## 手把手步骤（每一步都有预期结果）

1. 创建视图 Chapter20PracticeView。  
   预期结果：工程能编译，页面可显示容器。
2. 粘贴完整示例代码并运行。  
   预期结果：页面显示核心交互和数据反馈。
3. 做一次交互操作（点击/输入/切换）。  
   预期结果：界面状态随操作变化。
4. 修改一个文案或样式后重跑。  
   预期结果：你能稳定控制页面输出。
5. 完成章节小测与练习任务。  
   预期结果：可以不看文档复现关键代码。

## 完整示例代码

```swift
import SwiftUI

struct TodoState {
    var items: [String] = []
    mutating func add(_ text: String) {
        guard !text.isEmpty else { return }
        items.append(text)
    }
}

struct ArchitectureDemoView: View {
    @State private var state = TodoState()
    @State private var input = ""

    var body: some View {
        VStack {
            TextField("输入任务", text: $input).textFieldStyle(.roundedBorder)
            Button("添加") { state.add(input); input = "" }
            List(state.items, id: \.self) { Text(## 完整示例代码

```swift
import SwiftUI

struct Chapter20BusinessCaseView: View {
    @State private var progress = 0
    @State private var note = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("架构基础：分层与职责")
                .font(.headline)

            Stepper("进度：\(progress)", value: , in: 0...10)

            TextField("记录本章心得", text: )
                .textFieldStyle(.roundedBorder)

            Text("当前记录：\(note.isEmpty ? "暂无" : note)")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}```

## 代码拆解（小白重点）

- Stepper 模拟阶段进度变化。
- TextField 记录学习输入。
- 输出区域展示状态绑定结果。

) }
        }.padding()
    }
}
```

## 代码拆解（小白重点）

- `TodoState` 承载规则，View 负责展示。
- 输入逻辑和显示逻辑分离。
- 分层后可维护性更高。

## 新手排错流程（建议照着做）

1. 先看第一条报错，不要一次改很多地方。
2. 检查括号、引号、逗号是否成对。
3. 检查状态变量名称是否一致。
4. 回退最近 1-2 处改动再重跑。
5. 回到最小可运行状态后再逐步添加。

## 章节小测（带答案）

### 题 1
本章示例里，哪个状态变量会驱动界面变化？

参考答案：由 @State 标注的变量会驱动界面更新。

### 题 2
为什么建议先跑通最小示例再扩展？

参考答案：先确认基础链路正确，扩展时更容易定位问题。

### 题 3
如果交互后 UI 不更新，优先检查什么？

参考答案：是否修改了绑定到界面的状态，是否操作了正确视图。

## 练习任务

- 基础练习：把新增逻辑从 View 抽到状态层。
- 加强练习：增加一个输入控件，并把结果实时显示。
- 挑战练习：把交互区抽成子视图并通过参数/绑定通信。

## 复盘模板（建议每章都写）

- 我今天真正学会了什么：
- 我仍然不理解的点：
- 我可以在哪个页面立刻用上它：
- 我下次要避免的错误：

## 本章学习提示



## 本章小结

本章结束后，你应该已经能完成：把本章能力迁移到真实项目。 如果还不稳，先重复“手把手步骤”一次，再进入下一章。
