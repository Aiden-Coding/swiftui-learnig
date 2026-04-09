# 20. 架构基础：分层不是为了高级，而是为了不乱

## 学习目标

- 理解为什么项目一变大就需要分层。
- 知道“视图层、数据层、业务层”最基础的职责区别。
- 能看懂一个简单的分层写法，而不是把所有东西都塞进 `View`。
- 建立一个很关键的判断：什么时候是“先别急着重构”，什么时候是“已经不得不拆”。

## 场景引入

小 Demo 的时候，把所有代码都写进一个 SwiftUI 视图里，通常还能忍。但当你开始做真实页面时，很快会出现这些问题：

- `body` 里既有界面，又有数据转换，又有请求逻辑
- 一个文件几百行，改一点就怕牵一发而动全身
- 同样的业务规则在多个页面里重复出现

这时候“架构”就不是空话了。它最核心的作用只有一个：让代码别乱。

## 本章术语先看懂

- `视图层`：负责展示界面、响应用户交互。
- `业务层`：负责组织规则，比如筛选、计算、校验。
- `数据层`：负责拿数据、保存数据。
- `分层`：把不同职责的代码放到不同位置。
- `职责边界`：这一层该做什么、不该做什么。

## 一句话理解

界面负责显示，规则负责判断，数据负责来源，这三件事最好别全挤在一个地方。

## 为什么新手也要尽早接触“架构”

不是因为你现在就一定要上复杂模式，而是因为：

- 你越早知道职责分开这件事
- 后面代码量上来时就越不容易乱

很多人一听到“架构”就觉得很高级，其实本章最核心只是一个朴素原则：

- 页面别负责太多事

## 我们这一章要做什么

做一个“课程搜索页”的简化分层示例：

- 视图层：展示搜索框和列表
- 业务层：负责根据关键词筛选课程
- 数据层：提供课程原始数据

## 完整示例代码

```swift
import SwiftUI

struct CourseItem: Identifiable {
    let id = UUID()
    let title: String
    let category: String
}

struct CourseRepository {
    func fetchCourses() -> [CourseItem] {
        [
            CourseItem(title: "SwiftUI 入门", category: "基础"),
            CourseItem(title: "Swift 并发基础", category: "进阶"),
            CourseItem(title: "表单与输入实战", category: "基础"),
            CourseItem(title: "动画与交互优化", category: "进阶")
        ]
    }
}

struct CourseSearchService {
    func filterCourses(keyword: String, in courses: [CourseItem]) -> [CourseItem] {
        guard !keyword.isEmpty else { return courses }

        return courses.filter {
            $0.title.localizedCaseInsensitiveContains(keyword) ||
            $0.category.localizedCaseInsensitiveContains(keyword)
        }
    }
}

struct ArchitectureCourseSearchView: View {
    @State private var keyword = ""

    private let repository = CourseRepository()
    private let service = CourseSearchService()

    var filteredCourses: [CourseItem] {
        let allCourses = repository.fetchCourses()
        return service.filterCourses(keyword: keyword, in: allCourses)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                TextField("输入课程关键词", text: $keyword)
                    .textFieldStyle(.roundedBorder)

                List(filteredCourses) { course in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(course.title)
                            .font(.headline)

                        Text(course.category)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(.plain)
            }
            .padding()
            .navigationTitle("课程搜索")
        }
    }
}

#Preview {
    ArchitectureCourseSearchView()
}
```

## 代码拆解（小白重点）

### 数据层：`CourseRepository`

它负责“数据从哪里来”。这一章里我们先用本地假数据模拟，后面你也可以把它换成网络请求或本地数据库。

### 业务层：`CourseSearchService`

它不负责界面，只负责规则：

- 关键词为空，返回全部
- 关键词不为空，做筛选

把这段逻辑单独抽出来以后，你会得到三个好处：

- 更容易测试
- 更容易复用
- 视图层更干净

### 视图层：`ArchitectureCourseSearchView`

视图层只做三件事：

1. 收集输入
2. 调用已有规则
3. 展示结果

这就叫“界面负责显示，规则交给业务层”。

## 到底什么时候该开始分层

这是新手最常问的问题之一。你可以用下面几个信号判断：

### 信号 1：`body` 越来越长

如果你的页面开始出现很多：

- 筛选逻辑
- 排序逻辑
- 数据转换逻辑
- 请求逻辑

那通常已经到了该拆的时候。

### 信号 2：同样的规则在多个页面复制

比如两个页面都在写一模一样的筛选逻辑，这通常说明业务规则应该被提取出来。

### 信号 3：改一行就不放心

这往往说明代码已经耦合得比较紧，结构不够清楚。

## 新手常见误区

### 误区 1：一听到架构就想到特别复杂的模式

其实分层最基础的目标只是“别乱”。不需要一开始就背很多名词。

### 误区 2：为了分层而分层

如果一个页面非常简单，也没必要硬拆出五六层。重点是让职责清楚，而不是层数越多越高级。

### 误区 3：把业务逻辑继续塞回 `body`

如果你的 `body` 里开始出现大量筛选、排序、计算代码，就说明该拆了。

## 新手排错流程

1. 页面逻辑越来越难看懂时，先把“数据来源”和“业务规则”分开。
2. 改一个筛选条件影响多个页面时，检查是否有重复逻辑没有提取。
3. 测试困难时，看看是不是所有规则都绑死在 SwiftUI 视图里了。
4. 文件过长时，先从最明显的职责边界开始拆。
5. 如果你拆完以后反而更乱，说明拆分边界还不清楚，不是“架构没用”，而是“职责还没想清”。

## 章节小测（带答案）

### 题 1

分层最核心的目的是什么？

参考答案：让代码职责清晰，不容易混乱。

### 题 2

课程筛选规则更适合放在哪一层？

参考答案：更适合放在业务层。

### 题 3

视图层最主要的职责是什么？

参考答案：负责展示界面、接收交互、组织展示结果。

## 练习任务

- 基础练习：给搜索结果增加一个“按分类筛选”的规则。
- 加强练习：把 `CourseRepository` 改成返回不同分类的模拟数据。
- 挑战练习：把筛选逻辑单独写测试，验证不同关键词时的结果是否正确。

## 下一步推荐怎么接着学

这一章和第 29 章组件库、第 44 章模块化是连着的。它们共同解决的，其实都是一个问题：项目变大以后，结构怎么不乱。

## 本章完成标准

学完这章后，你不一定要马上会复杂架构，但至少应该做到：

- 能说清楚视图层、业务层、数据层分别负责什么
- 能判断一个页面是不是已经开始“职责太多”
- 能把一小段业务规则从 `body` 或页面里提出来
- 能理解“分层不是为了高级，而是为了减少混乱”

## 什么时候该回来看这一章

如果你在做项目时开始出现这些感觉，就很适合回来看这一章：

- 页面越来越长，不敢改
- 逻辑全堆在一个文件里
- 同样规则在多个页面复制
- 小项目一扩功能就开始乱

这时候说明你不是“不会写页面”，而是已经开始遇到真正的结构问题了。

## 配合哪几章一起看效果最好

这章很适合和下面几章连起来理解：

- [13 组件复用](/D:/Documents/GitHub/swiftui-learnig/13-reusable-components/README.md)
- [17 测试基础](/D:/Documents/GitHub/swiftui-learnig/17-testing-basics/README.md)
- [44 模块化基础](/D:/Documents/GitHub/swiftui-learnig/44-module-basics/README.md)

## 本章小结

学完这一章后，你应该已经建立一个很重要的意识：架构不是为了显得专业，而是为了在项目变大以后，你的代码还能保持清楚、稳定、可维护。
