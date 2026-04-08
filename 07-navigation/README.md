# 07. 导航：NavigationStack、页面跳转

## 学习目标

- 理解 SwiftUI 中导航容器的作用
- 学会使用 `NavigationStack` 和 `NavigationLink`
- 能构建一个简单的列表到详情页跳转

## 中文讲解

多数应用都不是单页面结构，因此导航是 SwiftUI 基础里非常重要的一部分。现代 SwiftUI 中，最推荐的新手使用 `NavigationStack` 来承载页面层级。

你可以把 `NavigationStack` 理解为一个页面栈。进入新页面时，系统把它压入栈中；返回时，再把它弹出。`NavigationLink` 则是最常见的跳转方式。

在基础阶段，你先学会“从一个页面进入另一个页面”就够了。等熟悉以后，再继续学习更复杂的路径状态和深层导航控制。

## English Notes

Most apps are not single-screen apps, so navigation is an important SwiftUI fundamental. In modern SwiftUI, beginners should prefer `NavigationStack` for page hierarchy.

You can think of a navigation stack as a stack of screens. A new screen is pushed when you move forward, and popped when you go back. `NavigationLink` is the standard way to trigger that transition.

At this level, learning how to move from one screen to another is enough. More advanced path-based navigation can come later.

## 示例代码

```swift
import SwiftUI

struct NavigationExampleView: View {
    let topics = ["Text", "Layout", "State"]

    var body: some View {
        NavigationStack {
            List(topics, id: \.self) { topic in
                NavigationLink(topic) {
                    TopicDetailView(topic: topic)
                }
            }
            .navigationTitle("SwiftUI Topics")
        }
    }
}

struct TopicDetailView: View {
    let topic: String

    var body: some View {
        Text("You selected \(topic)")
            .font(.title2)
            .navigationTitle(topic)
    }
}
```

这个例子演示了一个列表页和详情页之间最典型的导航关系。

This example demonstrates the most common beginner navigation pattern: a list screen that pushes to a detail screen.

## 常见错误

- 还在查旧资料时误用了过时导航 API
- 只看跳转是否成功，没有设置标题导致层级不清晰
- 把导航和模态展示混为一谈

## 本章小结

你学会了用 `NavigationStack` 和 `NavigationLink` 构建最基础的页面跳转结构。

What you learned: you can now build a basic multi-screen flow using `NavigationStack` and `NavigationLink`.
