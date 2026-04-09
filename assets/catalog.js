window.TUTORIAL_GROUPS = [
  {
    id: "fundamentals",
    title: "第一阶段：SwiftUI 基础入门（01-10）",
    description: "打稳界面、布局、状态、列表、导航和表单基础。",
    chapters: [
      { number: 1, title: "SwiftUI 是什么与开发环境准备", path: "01-introduction/README.md" },
      { number: 2, title: "第一个 View 与基本语法", path: "02-first-view/README.md" },
      { number: 3, title: "文本、图片、按钮与基础组件", path: "03-basic-controls/README.md" },
      { number: 4, title: "布局系统：VStack、HStack、ZStack、Spacer", path: "04-layout/README.md" },
      { number: 5, title: "状态管理基础：@State、@Binding", path: "05-state/README.md" },
      { number: 6, title: "列表与数据展示：List、ForEach", path: "06-lists/README.md" },
      { number: 7, title: "导航：NavigationStack 与页面跳转", path: "07-navigation/README.md" },
      { number: 8, title: "表单与输入：TextField、Toggle、Picker", path: "08-forms/README.md" },
      { number: 9, title: "样式与常用修饰符组织", path: "09-styling/README.md" },
      { number: 10, title: "模态展示：sheet、alert、confirmationDialog", path: "10-modal-presentation/README.md" }
    ]
  },
  {
    id: "project-skills",
    title: "第二阶段：真实页面能力进阶（11-20）",
    description: "进入更真实的 SwiftUI 页面开发，包括动画、异步、数据流和小项目。",
    chapters: [
      { number: 11, title: "动画基础：让界面动起来", path: "11-animation/README.md" },
      { number: 12, title: "异步数据加载：加载中、成功、失败", path: "12-async-data/README.md" },
      { number: 13, title: "组件复用：把重复界面抽成可复用模块", path: "13-reusable-components/README.md" },
      { number: 14, title: "视图生命周期：页面什么时候出现、什么时候消失", path: "14-lifecycle/README.md" },
      { number: 15, title: "可观察数据流：让多个页面共享数据变化", path: "15-observable-data-flow/README.md" },
      { number: 16, title: "本地持久化：让数据在下次打开时还在", path: "16-persistence/README.md" },
      { number: 17, title: "测试基础：先验证逻辑，再放心改代码", path: "17-testing-basics/README.md" },
      { number: 18, title: "小项目实战：做一个学习打卡应用", path: "18-mini-project/README.md" },
      { number: 19, title: "SwiftData 基础：更现代地保存结构化数据", path: "19-swiftdata-basics/README.md" },
      { number: 20, title: "架构基础：分层不是为了高级，而是为了不乱", path: "20-architecture-basics/README.md" }
    ]
  },
  {
    id: "engineering",
    title: "第三阶段：工程化基础能力（21-30）",
    description: "把页面开发能力进一步延伸到性能、测试、发布、网络和组件体系。",
    chapters: [
      { number: 21, title: "性能基础：先把页面做对，再把页面做快", path: "21-performance-basics/README.md" },
      { number: 22, title: "无障碍基础：让更多人能用你的 App", path: "22-accessibility/README.md" },
      { number: 23, title: "发布流程基础：从开发到上线要经过什么", path: "23-release-workflow/README.md" },
      { number: 24, title: "面试与练习：把学过的知识说清楚、做出来", path: "24-interview-practice/README.md" },
      { number: 25, title: "Swift 并发基础：async、await 和 Task 怎么配合", path: "25-swift-concurrency/README.md" },
      { number: 26, title: "网络层基础：不要把请求代码直接塞进页面", path: "26-networking-layer/README.md" },
      { number: 27, title: "错误处理基础：不要只处理成功结果", path: "27-error-handling/README.md" },
      { number: 28, title: "主题系统基础：让页面颜色和样式更统一", path: "28-theme-system/README.md" },
      { number: 29, title: "组件库基础：把常用 UI 沉淀成团队资产", path: "29-component-library/README.md" },
      { number: 30, title: "CI/CD 基础：让构建和检查更自动化", path: "30-ci-cd-basics/README.md" }
    ]
  },
  {
    id: "product-platform",
    title: "第四阶段：产品与平台能力拓展（31-40）",
    description: "从安全、日志、本地化到 Widget、通知、Deep Link 和功能开关。",
    chapters: [
      { number: 31, title: "安全基础：先避免明显风险，再谈更复杂防护", path: "31-security-basics/README.md" },
      { number: 32, title: "日志与监控基础：出了问题，要能看见问题", path: "32-logging-monitoring/README.md" },
      { number: 33, title: "本地化基础：让应用能支持多语言", path: "33-localization/README.md" },
      { number: 34, title: "Widget 基础：把关键信息展示到桌面之外", path: "34-widgets/README.md" },
      { number: 35, title: "App Intents 基础：让系统和你的应用更好协作", path: "35-app-intents/README.md" },
      { number: 36, title: "发布后运营基础：应用上线后，工作并没有结束", path: "36-post-release-ops/README.md" },
      { number: 37, title: "Deep Link 基础：让外部链接能直接打开指定页面", path: "37-deep-link-basics/README.md" },
      { number: 38, title: "推送通知基础：不是发出去就算完成", path: "38-push-notification-basics/README.md" },
      { number: 39, title: "离线优先基础：没有网络时，应用也别完全失能", path: "39-offline-first-basics/README.md" },
      { number: 40, title: "功能开关基础：不是所有新功能都要一次性全部放开", path: "40-feature-flags/README.md" }
    ]
  },
  {
    id: "growth",
    title: "第五阶段：团队协作与长期成长（41-50）",
    description: "面向真实团队协作、产品迭代和长期成长的最后一段学习路线。",
    chapters: [
      { number: 41, title: "设计协作基础：不是拿到稿子照着还原就结束了", path: "41-design-collaboration/README.md" },
      { number: 42, title: "代码评审基础：不是挑刺，而是一起把问题挡在上线前", path: "42-code-review-practice/README.md" },
      { number: 43, title: "依赖管理基础：外部库不是越多越好", path: "43-dependency-management/README.md" },
      { number: 44, title: "模块化基础：项目变大后，边界要更清楚", path: "44-module-basics/README.md" },
      { number: 45, title: "数据分析基础：先知道用户在做什么，才能知道该优化什么", path: "45-analytics-basics/README.md" },
      { number: 46, title: "实验基础：不是每个想法都要靠拍脑袋决定", path: "46-experiment-basics/README.md" },
      { number: 47, title: "App Store 优化基础：不是上架了就一定有人看见", path: "47-app-store-optimization/README.md" },
      { number: 48, title: "团队流程基础：不是每个人各写各的就能协作顺畅", path: "48-team-workflow/README.md" },
      { number: 49, title: "作品集项目指南：做项目不是堆功能，而是展示能力", path: "49-portfolio-project-guide/README.md" },
      { number: 50, title: "下一步学习路线：从会写基础页面，到真正做出完整产品", path: "50-next-step-roadmap/README.md" }
    ]
  }
];
