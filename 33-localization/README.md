# 33. 国际化与本地化

## 学习目标

- 理解国际化和本地化的区别
- 学会管理多语言文本资源
- 能避免常见的硬编码文案问题

## 中文讲解

国际化是让应用具备多语言能力的技术基础，本地化是针对具体语言和地区做内容适配。SwiftUI 项目从一开始就避免硬编码文案，会让后续扩展轻松很多。

入门阶段重点是把用户可见文本集中到本地化资源，而不是散落在多个视图里。这样翻译、审校和迭代都更可控。

除了文字，日期、数字和货币格式也属于本地化体验的一部分。

## English Notes

Internationalization provides the technical foundation for multiple languages, while localization adapts content for specific locales.

Avoid hardcoded user-facing strings early. Centralized localization resources make translation and iteration much easier.

Localization includes formatting for dates, numbers, and currency, not just text translation.

## 示例代码

```swift
import SwiftUI

struct LocalizedView: View {
    var body: some View {
        Text("home_welcome_title")
    }
}
```

## 常见错误

- 文案直接写死在多个页面
- 只翻译文字，忽略格式本地化
- 新增功能忘记补语言资源

## 本章小结

你学会了 SwiftUI 本地化的基础路径，并能避免硬编码文案带来的维护问题。

What you learned: you can now structure SwiftUI text for scalable localization.
