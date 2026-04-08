# 35. App Intents 入门

## 学习目标

- 理解 App Intents 的作用和场景
- 学会暴露一个最小可调用动作
- 建立“系统入口复用能力”的思维

## 中文讲解

App Intents 让系统可以调用你应用的动作，例如快捷指令、Siri 或系统自动化入口。这让你的功能不再只存在于 App 内部页面。

入门阶段先做一个简单动作，例如“快速新增任务”。关键是定义清晰输入和预期输出，让系统调用行为稳定可预测。

当核心动作被标准化后，你的应用可组合能力会明显增强。

## English Notes

App Intents allow system surfaces like Shortcuts and Siri to trigger app actions. This extends your app capabilities beyond in-app navigation.

Start with one simple intent, such as quickly creating a task. Define clear inputs and predictable output behavior.

Well-defined intents improve automation and reusability across the Apple ecosystem.

## 示例代码

```swift
import AppIntents

struct AddTaskIntent: AppIntent {
    static var title: LocalizedStringResource = "Add Task"

    @Parameter(title: "Title")
    var title: String

    func perform() async throws -> some IntentResult {
        // Save task here.
        return .result()
    }
}
```

## 常见错误

- 意图参数定义含糊，导致调用体验不稳定
- 动作副作用不透明，难以调试
- 没有区分“用户入口”和“系统入口”

## 本章小结

你学会了 App Intents 的最小落地方式，以及它对应用可组合性的意义。

What you learned: you can now expose basic app actions to system automation with App Intents.
