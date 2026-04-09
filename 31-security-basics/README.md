# 31. 安全基础：先避免明显风险，再谈更复杂防护

## 学习目标

- 理解移动应用里最常见的基础安全问题。
- 知道哪些信息不应该直接写死在代码里。
- 建立“最小暴露、最少信任”的基本安全意识。

## 场景引入

很多新手做项目时，会把重点全放在功能能不能跑，却容易忽略一些很基础的安全问题，比如：

- 把密钥直接写在代码里
- 把敏感信息打印到日志里
- 用户输入完全不做校验
- 默认相信本地数据一定可靠

安全这件事不一定非要等项目很大才考虑。很多风险，其实在最开始养成习惯就能避免掉。

## 本章术语先看懂

- `敏感信息`：不适合直接暴露给用户或外部的内容，比如 token、密钥、账号信息。
- `最小暴露`：只暴露必须暴露的信息。
- `输入校验`：在使用用户输入前先检查是否合法。
- `本地存储风险`：保存在设备里的数据也可能被读取或滥用。

## 一句话理解

安全的第一步，不是做复杂加密，而是先别把明显危险的事情做出来。

## 新手最该先记住的几件事

1. 不要把正式环境密钥直接写死在代码里。
2. 不要把密码、token、身份证号这类信息直接打印到日志。
3. 用户输入永远要做基础校验。
4. 不要默认本地数据一定可信。
5. 对“删除、支付、提交”等关键操作，要有明确确认和边界控制。

## 一个简单示例：输入校验和敏感信息意识

```swift
import SwiftUI

struct SecurityBasicsView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var message = ""

    var body: some View {
        VStack(spacing: 12) {
            TextField("邮箱", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)

            SecureField("密码", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("提交") {
                submit()
            }
            .buttonStyle(.borderedProminent)

            if !message.isEmpty {
                Text(message)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }

    private func submit() {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)

        guard trimmedEmail.contains("@") else {
            message = "请输入合法邮箱地址。"
            return
        }

        guard password.count >= 6 else {
            message = "密码长度至少为 6 位。"
            return
        }

        message = "基础校验已通过，可以继续走后续流程。"
    }
}

#Preview {
    SecurityBasicsView()
}
```

## 代码拆解（小白重点）

- `SecureField` 比普通 `TextField` 更适合输入密码，因为不会明文显示。
- 提交前先做基础校验，可以减少无效请求和明显错误。
- 这章的重点不是“做了完整安全方案”，而是建立先校验、少暴露的意识。

## 新手常见误区

- 觉得“只是练习项目”就可以把密钥直接写进去。
- 调试时把所有敏感字段都打印出来。
- 认为前端页面能跑就代表安全没问题。

## 新手排错流程

1. 先盘点项目里有没有明显写死的敏感信息。
2. 检查日志里是否打印了不该出现的字段。
3. 检查关键表单是否做了最基础的输入校验。
4. 先修明显风险，再考虑更复杂的安全增强。

## 章节小测（带答案）

### 题 1

为什么不应该把正式密钥直接写在代码里？

参考答案：因为代码可能被反编译、泄露或被他人看到，直接暴露敏感信息。

### 题 2

为什么用户输入要做校验？

参考答案：因为输入可能不合法、不完整，直接使用会带来错误甚至风险。

### 题 3

安全第一步最重要的事情是什么？

参考答案：先避免明显风险，比如少暴露敏感信息、做基础校验、不要盲目信任输入。

## 练习任务

- 基础练习：给密码增加“必须包含数字”的校验提示。
- 加强练习：检查你自己的项目里有没有不该打印的敏感信息。
- 挑战练习：整理一份“移动端基础安全自查清单”。

## 本章小结

学完这章后，你应该已经建立一个很重要的观念：安全不是后补的大工程，而是从一开始就少犯明显错误。
