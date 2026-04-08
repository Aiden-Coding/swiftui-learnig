# 17. 测试基础：可测试思维与简单单元测试

## 学习目标

- 理解 SwiftUI 学习阶段最值得先测什么
- 学会把简单逻辑从视图中拆出来测试
- 认识基础断言与测试命名习惯

## 中文讲解

初学 SwiftUI 时，不需要一上来就覆盖全部 UI 自动化。更高收益的做法是先测试纯逻辑，比如输入校验、过滤条件、状态计算。这些逻辑稳定、执行快，也更容易定位问题。

为了便于测试，可以把逻辑提取到普通结构体或函数里。视图只负责展示，逻辑由可测试单元负责，这样代码质量会更稳。

测试命名建议采用“条件 + 预期结果”的风格，让未来回看时一眼就知道测试在保护什么行为。

## English Notes

At the beginner stage, you do not need full UI automation first. A higher-value strategy is to test pure logic such as validation, filtering, and state calculation.

Extracting logic from views into simple structs or functions makes testing straightforward and improves maintainability.

Use clear test names that describe condition and expected outcome.

## 示例代码

```swift
import XCTest

struct UsernameValidator {
    static func isValid(_ text: String) -> Bool {
        text.count >= 3
    }
}

final class UsernameValidatorTests: XCTestCase {
    func testShortNameIsInvalid() {
        XCTAssertFalse(UsernameValidator.isValid("ab"))
    }

    func testValidNamePasses() {
        XCTAssertTrue(UsernameValidator.isValid("alex"))
    }
}
```

这个示例展示了最基础的逻辑测试思路。

This sample demonstrates a minimal and practical unit testing approach.

## 常见错误

- 只写 UI，不提取可测试逻辑
- 测试名过于笼统，看不出保护行为
- 测试覆盖了很多代码，却没有覆盖关键规则

## 本章小结

你学会了 SwiftUI 入门阶段的测试重点，以及如何从可测试逻辑开始建立质量保障。

What you learned: you can now write simple unit tests for extracted business logic.
