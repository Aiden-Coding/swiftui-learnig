# 12. 异步任务、加载状态与远程图片

## 学习目标

- 理解 SwiftUI 中异步任务的基本使用场景
- 学会用 `task` 处理简单加载逻辑
- 认识 `AsyncImage` 和常见加载状态

## 中文讲解

真实应用往往不只是展示本地静态内容，还需要加载网络数据、拉取图片或等待异步结果。SwiftUI 为这类场景提供了比早期框架更自然的写法，例如 `.task` 和 `AsyncImage`。

对于入门者来说，重点不是立刻掌握完整网络层，而是先学会三个概念：什么时候开始加载、加载中显示什么、加载失败时怎么办。只要这三个问题想清楚，异步界面就不会显得混乱。

`AsyncImage` 是一个很好理解的起点，因为它直接展示了异步内容的三个阶段：加载中、成功、失败。它能帮助你建立“状态驱动异步 UI”的思维方式。

## English Notes

Real apps do more than show local static content. They often load remote data, fetch images, or wait for asynchronous results. SwiftUI offers a more natural way to handle this with tools like `.task` and `AsyncImage`.

For beginners, the goal is not to master a full networking layer yet. Instead, focus on three ideas: when loading starts, what the UI shows while waiting, and what happens if loading fails.

`AsyncImage` is a great entry point because it clearly shows the three common async states: loading, success, and failure.

## 示例代码

```swift
import SwiftUI

struct AsyncExampleView: View {
    @State private var status = "Loading..."

    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: "https://picsum.photos/200")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 160, height: 160)
            .clipShape(RoundedRectangle(cornerRadius: 20))

            Text(status)
        }
        .task {
            try? await Task.sleep(for: .seconds(1))
            status = "Finished loading basic content."
        }
        .padding()
    }
}
```

这个例子同时展示了远程图片的异步展示，以及任务完成后如何更新界面状态。

This example combines remote image loading with a simple async task that updates the UI when finished.

## 常见错误

- 一开始就把异步逻辑写得太复杂
- 只处理成功状态，没有考虑加载中和失败状态
- 网络内容加载慢时，没有给用户任何反馈

## 本章小结

你学会了 SwiftUI 异步界面的基本思路，也知道了如何处理加载中、成功和失败这三类常见状态。

What you learned: you now understand the basics of async UI in SwiftUI, including loading, success, and failure states.
