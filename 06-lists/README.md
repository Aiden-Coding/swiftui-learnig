# 06. 列表与数据展示：List、ForEach

## 学习目标

- 学会展示一组重复数据
- 理解 `List` 和 `ForEach` 的基本关系
- 能构建一个简单的信息列表页面

## 中文讲解

很多应用界面本质上都是“把一组数据展示出来”，比如联系人、任务、消息、设置项。SwiftUI 里最常见的方式是使用 `List` 和 `ForEach`。

`List` 提供了适合滚动内容的列表容器，而 `ForEach` 负责把数组中的每一项转换成一个个视图。你可以把它理解为“为每条数据重复生成一行界面”。

在入门阶段，你只需要先掌握数组数据如何映射到界面上。后面再逐步学习删除、移动、分组等高级列表能力。

## English Notes

Many app screens are basically collections of repeated data, such as contacts, tasks, messages, or settings items. In SwiftUI, the usual way to show them is with `List` and `ForEach`.

`List` provides a scrollable list container, while `ForEach` turns each item in an array into a view. You can think of it as generating one row for each data item.

At the beginner stage, focus on understanding how data maps into UI. Advanced list actions like delete or move can come later.

## 示例代码

```swift
import SwiftUI

struct CourseListView: View {
    let courses = ["Swift Basics", "SwiftUI Views", "State", "Navigation"]

    var body: some View {
        List {
            ForEach(courses, id: \.self) { course in
                HStack {
                    Image(systemName: "book.fill")
                        .foregroundStyle(.blue)
                    Text(course)
                }
            }
        }
    }
}
```

这个例子展示了如何把一个字符串数组快速渲染成列表界面。

This example shows how to render a simple array of strings into a list-based screen.

## 常见错误

- 不清楚什么时候该用 `List`，什么时候只是普通 `VStack`
- `ForEach` 的标识写法不理解，尤其是 `id: \.self`
- 列表能显示了，但没有注意行内容是否足够清晰

## 本章小结

你学会了把数组数据映射成列表界面，这是 SwiftUI 中最常见的数据展示方式之一。

What you learned: you can now take a collection of data and render it into a SwiftUI list with repeated rows.
