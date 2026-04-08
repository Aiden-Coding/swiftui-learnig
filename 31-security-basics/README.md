# 31. 安全基础：敏感信息与数据保护

## 学习目标

- 理解 SwiftUI 项目里最基本的安全边界
- 学会区分可公开数据与敏感数据
- 建立最小可执行的安全检查习惯

## 中文讲解

移动应用安全并不只是后端的事。客户端同样需要避免泄露敏感信息，例如把密钥硬编码进源码、把令牌明文保存、把调试日志直接输出到生产环境。

入门阶段先把最关键习惯建立起来：密钥不进仓库、敏感数据不用明文存储、网络请求优先 HTTPS、错误提示不暴露内部细节。

安全是持续过程，不是一次性任务。每次新增功能都要顺手做最小安全审视。

## English Notes

App security is not only a backend concern. Client apps must avoid exposing secrets, storing tokens in plain text, or leaking internals through production logs.

Start with practical basics: do not commit secrets, avoid plain-text storage for sensitive data, use HTTPS, and keep user-facing errors generic.

Security is continuous. Every new feature should include a minimum security review.

## 示例代码

```swift
import Foundation

enum AppConfig {
    // Load from secure runtime configuration, not hardcoded literals.
    static var apiBaseURL: URL {
        URL(string: "https://api.example.com")!
    }
}
```

## 常见错误

- 把 API key 或 token 写进源码
- 调试日志里输出用户隐私字段
- 把“功能可用”当成“安全可上线”

## 本章小结

你学会了 SwiftUI 项目最基础的安全意识和落地习惯。

What you learned: you now understand practical baseline security hygiene for app development.
