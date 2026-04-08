# 37. Deep Link 基础

## 学习目标

- 理解 Deep Link 的使用场景
- 学会处理基础 URL 跳转
- 能把外部入口映射到 App 页面

## 中文讲解

Deep Link 允许用户通过链接直接打开应用中的某个页面，比如活动页或详情页。它是连接 App 内外流量的重要入口。

入门阶段先做最小闭环：识别 URL、解析路径、跳转目标页面。只要路径规则清晰，后续扩展就会很稳。

## English Notes

Deep links let users open a specific app screen directly from a URL. They are important for campaigns and cross-platform flows.

Start with a minimal loop: detect URL, parse route, and navigate to target screen.

## 示例代码

```swift
import SwiftUI

struct RootView: View {
    @State private var route = "home"

    var body: some View {
        Text("Current route: \(route)")
            .onOpenURL { url in
                route = url.host() ?? "home"
            }
    }
}
```

## 常见错误

- 链接规则没有文档化
- 页面不存在时没有兜底
- 只测成功路径，不测异常参数

## 本章小结

你学会了 SwiftUI 中 Deep Link 的最小实现路径。

What you learned: you can now map incoming URLs to app routes in SwiftUI.
