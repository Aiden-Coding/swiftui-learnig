# 08. 表单与输入：TextField、Toggle、Picker

## 学习目标

- 学会处理用户输入。
- 理解表单控件为什么几乎都离不开状态绑定。
- 能做一个基础设置页面。

## 场景引入

很多真实界面都不是“只看不动”的，它们需要用户输入内容，比如修改昵称、开关提醒、选择等级。所以表单这一章，是把“状态”和“界面交互”真正连接起来的一章。

## 本章术语先看懂

- `TextField`：文本输入框
- `Toggle`：开关控件
- `Picker`：选项选择器
- `Form`：表单容器

## 一句话理解

表单控件本质上就是：用户改状态，界面读状态。

## 手把手操作步骤

1. 创建 `SettingsFormView`。
2. 粘贴代码并运行。
3. 输入昵称、切换开关、选择等级。
4. 观察预览区是否同步变化。

## 完整示例代码

```swift
import SwiftUI

struct SettingsFormView: View {
    @State private var name = ""
    @State private var notificationsOn = true
    @State private var level = "Beginner"

    let levels = ["Beginner", "Intermediate", "Advanced"]

    var body: some View {
        Form {
            TextField("Nickname", text: $name)

            Toggle("Notifications", isOn: $notificationsOn)

            Picker("Level", selection: $level) {
                ForEach(levels, id: \.self) { level in
                    Text(level)
                }
            }

            Section("Preview") {
                Text("Name: \(name.isEmpty ? "未填写" : name)")
                Text("Notifications: \(notificationsOn ? "开启" : "关闭")")
                Text("Level: \(level)")
            }
        }
    }
}

#Preview {
    SettingsFormView()
}
```

## 代码拆解（小白重点）

- `TextField` 绑定文本状态。
- `Toggle` 绑定布尔状态。
- `Picker` 绑定当前选中值。
- 预览区直接读取这些状态，帮助你看到结果。

## 新手排错流程

1. 输入框能输入但预览不变时，检查是不是用的同一个状态变量。
2. 开关点了没变化时，检查绑定是不是写成了普通值。
3. Picker 不正常时，检查 `selection` 类型是否匹配。

## 章节小测（带答案）

### 题 1

为什么表单控件几乎都要绑定状态？

参考答案：因为用户输入后要写回数据，界面再根据数据刷新。

### 题 2

`TextField` 后面为什么写 `$name`？

参考答案：因为它需要的是绑定，而不是单纯的值。

### 题 3

`Toggle` 最适合绑定什么类型？

参考答案：`Bool`。

## 练习任务

- 基础练习：增加一个“是否公开资料”的开关。
- 加强练习：把当前设置汇总成一段摘要。
- 挑战练习：增加一个“重置表单”按钮。

## 本章完成标准

学完这一章后，你至少应该能做到：

- 能把 `TextField`、`Toggle`、`Picker` 绑定到正确状态
- 能做一个基础设置页或资料页
- 能理解表单的重点不在控件本身，而在“控件和状态的连接”

## 学完这一章后马上可以做的练习

最推荐你做一个“个人资料设置页”：

- 一个昵称输入框
- 一个开关
- 一个主题选择器
- 一段实时预览文字

这个页面很小，但已经能很好地练到表单思维。

## 下一章为什么适合开始学样式组织

当前你已经会：

- 搭基础页面
- 做导航
- 做表单

这时候非常容易开始遇到一个问题：

- 样式越写越重复

所以接着学样式组织会非常自然：

- [09 样式与常用修饰符组织](/D:/Documents/GitHub/swiftui-learnig/09-styling/README.md)

## 本章学习提示

表单最核心的不是控件本身，而是“控件和状态的绑定关系”。

## 本章小结

这一章结束后，你已经可以做最基础的设置页、资料页、偏好页了。这是从静态界面走向可交互页面的重要一步。
