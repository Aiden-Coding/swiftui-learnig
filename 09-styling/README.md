# 09. 样式与常用修饰符组织

## 学习目标

- 理解为什么页面样式不能一直散着写。
- 学会把重复样式整理出来。
- 知道什么时候该用 `ViewModifier`。

## 场景引入

当页面开始变多时，你会很快遇到一个问题：标题样式每页都要写一遍，改一个颜色要改很多地方。这时就需要建立“样式组织”的意识。

## 本章术语先看懂

- `ViewModifier`：封装样式逻辑的方式
- `modifier`：给视图附加样式或行为
- `foregroundStyle`：设置前景颜色样式

## 一句话理解

如果一个样式重复出现很多次，就不应该每次重新写。

## 手把手操作步骤

1. 创建一个标题样式修饰符。
2. 粘贴代码并运行。
3. 把标题样式分别应用到两个文本上。
4. 改主题颜色，观察是否能一处生效到处变化。

## 完整示例代码

```swift
import SwiftUI

struct CardTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.blue)
    }
}

extension View {
    func cardTitleStyle() -> some View {
        modifier(CardTitleStyle())
    }
}

struct StylingDemoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("今日学习进度")
                .cardTitleStyle()

            Text("已完成 3 个知识点")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    StylingDemoView()
}
```

## 代码拆解（小白重点）

- `ViewModifier` 封装一整组样式。
- `extension View` 让调用方式更自然。
- 以后要统一改标题样式时，只改一个地方即可。

## 新手排错流程

1. 自定义修饰符找不到时，检查有没有写 `extension View`。
2. 样式没生效时，确认是不是加到了正确的视图上。
3. 如果逻辑看不懂，先把它理解成“把一串修饰符打包了”。

## 章节小测（带答案）

### 题 1

什么时候适合抽 `ViewModifier`？

参考答案：当某组样式重复出现很多次时。

### 题 2

`extension View` 的作用是什么？

参考答案：让自定义样式调用起来更自然。

### 题 3

这一章的核心目标是什么？

参考答案：减少重复样式代码，提高一致性和维护性。

## 练习任务

- 基础练习：再写一个副标题样式修饰符。
- 加强练习：把按钮样式也抽成统一风格。
- 挑战练习：定义一套卡片标题、正文和背景的统一视觉规则。

## 本章完成标准

学完这一章后，你至少应该能做到：

- 知道什么时候适合抽 `ViewModifier`
- 能把重复样式封装成更统一的写法
- 能理解“可维护样式”比“页面先凑出来”更重要

## 学完这一章后马上可以做的练习

选你前面做过的一个页面，把其中至少一类重复样式提取出来，比如：

- 标题样式
- 副标题样式
- 按钮样式

只要你真正提过一次，就会理解这一章的价值。

## 下一章为什么会进入模态展示

你现在已经会基础页面、导航、表单和样式整理了。

下一步要开始补的是更真实的交互流程：

- 临时弹出一个编辑页
- 删除前弹一个确认框

所以建议接着看：

- [10 模态展示：sheet、alert、confirmationDialog](/D:/Documents/GitHub/swiftui-learnig/10-modal-presentation/README.md)

## 本章学习提示

不要太早追求复杂设计系统，但要尽早开始减少重复样式。

## 本章小结

这一章之后，你开始从“会写页面”走向“会整理页面样式”。这是可维护性非常关键的一步。
