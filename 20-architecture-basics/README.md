# 20. 架构基础：分层与职责

## 学习目标

- 理解：知道这章解决什么问题。
- 实操：能独立跑通最小示例。
- 迁移：能把本章能力用到自己的项目。

## 场景引入（你会在哪遇到它）

所有代码都在 View 里，越写越难改。

## 本章术语先看懂

- 关键词：分层、职责、解耦
- 一句话理解：明确 View、State、Data 职责边界。

## 手把手步骤（每一步都有预期结果）

1. 创建视图 Chapter20PracticeView。  
   预期结果：工程能编译，页面可显示空白容器。
2. 粘贴完整示例代码并运行。  
   预期结果：能看到标题、按钮、计数和说明区。
3. 点击“点我 +1”。  
   预期结果：计数数字递增。
4. 点击“显示说明/隐藏说明”。  
   预期结果：说明区出现或消失。
5. 修改标题文案并再次运行。  
   预期结果：你改的文案正确显示。
6. 完成“章节小测”和“练习任务”。  
   预期结果：你能不看文档复现主要代码。

## 完整示例代码

```swift
import SwiftUI

struct Chapter20PracticeView: View {
    @State private var counter = 0
    @State private var showDetail = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("第 20 章：架构基础：分层与职责")
                    .font(.headline)

                Text("核心目标：明确 View、State、Data 职责边界。")
                    .foregroundStyle(.secondary)

                HStack(spacing: 12) {
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
                    .font(.title3)

                if showDetail {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("学习提示")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("分层的目标是降低维护成本。")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.blue.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding()
        }
    }
}
```

## 代码拆解（小白重点）

- @State private var counter = 0：存“会变”的数据。
- @State private var showDetail = false：控制视图是否显示。
- Button("点我 +1")：按钮动作里改状态，界面自动刷新。
- if showDetail：根据状态条件渲染内容。
- ScrollView + VStack：保证内容多时也能滚动查看。

## 新手排错流程（建议照着做）

1. 先看第一条报错，不要一次改很多地方。
2. 检查括号、引号、逗号是否成对。
3. 检查状态变量名字是否拼写一致。
4. 只撤回你最近改的 1-2 处代码。
5. 回到最小可运行版本，再逐步加回改动。

## 章节小测（带答案）

### 题 1
@State 的核心作用是什么？

参考答案：用于保存当前视图拥有的可变状态，状态变化会触发界面更新。

### 题 2
为什么要先跑通最小示例再做扩展？

参考答案：先确认基础链路正确，再逐步加复杂度，能更快定位问题。

### 题 3
如果按钮点击后界面没变化，优先检查什么？

参考答案：是否真的修改了绑定到界面的状态变量，以及是否在当前显示视图里修改。

## 练习任务

- 基础练习：把新增逻辑从 View 抽到状态层。
- 加强练习：增加一个 TextField，把输入内容实时显示在页面。
- 挑战练习：把按钮区拆成子视图，并通过参数/绑定通信。

## 复盘模板（建议每章都写）

- 我今天真正学会了什么：
- 我仍然不理解的点：
- 我可以在哪个页面立刻用上它：
- 我下次要避免的错误：

## 本章学习提示

分层的目标是降低维护成本。

## 本章小结

本章结束后，你应该已经能完成：做出最小可维护结构。。如果还不稳，先重复“手把手步骤”一次，再进入下一章。