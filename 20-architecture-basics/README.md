# 20. 架构基础：分层不是为了高级，而是为了不乱

## 学习目标

- 理解为什么项目一变大就需要分层。
- 知道“视图层、数据层、业务层”最基础的职责区别。
- 能看懂一个简单的分层写法，而不是把所有东西都塞进 `View`。

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

## 一句话理解

界面负责显示，规则负责判断，数据负责来源，这三件事最好别全挤在一个地方。

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

- `CourseRepository` 负责“数据从哪里来”。
- `CourseSearchService` 负责“怎么筛选这些数据”。
- `ArchitectureCourseSearchView` 负责收集输入和展示结果。

## 为什么新手也要早点理解分层

不是因为你现在就一定要上复杂架构，而是因为如果你从一开始就养成“职责分开”的习惯，后面代码量上来时会轻松很多。

## 新手常见误区

- 一听到架构就想到特别复杂的模式。
- 为了分层而分层，反而把简单页面弄复杂。
- 把业务逻辑继续塞回 `body`。

## 新手排错流程

1. 页面越来越难懂时，先把“数据来源”和“业务规则”分开。
2. 改一个筛选条件影响多个页面时，检查是否有重复逻辑没有提取。
3. 测试困难时，看看是不是所有规则都绑死在 SwiftUI 视图里了。

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
- 挑战练习：把筛选逻辑单独写测试。

## 本章小结

学完这章后，你应该已经建立一个很重要的意识：架构不是为了显得专业，而是为了在项目变大以后，代码还能保持清楚、稳定、可维护。
