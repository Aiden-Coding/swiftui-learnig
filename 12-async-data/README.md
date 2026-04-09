# 12. 异步数据加载：加载中、成功、失败

## 学习目标

- 理解为什么异步页面一定要设计状态。
- 学会用 `Task` 和枚举状态表达加载流程。
- 能做出一个基础的异步加载列表页。

## 场景引入

真实项目里的数据往往不是一打开就有，而是需要等待请求、读取缓存或者处理结果。页面最少会遇到三种情况：

- 正在加载
- 加载成功
- 加载失败

如果你不把这三种状态拆清楚，页面就容易空白、卡住，或者失败后没有反馈。

## 本章术语先看懂

- `异步`：结果不会立刻返回，需要等待。
- `Task`：启动一段异步工作的方式。
- `LoadState`：当前页面所处的加载状态。
- `MainActor`：确保与界面相关的更新在主线程执行。

## 一句话理解

异步页面最重要的不是“把请求写出来”，而是先把页面状态组织清楚。

## 完整示例代码

```swift
import SwiftUI

struct AsyncCourseListView: View {
    enum LoadState {
        case idle
        case loading
        case success([String])
        case failure(String)
    }

    @State private var loadState: LoadState = .idle

    var body: some View {
        NavigationStack {
            Group {
                switch loadState {
                case .idle, .loading:
                    ProgressView("正在加载课程...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                case .success(let courses):
                    List(courses, id: \.self) { course in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(course)
                                .font(.headline)
                            Text("适合 SwiftUI 初学者的阶段练习")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }

                case .failure(let message):
                    VStack(spacing: 12) {
                        Image(systemName: "wifi.exclamationmark")
                            .font(.system(size: 36))
                            .foregroundStyle(.orange)

                        Text("加载失败")
                            .font(.title3)
                            .fontWeight(.semibold)

                        Text(message)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.secondary)

                        Button("重新加载") {
                            Task {
                                await loadCourses()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationTitle("课程推荐")
        }
        .task {
            await loadCourses()
        }
    }

    @MainActor
    private func loadCourses() async {
        loadState = .loading

        do {
            try await Task.sleep(for: .seconds(1.5))
            loadState = .success([
                "SwiftUI 基础入门",
                "布局实战训练",
                "状态管理专项练习",
                "导航与表单实战"
            ])
        } catch {
            loadState = .failure("请求过程被中断，请稍后重试。")
        }
    }
}

#Preview {
    AsyncCourseListView()
}
```

## 代码拆解（小白重点）

- `LoadState` 把页面情况明确分成几类，避免多个布尔值互相打架。
- `.task` 让页面显示时自动触发异步加载。
- `switch loadState` 让不同状态显示不同界面。
- 失败时提供“重新加载”按钮，是实际产品里非常常见的体验。

## 新手常见误区

- 只处理成功状态，不处理失败状态。
- 页面已经在加载，却没有任何加载提示。
- 用多个布尔值拼状态，结果同时出现“成功”和“失败”这种矛盾情况。

## 新手排错流程

1. 页面一直转圈时，先检查异步函数有没有真的走到成功或失败分支。
2. 页面空白时，检查 `switch` 是否覆盖了所有状态。
3. 重试按钮没反应时，检查按钮里是否重新启动了 `Task`。

## 章节小测（带答案）

### 题 1

为什么异步页面通常至少要考虑三种状态？

参考答案：因为实际加载过程通常会经历加载中、成功、失败三种情况。

### 题 2

为什么这里用枚举比多个布尔值更清楚？

参考答案：因为枚举能明确表示当前只处于一种状态。

### 题 3

`.task` 适合什么场景？

参考答案：适合视图出现时就自动执行一次异步任务。

## 练习任务

- 基础练习：给成功列表里的每一项加一个“难度”文案。
- 加强练习：让加载结果随机成功或失败。
- 挑战练习：增加下拉刷新或手动刷新按钮。

## 本章小结

学完这章后，你应该已经知道：异步页面的关键不是把网络请求塞进去，而是先让页面状态足够清楚。
