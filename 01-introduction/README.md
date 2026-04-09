# 01. SwiftUI 是什么与开发环境准备

## 学习目标

- 知道 SwiftUI 是用来做什么的。
- 理解“声明式界面”这个词到底是什么意思。
- 完成 Xcode 基础环境准备，并成功跑通第一个 SwiftUI 页面。

## 场景引入（为什么先学这个）

很多新手一上来就急着写按钮、写列表、写动画，但还没搞清楚 SwiftUI 到底是什么。结果就是代码能抄下来，却不知道为什么这样写。

这一章的作用，就是先把地基打稳。你不用一下子学很多 API，只需要先明白三件事：

1. SwiftUI 是 Apple 提供的现代界面框架。
2. 你写的是“界面长什么样”，而不是“界面一步步怎么做出来”。
3. 学 SwiftUI 前，先把开发环境跑通比什么都重要。

## 本章术语先看懂

- `SwiftUI`：Apple 的声明式 UI 框架，用来开发 iPhone、iPad、Mac 等平台界面。
- `View`：界面中的一个“显示单元”，比如一段文字、一个按钮、一张图片，甚至整个页面都可以是 View。
- `声明式 UI`：你直接描述“现在界面应该长什么样”，系统自己决定如何渲染和更新。
- `Preview`：Xcode 里实时预览 SwiftUI 视图效果的功能。

## 一句话理解

SwiftUI 就像你在告诉系统：“请给我一个标题、一段说明和一个按钮”，而不是像传统方式那样手动创建控件、摆坐标、更新内容。

## SwiftUI 和传统写法有什么区别

如果你之前接触过 UIKit，可能会习惯这种思路：

- 先创建一个标签
- 再设置它的文字
- 再设置颜色
- 再设置位置
- 最后把它加到页面上

而 SwiftUI 更像是在写“界面描述书”：

```swift
Text("你好，SwiftUI")
    .font(.title)
    .foregroundStyle(.blue)
```

你不是在命令系统一步步生成标签，而是在描述“这里有一段蓝色的大标题文字”。

## 学习前准备

开始这一章前，请确认你已经准备好：

1. 一台能安装 Xcode 的 Mac。
2. Xcode 15 或更新版本。
3. 能正常打开模拟器或者 Preview。
4. 知道怎么新建一个 SwiftUI App 工程。

如果你还不会创建工程，按下面步骤做：

1. 打开 Xcode。
2. 选择 `Create a new Xcode project`。
3. 选择 `App` 模板。
4. Interface 选 `SwiftUI`。
5. Language 选 `Swift`。
6. 创建项目后点击运行按钮。

### 预期结果

你应该能看到一个默认页面成功在模拟器或预览中显示出来。

## 手把手操作步骤

### 第 1 步：新建一个练习视图

在你的 SwiftUI 工程里，创建一个新的 Swift 文件，命名为 `WelcomeStarterView.swift`。

### 第 2 步：粘贴下面代码

## 完整示例代码

```swift
import SwiftUI

struct WelcomeStarterView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("你好，SwiftUI")
                .font(.title2)
                .fontWeight(.bold)

            Text("第一个页面运行成功")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    WelcomeStarterView()
}
```

### 第 3 步：运行预览或模拟器

如果你使用 Preview，应该马上看到两行文字：

- 第一行更大、更粗
- 第二行颜色更浅

### 第 4 步：自己改一处

请你试着把：

- `"你好，SwiftUI"` 改成你自己的欢迎语
- 或者把 `.title2` 改成 `.largeTitle`

### 预期结果

你修改的内容应该立刻体现在界面上。

## 代码拆解（小白重点）

### `struct WelcomeStarterView: View`

这表示你定义了一个新的界面视图，名字叫 `WelcomeStarterView`。

你可以先把它理解成：

- `struct`：Swift 里的结构体
- `View`：SwiftUI 界面协议

也就是说：这个结构体是一个可以显示在屏幕上的界面。

### `var body: some View`

这行是 SwiftUI 最核心的入口。

你可以把它理解成：

- `body` 里面写什么
- 页面最终就会显示什么

注意这里不是函数，不用写括号，它是一个“计算属性”。

### `VStack(spacing: 12)`

`VStack` 表示把内容“竖着排列”。

这里面放了两个 `Text`，所以最后你会看到两行上下排列的文字。

`spacing: 12` 表示这两行之间间距是 12。

### 第一个 `Text`

```swift
Text("你好，SwiftUI")
    .font(.title2)
    .fontWeight(.bold)
```

这段表示：

- 显示一段文字
- 字号较大
- 字体加粗

### 第二个 `Text`

```swift
Text("第一个页面运行成功")
    .foregroundStyle(.secondary)
```

这里用了 `.foregroundStyle(.secondary)`，表示用系统次级文字颜色。效果通常是灰一些、弱一些，适合辅助说明文字。

### `.padding()`

给整个 `VStack` 增加内边距。没有它的话，文字会更贴近屏幕边缘。

## 你现在真正学会了什么

学完这一章，你至少应该能回答：

1. SwiftUI 是什么？
2. `View` 是什么？
3. `body` 是干什么的？
4. `VStack` 为什么能把内容竖着排？
5. 修饰符为什么总是写在 View 后面？

如果这 5 个问题你能说清 3 个以上，就说明你已经不是“纯抄代码”了。

## 新手排错流程（建议照着做）

### 情况 1：预览不显示

先检查：

1. 文件里有没有语法错误。
2. `#Preview` 是否写对。
3. Xcode 是否还在编译中。

### 情况 2：提示 `Cannot find type 'View' in scope`

通常是因为你漏写了：

```swift
import SwiftUI
```

### 情况 3：界面没变化

检查你改的是不是当前正在预览的那个 View，而不是改到了别的文件。

## 章节小测（带答案）

### 题 1

SwiftUI 是命令式 UI 还是声明式 UI？

参考答案：声明式 UI。

### 题 2

`body` 里的内容代表什么？

参考答案：代表当前这个视图应该显示成什么样子。

### 题 3

`VStack` 的作用是什么？

参考答案：把子视图按垂直方向排列。

## 练习任务

### 基础练习

把页面改成三行内容：

1. 一个主标题
2. 一个副标题
3. 一句你自己的学习目标

### 加强练习

把主标题改成绿色，把副标题改成灰色。

### 挑战练习

自己再增加一个 `Image(systemName:)` 图标，放在两段文字上面。

## 复盘模板（建议写下来）

- 我今天真正理解的一个词：
- 我今天第一次跑通的 SwiftUI 页面：
- 我最容易忘记的一行代码：
- 我下一章最想解决的问题：

## 本章学习提示

先不要急着记很多修饰符。你只要先记住：

- `View` 是界面
- `body` 是内容
- 修饰符是样式

这三件事就够了。

## 本章小结

这一章的任务不是“写出很复杂的页面”，而是先把 SwiftUI 的基本感觉建立起来。只要你已经能创建一个简单的页面、能改文字、能改样式，那这一章就已经学会了。
