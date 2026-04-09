# 07. 导航：NavigationStack 与页面跳转

## 学习目标

- 理解 SwiftUI 多页面结构是怎么搭起来的。
- 学会使用 `NavigationStack` 和 `NavigationLink`。
- 能做出“列表页 -> 详情页”的基础跳转。

## 场景引入

如果一个 App 只有一个页面，那几乎没法完成真实业务。你一定会遇到点课程进入详情页、点设置项进入子设置页这类场景，所以导航是基础能力。

## 本章术语先看懂

- `NavigationStack`：导航容器，管理页面层级
- `NavigationLink`：点击后进入目标页面
- `navigationTitle`：设置页面标题

## 一句话理解

`NavigationStack` 负责整个导航环境，`NavigationLink` 负责单次跳转动作。

## 手把手操作步骤

1. 创建 `TopicNavigationView`。
2. 粘贴代码并运行。
3. 点击任意一行，观察是否进入新页面。
4. 再把主题数量增加到 5 个。

## 完整示例代码

```swift
import SwiftUI

struct TopicNavigationView: View {
    let topics = ["Layout", "State", "Forms"]

    var body: some View {
        NavigationStack {
            List(topics, id: \.self) { topic in
                NavigationLink(topic) {
                    Text("You selected \(topic)")
                        .navigationTitle(topic)
                }
            }
            .navigationTitle("Topics")
        }
    }
}

#Preview {
    TopicNavigationView()
}
```

## 代码拆解（小白重点）

- `NavigationStack` 是导航的根容器。
- `List(topics, id: \.self)` 显示主题列表。
- `NavigationLink` 定义点击后的目标页面。
- `navigationTitle` 用于明确当前层级标题。

## 新手排错流程

1. 点击没跳转时，先检查有没有包在 `NavigationStack` 里。
2. 标题不对时，检查详情页里有没有设置 `navigationTitle`。
3. 层级混乱时，检查是不是嵌套了过多导航容器。

## 章节小测（带答案）

### 题 1

`NavigationStack` 是干什么的？

参考答案：提供导航层级环境。

### 题 2

`NavigationLink` 的作用是什么？

参考答案：点击后进入目标页面。

### 题 3

为什么详情页里经常设置 `navigationTitle`？

参考答案：让用户清楚自己当前所在的页面层级。

## 练习任务

- 基础练习：把主题从 3 个增加到 5 个。
- 加强练习：在详情页里加上图标和说明文字。
- 挑战练习：把详情页抽成独立的 `TopicDetailView`。

## 本章学习提示

一开始先掌握最基础的“点进去、能回来”。复杂导航以后再学，不要一上来就把自己绕晕。

## 本章小结

这一章之后，你已经具备搭建多页面基础流程的能力了。对 App 来说，这一步非常关键。
