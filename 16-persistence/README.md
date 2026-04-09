# 16. 本地持久化：让数据在下次打开时还在

## 学习目标

- 理解“持久化”到底是什么意思。
- 学会用 `UserDefaults` 保存简单设置。
- 知道哪些数据适合简单持久化，哪些不适合。

## 场景引入

你做了一个设置页，用户把“深色模式开关”打开了，结果下一次打开 App 又恢复默认值了。这种体验会非常差。

因为前面的 `@State` 只在当前运行期间有效，一旦 App 关闭，数据就没了。想让数据“下次打开还在”，就需要做持久化。

## 本章术语先看懂

- `持久化`：把数据保存到本地，让它在程序关闭后依然存在。
- `UserDefaults`：适合保存简单配置的小型本地存储。
- `键值对`：通过一个 key 存值，再通过同一个 key 取值。
- `@AppStorage`：SwiftUI 对 `UserDefaults` 的友好封装。

## 一句话理解

临时状态只活在当前页面，持久化数据会活到下一次打开 App。

## 完整示例代码

```swift
import SwiftUI

struct PersistenceSettingsView: View {
    @AppStorage("nickname") private var nickname = ""
    @AppStorage("dailyReminderEnabled") private var dailyReminderEnabled = true
    @AppStorage("autoPlayVideo") private var autoPlayVideo = false

    var body: some View {
        NavigationStack {
            Form {
                Section("个人信息") {
                    TextField("输入你的昵称", text: $nickname)
                }

                Section("学习偏好") {
                    Toggle("开启每日提醒", isOn: $dailyReminderEnabled)
                    Toggle("自动播放课程视频", isOn: $autoPlayVideo)
                }

                Section("当前结果") {
                    Text("昵称：\(nickname.isEmpty ? "未设置" : nickname)")
                    Text("每日提醒：\(dailyReminderEnabled ? "已开启" : "已关闭")")
                    Text("自动播放：\(autoPlayVideo ? "已开启" : "已关闭")")
                }
            }
            .navigationTitle("学习设置")
        }
    }
}

#Preview {
    PersistenceSettingsView()
}
```

## 代码拆解（小白重点）

- `@AppStorage` 用起来像普通状态，但底层会自动存到本地。
- 用户修改昵称和开关后，下次打开 App 还能读到上次保存的值。
- 这种方式特别适合“设置项”“偏好项”“默认选项”这类轻量数据。

## 什么适合用 `@AppStorage`

- 用户昵称
- 开关状态
- 默认排序方式
- 主题偏好

## 什么不适合只用 `@AppStorage`

- 很长的课程列表
- 复杂笔记内容
- 需要排序筛选的大量记录

这些内容更适合后面学数据库或 `SwiftData` 时处理。

## 新手常见误区

- 以为 `@State` 会自动记住上次值。
- 什么数据都往 `UserDefaults` 里放。
- key 名随便写，后面自己都对不上。

## 新手排错流程

1. 重启 App 后数据丢失时，先检查是不是还在用 `@State`。
2. 取不到值时，检查 key 是否前后一致。
3. 布尔值结果不对时，检查默认值是不是写反了。

## 章节小测（带答案）

### 题 1

为什么设置类数据适合用 `@AppStorage`？

参考答案：因为它轻量、简单，而且能自动和界面联动。

### 题 2

`@State` 和 `@AppStorage` 的最大区别是什么？

参考答案：`@State` 只在当前运行期有效，`@AppStorage` 会持久保存到本地。

### 题 3

课程大列表适合直接存进 `UserDefaults` 吗？

参考答案：通常不适合，因为它更适合保存简单、小量的配置数据。

## 练习任务

- 基础练习：增加一个“默认字体大小”选项。
- 加强练习：增加“是否显示学习进度百分比”开关。
- 挑战练习：把 key 名整理成统一常量。

## 本章小结

学完这章后，你应该已经知道：如果想让用户设置在下次打开时还在，就不能只靠页面状态，而要把数据保存到本地。
