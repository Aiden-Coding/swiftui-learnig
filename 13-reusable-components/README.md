# 13. 组件复用：把重复界面抽成可复用模块

## 学习目标

- 理解什么时候应该抽组件。
- 学会通过参数让组件显示不同内容。
- 能把一段重复卡片界面拆成独立视图。

## 场景引入

当页面开始变长时，最容易出现的问题就是重复代码越来越多。今天复制一块卡片，明天再复制一块按钮区，很快一个文件就会变得又长又难改。

组件复用的目的，不是为了“显得专业”，而是为了减少重复，让代码更清楚。

## 本章术语先看懂

- `组件`：可独立复用的一块界面。
- `参数化`：通过传入不同数据，让同一个组件显示不同内容。
- `复用`：一份代码多处使用。

## 一句话理解

当同样的界面结构开始重复出现时，就该考虑拆组件了。

## 完整示例代码

```swift
import SwiftUI

struct ReusableCourseListView: View {
    let courses: [CourseSummary] = [
        CourseSummary(title: "SwiftUI 入门", teacher: "林老师", level: "基础"),
        CourseSummary(title: "状态管理实战", teacher: "周老师", level: "进阶"),
        CourseSummary(title: "列表与导航项目训练", teacher: "陈老师", level: "基础")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(courses) { course in
                    CourseCard(course: course)
                }
            }
            .padding()
        }
        .background(Color(.secondarySystemBackground))
    }
}

struct CourseSummary: Identifiable {
    let id = UUID()
    let title: String
    let teacher: String
    let level: String
}

struct CourseCard: View {
    let course: CourseSummary

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(course.title)
                    .font(.headline)

                Spacer()

                Text(course.level)
                    .font(.caption)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(course.level == "基础" ? Color.green.opacity(0.15) : Color.orange.opacity(0.15))
                    .clipShape(Capsule())
            }

            Text("讲师：\(course.teacher)")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Button("开始学习") {
                print("开始学习 \(course.title)")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.06), radius: 8, y: 4)
    }
}

#Preview {
    ReusableCourseListView()
}
```

## 代码拆解（小白重点）

- `ReusableCourseListView` 负责提供一组课程数据。
- `CourseCard` 负责定义“每张卡片怎么长”。
- 以后只要传不同的 `course`，同一个组件就能重复使用。

## 什么时候该抽组件

- 同一段 UI 重复出现。
- 某块界面有明确的独立职责。
- 一个页面太长，阅读压力变大。
- 这块内容未来还可能在别的地方复用。

## 新手常见误区

- 为了抽组件而抽组件，导致代码被拆得太碎。
- 组件参数设计混乱，越传越多。
- 逻辑和展示全写进一个巨型组件里，还是不清楚。

## 新手排错流程

1. 卡片不显示时，先检查 `ForEach` 的数据是否为空。
2. 数据错位时，检查传入的参数是不是当前项。
3. 文件还是很乱时，检查组件职责是否划分清楚。

## 章节小测（带答案）

### 题 1

抽组件最常见的好处是什么？

参考答案：减少重复代码，让界面结构更清楚。

### 题 2

父视图和子组件通常怎么分工？

参考答案：父视图组织数据，子组件负责展示。

### 题 3

什么时候不一定需要抽组件？

参考答案：当界面只出现一次，而且结构非常简单时。

## 练习任务

- 基础练习：给课程卡片增加“学习人数”。
- 加强练习：把讲师信息抽成更小的徽标组件。
- 挑战练习：给 `CourseCard` 增加可配置的按钮文案。

## 本章小结

学完这章后，你应该已经有了一个很重要的习惯：看到重复界面时，会主动考虑如何拆成可复用组件。

## 本章完成标准

学完这一章后，你至少应该能做到：

- 能判断一段 UI 什么时候值得抽组件
- 能让组件通过参数显示不同内容
- 能把页面中重复出现的卡片或区域整理成更清晰的结构

## 学完这一章后马上可以做的练习

找你前面做过的一个页面，把其中重复的内容抽一次：

- 课程卡片
- 设置项行
- 个人资料信息块

只要你真正抽过一次，就会更清楚这一章不是“语法技巧”，而是“结构整理能力”。

## 下一章为什么建议接着学生命周期

当页面结构开始清楚以后，下一步你会很自然地碰到：

- 页面什么时候开始加载
- 页面离开时要不要停止某些动作

所以很适合继续看：

- [14 视图生命周期：页面什么时候出现、什么时候消失](/D:/Documents/GitHub/swiftui-learnig/14-lifecycle/README.md)
