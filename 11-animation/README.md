# 11. 动画基础：让界面动起来

## 学习目标

- 理解 SwiftUI 动画的本质是“状态变化 + 过渡效果”。
- 学会使用 `withAnimation`、`.animation`、`transition`。
- 能做出一个基础的展开收起卡片。

## 场景引入

如果一个页面里的内容突然出现、突然消失，用户会觉得界面很“硬”。动画的作用不是炫技，而是帮助用户理解：刚刚发生了什么变化，内容是从哪里来的，又去了哪里。

这一章我们不追求花哨，而是先学会最常见的一类动画：点击按钮后，卡片平滑展开，再点击时平滑收起。

## 本章术语先看懂

- `withAnimation`：把某次状态变化包起来，让它带动画。
- `.animation(..., value:)`：当某个值变化时，自动为相关界面变化加动画。
- `transition`：视图插入和移除时的过渡方式。
- `easeInOut`：先慢后快再慢的常见动画曲线。

## 一句话理解

动画不是“让视图自己动”，而是“当状态改变时，让界面变化更平滑地发生”。

## 手把手操作步骤

1. 新建 `ExpandableCardView.swift`。
2. 粘贴下面代码并运行。
3. 点击按钮，观察卡片详情出现和消失的过程。
4. 修改动画时长，再次运行对比变化。

## 完整示例代码

```swift
import SwiftUI

struct ExpandableCardView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack(spacing: 16) {
            Button(isExpanded ? "收起详情" : "展开详情") {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isExpanded.toggle()
                }
            }
            .buttonStyle(.borderedProminent)

            VStack(alignment: .leading, spacing: 8) {
                Text("SwiftUI 学习卡片")
                    .font(.title3)
                    .fontWeight(.semibold)

                Text("点击按钮后查看本节课程说明。")
                    .foregroundStyle(.secondary)

                if isExpanded {
                    Divider()

                    Text("动画可以帮助用户理解界面变化，而不是只为了看起来酷。")
                        .font(.subheadline)

                    Text("这一块内容会带着过渡效果出现和消失。")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.08), radius: 10, y: 4)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    ExpandableCardView()
}
```

## 代码拆解（小白重点）

- `@State private var isExpanded = false` 表示当前卡片是否展开。
- `withAnimation` 让这次状态切换带上动画。
- `if isExpanded` 控制详情内容是否存在。
- `transition` 负责“出现/消失”时的过渡效果。

## 新手常见误区

- 写了 `transition` 但没有 `withAnimation`，结果内容还是瞬间切换。
- 把动画挂在过大的视图范围上，导致不该动的内容也跟着动。
- 一上来就追求复杂动画，反而把状态逻辑写乱。

## 新手排错流程

1. 按钮点了没变化时，先确认 `isExpanded` 是否真的改变。
2. 有变化但没动画时，检查是否少了 `withAnimation`。
3. 过渡方向不对时，检查 `transition` 的设置。

## 章节小测（带答案）

### 题 1

SwiftUI 里的动画最常跟什么一起出现？

参考答案：跟状态变化一起出现。

### 题 2

`transition` 最适合搭配什么场景？

参考答案：视图被插入或移除的场景，比如 `if` 条件渲染。

### 题 3

为什么初学阶段更推荐先用 `withAnimation`？

参考答案：因为更直观，容易看清楚是哪次状态变化触发了动画。

## 练习任务

- 基础练习：把详情改成从底部出现。
- 加强练习：增加一个会旋转的箭头图标。
- 挑战练习：做一个 FAQ 问答展开列表。

## 本章小结

学完这章后，你应该已经理解：SwiftUI 动画的核心不是手动操作坐标，而是让状态变化更自然地体现在界面上。
