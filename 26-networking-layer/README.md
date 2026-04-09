# 26. 网络层基础：不要把请求代码直接塞进页面

## 学习目标

- 理解为什么网络请求逻辑不适合全写在 SwiftUI 视图里。
- 知道“页面层”和“请求层”为什么要分开。
- 能看懂一个最基础的网络层封装思路。

## 场景引入

当你刚开始做网络请求时，很容易把所有东西都写进页面：

- 组装 URL
- 发请求
- 解析数据
- 处理错误
- 更新 UI

短期看可以跑，长期就会很乱。页面本来应该负责展示，结果却背了太多网络细节。网络层的意义，就是把“怎么请求数据”从页面里拆出去。

## 本章术语先看懂

- `网络层`：专门负责请求和返回数据的一层代码。
- `Service`：封装某类接口访问逻辑的对象。
- `解码`：把接口返回的数据转成 Swift 模型。
- `职责分离`：让页面和请求逻辑各做各的事。

## 一句话理解

页面负责显示数据，网络层负责拿数据，这样代码才不容易乱。

## 示例结构代码

```swift
import Foundation

struct CourseDTO: Decodable, Identifiable {
    let id: Int
    let title: String
}

struct CourseService {
    func fetchCourses() async throws -> [CourseDTO] {
        let url = URL(string: "https://example.com/courses")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([CourseDTO].self, from: data)
    }
}
```

```swift
import SwiftUI

struct CourseNetworkView: View {
    @State private var courses: [CourseDTO] = []
    @State private var isLoading = false

    private let service = CourseService()

    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("正在加载课程...")
                } else {
                    List(courses) { course in
                        Text(course.title)
                    }
                }
            }
            .task {
                await loadCourses()
            }
            .navigationTitle("课程列表")
        }
    }

    @MainActor
    private func loadCourses() async {
        isLoading = true
        defer { isLoading = false }

        do {
            courses = try await service.fetchCourses()
        } catch {
            courses = []
        }
    }
}
```

## 代码拆解（小白重点）

- `CourseService` 负责网络访问，不负责界面。
- SwiftUI 视图只关心三件事：加载、显示、失败处理。
- 这样以后接口变了，你通常先改 `Service`，而不是到处改页面。

## 新手常见误区

- 把 URL、解析、错误处理全写进 `body`。
- 一个页面请求逻辑越来越多，却没有提取。
- 网络失败后完全没有兜底状态。

## 新手排错流程

1. 页面代码越来越乱时，先把请求逻辑提取成 `Service`。
2. 接口返回解析失败时，先看模型字段和返回结构是否一致。
3. 页面没显示数据时，先区分是请求没成功，还是 UI 状态没更新。

## 章节小测（带答案）

### 题 1

为什么不建议把网络请求代码全塞进视图？

参考答案：因为会让页面职责过重，代码难维护。

### 题 2

`Service` 层最核心的职责是什么？

参考答案：封装数据请求和返回解析逻辑。

### 题 3

页面层最应该关注什么？

参考答案：关注加载状态、数据显示和交互反馈。

## 练习任务

- 基础练习：为网络页面增加失败提示文案。
- 加强练习：给 `CourseDTO` 增加一个 `category` 字段并展示出来。
- 挑战练习：把课程请求和讲师请求拆成两个服务对象。

## 本章小结

学完这章后，你应该已经知道：网络层封装不是为了显得复杂，而是为了让页面保持清晰、请求逻辑更容易维护。
