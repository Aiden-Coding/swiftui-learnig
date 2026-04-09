# 17. 测试基础：先验证逻辑，再放心改代码

## 学习目标

- 理解测试为什么能帮助你减少改代码时的恐惧。
- 认识单元测试最适合验证什么。
- 学会为一个简单的业务逻辑写测试思路。

## 场景引入

很多新手一听到“测试”就觉得离自己很远，像是大项目才需要。但只要你遇到过这些情况，就会知道测试有多有用：

- 明明只是改了一个小逻辑，结果别的地方坏了
- 改完代码后不敢继续重构
- 每次都要手点一遍页面确认功能还在

测试最核心的价值不是形式，而是让你能更放心地修改代码。

## 本章术语先看懂

- `单元测试`：验证某个小逻辑是否正确。
- `断言`：写下“我预期结果应该是什么”。
- `可测试逻辑`：不依赖界面、输入输出清楚的逻辑。

## 一句话理解

测试不是先测页面好不好看，而是先测“规则有没有算对”。

## 示例业务逻辑

```swift
struct ProgressSummaryBuilder {
    func message(completed: Int, total: Int) -> String {
        guard total > 0 else { return "还没有学习任务" }
        guard completed < total else { return "已全部完成" }
        return "已完成 \(completed) / \(total)"
    }
}
```

## 对应测试代码示例

```swift
import XCTest
@testable import YourAppModuleName

final class ProgressSummaryBuilderTests: XCTestCase {
    func testEmptyTasks() {
        let builder = ProgressSummaryBuilder()
        let result = builder.message(completed: 0, total: 0)
        XCTAssertEqual(result, "还没有学习任务")
    }

    func testAllCompleted() {
        let builder = ProgressSummaryBuilder()
        let result = builder.message(completed: 3, total: 3)
        XCTAssertEqual(result, "已全部完成")
    }

    func testPartialCompleted() {
        let builder = ProgressSummaryBuilder()
        let result = builder.message(completed: 1, total: 3)
        XCTAssertEqual(result, "已完成 1 / 3")
    }
}
```

## 代码拆解（小白重点）

- 先把可测试逻辑从 SwiftUI 视图里提出来。
- `XCTAssertEqual` 的作用就是核对“实际结果”和“预期结果”是否一致。
- 同一个函数通常要测多种输入情况，才能真正安心。

## 新手常见误区

- 觉得测试一定要从 UI 开始。
- 功能简单就不写测试。
- 以为测试只是形式，没有实际收益。

## 新手排错流程

1. 测试 target 跑不起来时，先检查 target 配置。
2. `@testable import` 报错时，检查模块名是否正确。
3. 测试失败时，先区分是逻辑写错了，还是预期写错了。

## 章节小测（带答案）

### 题 1

为什么初学测试时推荐先测纯逻辑？

参考答案：因为输入输出更清楚，理解门槛更低，不容易被 UI 细节干扰。

### 题 2

`XCTAssertEqual` 是干什么的？

参考答案：用来断言实际结果是否等于预期结果。

### 题 3

如果一个函数很难写测试，通常说明什么？

参考答案：通常说明它职责太多，或者依赖太复杂，应该考虑拆分。

## 练习任务

- 基础练习：给 `ProgressSummaryBuilder` 增加一个边界情况。
- 加强练习：写一个“根据分数返回等级”的函数并补测试。
- 挑战练习：把前面某章中的纯逻辑提取出来写测试。

## 本章小结

学完这章后，你应该已经明白：测试不是离新手很远的东西，它其实是帮助你稳定修改代码的一种安全网。
