# 26. 网络层入门：请求、解码与分层

## 学习目标

- 理解 SwiftUI 项目中网络层的最小职责
- 学会基础请求与 JSON 解码流程
- 能把网络逻辑从视图中拆分出来

## 中文讲解

网络请求不应该直接塞在 View 里，否则会让界面层难以维护。更好的方式是把请求和解码放到独立服务层，再把结果交给状态层和视图层。

入门时建议先设计最小网络层：一个 API client、一个解码模型、一个调用入口。只要分层清晰，后续扩展分页、重试和鉴权会更容易。

重点是边界清楚，不是代码多。

## English Notes

Networking code should not live directly inside views. A cleaner approach is to move request and decoding logic into a service layer and pass results back to state and UI.

Start with a minimal setup: one API client, one decoding model, and one call path. With clear boundaries, advanced features become easier later.

Clarity matters more than complexity here.

## 示例代码

```swift
import Foundation

struct Post: Decodable, Identifiable {
    let id: Int
    let title: String
}

final class APIClient {
    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Post].self, from: data)
    }
}
```

## 常见错误

- 把请求、解析、展示全写在一个视图里
- 模型字段与 JSON 不匹配却没有及时验证
- 没有为失败状态留出 UI 反馈

## 本章小结

你学会了 SwiftUI 项目里最小可维护的网络层思路。

What you learned: you can now separate request logic from UI with a simple networking layer.
