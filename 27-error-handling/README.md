# 27. 错误处理基础：不要只处理成功结果

## 学习目标

- 理解为什么错误处理是正常流程的一部分。
- 学会在页面中表达失败状态和提示信息。
- 知道 `do-catch` 在异步和请求场景中的基本作用。

## 场景引入

很多新手写功能时只盯着“成功路径”，比如请求成功、保存成功、提交成功。但真实项目里失败是一定会发生的：

- 网络断开
- 解析失败
- 输入不合法
- 权限不足

如果你不提前设计错误处理，用户只会看到页面空白、按钮没反应，或者完全不知道刚才发生了什么。

## 本章术语先看懂

- `错误处理`：在失败发生时给出清晰反馈和处理方式。
- `do-catch`：捕获可能抛出错误的代码。
- `throw`：主动抛出一个错误。
- `用户反馈`：失败时给用户看的提示内容。

## 一句话理解

好页面不是“永远成功”，而是“失败时也让用户知道接下来怎么办”。

## 完整示例代码

```swift
import SwiftUI

enum LoginError: Error {
    case emptyInput
    case invalidPassword
}

struct ErrorHandlingDemoView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var showError = false

    var body: some View {
        VStack(spacing: 12) {
            TextField("用户名", text: $username)
                .textFieldStyle(.roundedBorder)

            SecureField("密码", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("登录") {
                do {
                    try validateLogin()
                    errorMessage = ""
                    showError = false
                } catch {
                    errorMessage = error.localizedDescription
                    showError = true
                }
            }
            .buttonStyle(.borderedProminent)

            if showError {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
    }

    private func validateLogin() throws {
        if username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw LoginError.emptyInput
        }

        if password.count < 6 {
            throw LoginError.invalidPassword
        }
    }
}

extension LoginError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emptyInput:
            return "用户名和密码都不能为空。"
        case .invalidPassword:
            return "密码长度至少需要 6 位。"
        }
    }
}

#Preview {
    ErrorHandlingDemoView()
}
```

## 代码拆解（小白重点）

- `throw` 用来主动抛出一个错误情况。
- `do-catch` 负责捕获错误并决定怎么反馈给用户。
- 失败提示不是给开发者看的报错，而是给用户看的可理解信息。

## 新手常见误区

- 只处理成功路径，不处理失败路径。
- 出错后什么都不提示，用户完全不知道发生了什么。
- 直接把技术报错原样暴露给用户，体验很差。

## 新手排错流程

1. 页面没反应时，先确认错误有没有被捕获。
2. 错误提示不友好时，检查是否需要做更面向用户的文案转换。
3. 某些失败情况总漏掉时，先列出所有可能分支再补处理。

## 章节小测（带答案）

### 题 1

为什么错误处理不能后补再说？

参考答案：因为失败本来就是正常流程的一部分，不提前设计会让体验非常差。

### 题 2

`do-catch` 最核心的用途是什么？

参考答案：捕获可能抛出的错误并进行处理。

### 题 3

为什么用户提示不能直接照搬底层报错？

参考答案：因为底层报错通常太技术化，不适合直接给用户看。

## 练习任务

- 基础练习：给用户名也增加长度校验。
- 加强练习：把错误提示改成 `alert` 形式。
- 挑战练习：模拟一个网络请求失败页面并提供重试。

## 本章小结

学完这章后，你应该已经知道：错误处理不是额外工作，而是让页面真正可用的一部分。
