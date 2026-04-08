# 18. 小项目实战：习惯追踪器

## 学习目标

- 把前面知识点组合成一个可运行的小应用
- 练习列表、表单、状态、导航、持久化的协同
- 建立从“知识点”到“产品功能”的连接

## 中文讲解

到了这一步，我们把分散的知识点串成一个小项目。习惯追踪器是很适合新手的题材，因为它同时包含列表展示、添加表单、状态更新、简单持久化和页面跳转。

建议你先做最小版本：查看习惯列表、添加新习惯、标记今日完成。跑通后再逐步加功能，比如统计连续天数、筛选、排序和提醒。

实战阶段最重要的是“先让流程完整”，而不是一次做完所有细节。只要核心闭环可用，你的学习效率会明显提升。

## English Notes

This chapter connects previous topics into one practical app. A habit tracker is beginner-friendly because it combines lists, forms, state, navigation, and simple persistence.

Start with a minimum version: view habits, add a habit, and mark today as completed. Then iterate with streak, filters, sorting, and reminders.

In project mode, prioritize a complete working flow before polishing every detail.

## 示例代码

```swift
import SwiftUI

struct Habit: Identifiable {
    let id = UUID()
    var name: String
    var doneToday: Bool
}

struct HabitListView: View {
    @State private var habits: [Habit] = [
        Habit(name: "Read 20 minutes", doneToday: false),
        Habit(name: "Walk 5,000 steps", doneToday: true)
    ]

    var body: some View {
        List($habits) { $habit in
            Toggle(habit.name, isOn: $habit.doneToday)
        }
        .navigationTitle("Habits")
    }
}
```

这个示例是小项目的最小核心：可展示、可切换、可继续扩展。

This example is the minimum project core: visible list, editable state, and room to grow.

## 常见错误

- 一开始就追求完整产品，结果迟迟无法收敛
- 功能堆很多，但没有稳定的数据结构
- 跳过重构步骤，导致迭代越来越慢

## 本章小结

你学会了如何把 SwiftUI 基础知识整合成一个小型可运行项目，并为后续真实项目打基础。

What you learned: you can now assemble core SwiftUI concepts into a small working app.
