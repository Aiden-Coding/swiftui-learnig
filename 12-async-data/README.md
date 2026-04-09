# 12. 异步数据加载：加载中、成功、失败

## 学习目标

- 理解为什么异步页面一定要设计状态。
- 学会用 `Task` 和枚举状态表达加载流程。
- 能做出一个基础的异步加载列表页。
- 建立一个真实项目里非常重要的意识：失败不是例外，而是正常情况的一部分。

## 场景引入

真实项目里的数据往往不是一打开就有，而是需要等待请求、读取缓存或者处理结果。页面最少会遇到三种情况：

- 正在加载
- 加载成功
- 加载失败

如果你不把这三种状态拆清楚，页面就容易出现下面这些问题：

- 一直空白，不知道是不是卡住了
- 失败后没有任何反馈
- 数据有时显示，有时不显示，你自己也不知道为什么

所以这一章最重要的不是“把请求写出来”，而是先建立一个更稳定的页面思维。

## 本章术语先看懂

- `异步`：结果不会立刻返回，需要等待。
- `Task`：启动一段异步工作的方式。
- `LoadState`：当前页面所处的加载状态。
- `MainActor`：确保与界面相关的更新在主线程执行。
- `重试`：失败后允许用户再次发起请求的交互。

## 一句话理解

异步页面最重要的不是“把请求写出来”，而是先把页面状态组织清楚。

## 先建立一个小白最常缺的思路

很多新手第一次写异步页面时，会自然地只想着：

- 我怎么把数据拿回来

但真实页面其实更应该先问：

- 数据没回来之前显示什么？
- 成功之后显示什么？
- 失败之后显示什么？
- 用户还能不能重试？

如果你先把这几个问题想清楚，异步页面就会稳很多。

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

### 为什么这里不用多个布尔值

你当然可以写成：

- `isLoading`
- `hasError`
- `hasData`

但这样很容易出现互相打架的情况。比如：

- `isLoading == true`
- `hasError == true`

这时候页面到底该显示什么？

所以这里用枚举 `LoadState` 会更清楚，因为它明确表示：

- 当前只能处于一种状态

### `switch loadState`

这段是整章最关键的代码之一。

它的意义不是“语法花哨”，而是：

- 不同状态，显示不同页面
- 页面结构是围绕状态组织的
- 不是把所有控件都堆出来，再东一个 `if` 西一个 `if`

### `.task`

`.task` 很适合做“页面一出现就执行一次的异步工作”。

这里它的作用就是：

- 页面出来时自动加载课程
- 不需要用户先点一个按钮再加载

### 为什么失败状态也要做得像正式页面

很多新手会把失败状态写得很随便，甚至只打一行字。但真实产品里，失败状态通常至少要告诉用户三件事：

1. 发生了什么
2. 现在页面为什么没内容
3. 还能不能继续操作，比如重试

## 一个很重要的设计习惯

以后只要你写异步页面，都建议先把下面这张小脑图在脑子里过一遍：

- 初始状态
- 加载中状态
- 成功状态
- 失败状态
- 是否支持重试

哪怕你现在还是写本地假数据，也建议这么训练。因为真正上线项目时，这个思路会很值钱。

## 新手常见误区

### 误区 1：只处理成功状态，不处理失败状态

这会导致页面一旦失败，看起来像“什么都没有发生”。

### 误区 2：页面已经在加载，却没有任何提示

这会让用户怀疑页面是不是卡住了。

### 误区 3：用多个布尔值拼状态，结果同时出现“成功”和“失败”

这类问题非常常见，也是初学者最容易写乱的地方之一。

### 误区 4：加载失败后不给重试入口

有些页面当然可以不重试，但对大部分内容页来说，给用户一个重新加载的机会通常更友好。

## 新手排错流程

1. 页面一直转圈时，先检查异步函数有没有真的走到成功或失败分支。
2. 页面空白时，检查 `switch` 是否覆盖了所有状态。
3. 重试按钮没反应时，检查按钮里是否重新启动了 `Task`。
4. 状态切换乱掉时，检查是不是同时维护了太多互相冲突的标记变量。
5. 如果你自己都说不清当前页面到底处于什么状态，说明结构还不够清楚。

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
- 挑战练习：增加一个手动刷新按钮，并在失败后保留上次成功数据的思路说明。

## 学习顺序建议

这一章学完后，你会对后面的并发、网络层、错误处理更有感觉。因为这些主题本质上都和“异步状态怎么组织”密切相关。

## 本章小结

学完这一章后，你应该已经知道：异步页面的关键不是把网络请求塞进去，而是先让页面状态足够清楚，让用户在加载中、成功、失败时都知道自己看到了什么、接下来可以做什么。

## 本章完成标准

学完这一章后，你至少应该能做到：

- 知道异步页面至少要考虑加载中、成功、失败三种状态
- 能用枚举或清晰状态组织页面显示逻辑
- 能写出一个带重试按钮的最小异步页面

## 学完这一章后马上可以做的练习

建议你做一个“课程推荐页”或“资讯列表页”：

- 初始显示加载中
- 成功后显示列表
- 失败后显示提示和重试按钮

这类页面是后面很多真实项目的基础模板。

## 下一章为什么适合开始学组件复用

当你已经开始做异步页面以后，很容易发现：

- 某些卡片、按钮、提示区在不同页面会重复出现

这时候组件复用就会自然出现，所以建议接着看：

- [13 组件复用：把重复界面抽成可复用模块](/D:/Documents/GitHub/swiftui-learnig/13-reusable-components/README.md)
