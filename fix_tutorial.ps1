$utf8 = New-Object System.Text.UTF8Encoding($true)

$chapters = Get-ChildItem -Directory | Where-Object { $_.Name -match "^\d{2}-" } | Sort-Object Name

function Get-Scene([int]$n, [string]$title) {
  switch ($n) {
    1 { "刚入门 iOS 开发，不知道 SwiftUI 和 UIKit 区别。" }
    2 { "能看懂代码但不会自己搭页面。" }
    3 { "页面能显示文字，但交互和图标还不会。" }
    4 { "元素总是排不齐，不知道该用哪个容器。" }
    5 { "点击按钮后界面不更新，或更新逻辑混乱。" }
    6 { "会写静态页面，但不会批量展示数据。" }
    7 { "只会单页面，不会在页面之间跳转。" }
    8 { "能显示控件，但输入值拿不到或无法保存。" }
    9 { "样式越写越乱，改一个颜色要改很多地方。" }
    10 { "不知道什么时候弹窗，什么时候跳新页面。" }
    11 { "界面切换生硬，缺少反馈感。" }
    12 { "网络数据来了才显示，期间页面空白。" }
    13 { "相同 UI 在多个页面重复粘贴。" }
    14 { "数据加载时机混乱，重复请求频繁出现。" }
    15 { "多个页面都要改同一份数据。" }
    16 { "App 重启后用户设置丢失。" }
    17 { "改一个功能就担心把别的逻辑改坏。" }
    18 { "学了很多点，但不会组合成完整项目。" }
    default { "你正在学习“$title”相关能力，希望能落地到真实项目。" }
  }
}

function Get-Tip([int]$n) {
  switch ($n) {
    1 { "先跑通一个 Hello 页面，比看十篇文章更有效。" }
    2 { "遇到 some View 不要慌，先把它当作“某种视图”。" }
    3 { "优先使用 SF Symbols，能减少素材准备成本。" }
    4 { "先定层级，再调间距，不要先乱加 padding。" }
    5 { "谁拥有数据，谁就该定义状态。" }
    6 { "先保证每行信息清晰，再考虑复杂样式。" }
    7 { "现代 SwiftUI 优先使用 NavigationStack。" }
    8 { "输入控件的核心就是绑定状态。" }
    9 { "重复出现 3 次以上的样式就该抽离。" }
    10 { "临时任务用模态，层级流转用导航。" }
    11 { "动画要服务理解，不是越多越好。" }
    12 { "不要只写成功分支，失败分支同样重要。" }
    13 { "组件的价值在于清晰输入和稳定输出。" }
    14 { "生命周期可能触发多次，逻辑要可重复执行。" }
    15 { "先保证单向流动清晰，再扩展模型复杂度。" }
    16 { "UserDefaults 适合轻量 key-value，不适合复杂数据。" }
    17 { "先测最容易出错的规则。" }
    18 { "先做最小闭环，再考虑高级功能。" }
    default { "先跑通最小示例，再做扩展。" }
  }
}

function Get-Code([int]$n, [string]$title) {
  switch ($n) {
    1 {@'
import SwiftUI

struct WelcomeStarterView: View {
    var body: some View {
        Text("你好，SwiftUI")
            .font(.title2)
            .fontWeight(.bold)
            .padding()
    }
}
'@}
    2 {@'
import SwiftUI

struct FirstViewSyntaxDemo: View {
    var body: some View {
        Text("欢迎学习 SwiftUI")
            .font(.title)
            .padding()
            .background(.blue.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
'@}
    3 {@'
import SwiftUI

struct BasicControlsCardView: View {
    @State private var joined = false

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: joined ? "checkmark.seal.fill" : "star.fill")
            Button(joined ? "已加入" : "立即加入") { joined = true }
        }
    }
}
'@}
    4 {@'
import SwiftUI

struct ProfileLayoutView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
            VStack(alignment: .leading) {
                Text("小白同学")
                Text("SwiftUI 初学者")
            }
            Spacer()
        }
        .padding()
    }
}
'@}
    5 {@'
import SwiftUI

struct CounterParentView: View {
    @State private var count = 0
    var body: some View { CounterChildView(count: $count) }
}

struct CounterChildView: View {
    @Binding var count: Int
    var body: some View { Button("+1") { count += 1 } }
}
'@}
    6 {@'
import SwiftUI

struct CourseListDemoView: View {
    let courses = ["Swift", "SwiftUI", "State", "Navigation"]
    var body: some View {
        List(courses, id: \.self) { Text($0) }
    }
}
'@}
    7 {@'
import SwiftUI

struct TopicNavigationView: View {
    var body: some View {
        NavigationStack {
            List(["布局","状态","导航"], id: \.self) { topic in
                NavigationLink(topic) { Text("你选择了 \(topic)") }
            }
        }
    }
}
'@}
    8 {@'
import SwiftUI

struct SettingsFormDemoView: View {
    @State private var name = ""
    @State private var notify = true
    var body: some View {
        Form {
            TextField("昵称", text: $name)
            Toggle("开启提醒", isOn: $notify)
        }
    }
}
'@}
    9 {@'
import SwiftUI

struct CardTitleStyle: ViewModifier {
    func body(content: Content) -> some View { content.font(.title3).foregroundStyle(.blue) }
}

extension View { func cardTitleStyle() -> some View { modifier(CardTitleStyle()) } }
'@}
    10 {@'
import SwiftUI

struct ModalDemoView: View {
    @State private var showSheet = false
    var body: some View {
        Button("打开弹窗") { showSheet = true }
            .sheet(isPresented: $showSheet) { Text("弹窗内容") }
    }
}
'@}
    11 {@'
import SwiftUI

struct AnimationDemoView: View {
    @State private var show = false
    var body: some View {
        VStack {
            Button("切换") { withAnimation { show.toggle() } }
            if show { Text("动画内容").transition(.opacity) }
        }
    }
}
'@}
    12 {@'
import SwiftUI

struct AsyncLoadDemoView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/180")) { image in
            image.resizable().scaledToFit()
        } placeholder: { ProgressView() }
    }
}
'@}
    13 {@'
import SwiftUI

struct InfoCard: View {
    let title: String
    var body: some View { Text(title).padding().background(.gray.opacity(0.1)) }
}
'@}
    14 {@'
import SwiftUI

struct LifecycleDemoView: View {
    @State private var text = "未触发"
    var body: some View {
        Text(text)
            .onAppear { text = "页面出现" }
            .task { text = "异步任务完成" }
    }
}
'@}
    15 {@'
import SwiftUI
import Observation

@Observable final class UserModel { var name = "小白" }

struct SharedModelView: View {
    @State private var model = UserModel()
    var body: some View { TextField("昵称", text: $model.name) }
}
'@}
    16 {@'
import SwiftUI

struct AppStorageDemoView: View {
    @AppStorage("nickname") private var nickname = "游客"
    var body: some View { TextField("昵称", text: $nickname) }
}
'@}
    17 {@'
import XCTest

struct Rule { static func valid(_ s: String) -> Bool { s.count >= 3 } }

final class RuleTests: XCTestCase {
    func testValid() { XCTAssertTrue(Rule.valid("alex")) }
}
'@}
    18 {@'
import SwiftUI

struct Habit: Identifiable { let id = UUID(); var title: String; var done: Bool }

struct HabitTrackerView: View {
    @State private var habits = [Habit(title: "阅读", done: false)]
    var body: some View { List($habits) { $h in Toggle(h.title, isOn: $h.done) } }
}
'@}
    19 {@'
import SwiftUI
import SwiftData

@Model final class TodoItem { var title: String; init(title: String){ self.title = title } }

struct SwiftDataDemoView: View {
    @Environment(\.modelContext) private var context
    @Query private var items: [TodoItem]
    var body: some View { List(items) { Text($0.title) }.toolbar { Button("新增"){ context.insert(TodoItem(title:"新任务")) } } }
}
'@}
    20 {@'
import SwiftUI

struct TodoState { var items:[String]=[]; mutating func add(_ t:String){ if !t.isEmpty { items.append(t) } } }

struct ArchitectureDemoView: View {
    @State private var state = TodoState()
    @State private var input = ""
    var body: some View { VStack { TextField("输入任务", text:$input); Button("添加"){ state.add(input); input="" }; List(state.items, id:\.self){ Text($0) } } }
}
'@}
    21 {@'
import SwiftUI

struct PerfRow: Identifiable { let id = UUID(); let title: String }

struct PerformanceDemoView: View {
    @State private var rows = (1...200).map { PerfRow(title: "行 \($0)") }
    var body: some View { List(rows) { Text($0.title) } }
}
'@}
    22 {@'
import SwiftUI

struct AccessibilityDemoView: View {
    var body: some View {
        Button { } label: { Image(systemName: "square.and.arrow.down") }
            .accessibilityLabel("保存笔记")
            .accessibilityHint("将当前内容保存到本地")
    }
}
'@}
    23 {@'
发布清单（最小版）
1. 更新版本号与构建号
2. 验证核心流程
3. 跑关键测试
4. 检查监控
5. 补充发布说明
'@}
    24 {@'
面试练习清单
1. 解释 @State 和 @Binding 区别
2. 实现列表到详情页导航
3. 设计失败重试流程
'@}
    25 {@'
import SwiftUI

struct ConcurrencyDemoView: View {
    @State private var status = "空闲"
    var body: some View {
        VStack {
            Text(status)
            Button("异步加载") {
                Task {
                    status = "加载中"
                    try? await Task.sleep(for: .seconds(1))
                    status = "完成"
                }
            }
        }
    }
}
'@}
    26 {@'
import Foundation

struct Post: Decodable { let id: Int; let title: String }

final class APIClient {
    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Post].self, from: data)
    }
}
'@}
    27 {@'
import SwiftUI

enum LoadState { case idle, loading, success([String]), failure(String) }

struct ErrorStateDemoView: View {
    @State private var state: LoadState = .idle
    var body: some View { VStack { Button("重试") { state = .loading } } }
}
'@}
    28 {@'
import SwiftUI

enum Theme { static let primary = Color.blue; static let title = Font.title2 }

struct ThemeDemoView: View {
    var body: some View { Text("主题系统示例").font(Theme.title).foregroundStyle(Theme.primary) }
}
'@}
    29 {@'
import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var body: some View { Button(title, action: action).buttonStyle(.borderedProminent) }
}
'@}
    30 {@'
最小 CI 流程
1. 拉取代码
2. 执行构建
3. 运行测试
4. 回传结果
'@}
    31 {@'
import Foundation

enum SecureConfig {
    static func apiBaseURL() -> URL { URL(string: "https://api.example.com")! }
}
'@}
    32 {@'
import os

let logger = Logger(subsystem: "com.example.app", category: "network")
logger.info("开始请求")
logger.error("请求失败")
'@}
    33 {@'
import SwiftUI

struct LocalizationDemoView: View {
    var body: some View { Text("home_welcome_title") }
}
'@}
    34 {@'
import WidgetKit
import SwiftUI

struct ProgressEntry: TimelineEntry { let date: Date; let progressText: String }
struct ProgressWidgetView: View { let entry: ProgressEntry; var body: some View { Text(entry.progressText) } }
'@}
    35 {@'
import AppIntents

struct QuickAddTaskIntent: AppIntent {
    static var title: LocalizedStringResource = "快速新增任务"
    @Parameter(title: "任务标题") var taskTitle: String
    func perform() async throws -> some IntentResult { .result() }
}
'@}
    36 {@'
上线后每周复盘模板
1. 崩溃率是否变化
2. 核心流程转化是否下降
3. 用户反馈前 3 个问题
4. 下周优先修复项
'@}
    37 {@'
import SwiftUI

struct DeepLinkDemoView: View {
    @State private var route = "home"
    var body: some View { Text("当前路由: \(route)").onOpenURL { route = $0.host() ?? "home" } }
}
'@}
    38 {@'
import UserNotifications

final class PushPermissionManager {
    func request() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { _,_ in }
    }
}
'@}
    39 {@'
import SwiftUI

struct OfflineFallbackView: View {
    @State private var fromCache = true
    var body: some View { Text(fromCache ? "当前为离线缓存" : "在线数据") }
}
'@}
    40 {@'
import SwiftUI

enum FeatureFlags { static let enableNewProfile = false }

struct FeatureFlagDemoView: View {
    var body: some View { Text(FeatureFlags.enableNewProfile ? "新版个人主页" : "旧版个人主页") }
}
'@}
    41 {@'
设计交付对齐清单
1. 页面状态是否齐全
2. 间距字号是否有规范
3. 交互反馈是否定义
4. 异常态是否明确
'@}
    42 {@'
Code Review 高优先级检查
1. 行为是否正确
2. 边界是否覆盖
3. 是否有回归风险
4. 是否有对应测试
'@}
    43 {@'
依赖引入决策记录
- 需求背景
- 可选方案
- 选择原因
- 升级策略
- 退出方案
'@}
    44 {@'
模块拆分示例
- CoreUI
- FeatureHome
- FeatureLearning
- DataLayer
- AppEntry
'@}
    45 {@'
import Foundation

struct Analytics {
    static func track(_ event: String, props: [String: String] = [:]) { print(event, props) }
}
'@}
    46 {@'
实验卡模板
- 假设
- 主指标
- 护栏指标
- 时间窗口
'@}
    47 {@'
ASO 优化清单
1. 首图一句话讲清价值
2. 关键词覆盖核心场景
3. 副标题突出差异点
4. 复盘转化变化
'@}
    48 {@'
团队交付流程
Issue -> Branch -> PR -> Review -> Merge -> Release
'@}
    49 {@'
作品集 README 建议结构
1. 项目背景
2. 功能范围
3. 架构与数据流
4. 关键取舍
5. 演示与计划
'@}
    50 {@'
4 周成长计划
第 1 周：完成一个小项目
第 2 周：补测试与错误处理
第 3 周：优化性能与结构
第 4 周：复盘并输出总结
'@}
    default { "示例待补充" }
  }
}

foreach ($ch in $chapters) {
  $n = [int]$ch.Name.Substring(0,2)
  $file = Join-Path $ch.FullName "README.md"
  if (-not (Test-Path $file)) { continue }

  $text = Get-Content -LiteralPath $file -Raw
  $title = ($text -split "`n")[0] -replace '^#\s*\d+\.\s*',''
  $title = $title.Trim()
  $scene = Get-Scene $n $title
  $tip = Get-Tip $n
  $code = (Get-Code $n $title).TrimEnd()

  $text = [regex]::Replace($text, '## 场景引入（你会在哪遇到它）[\s\S]*?(?=## 本章术语先看懂)', "## 场景引入（你会在哪遇到它）`n`n$scene`n`n")
  $text = [regex]::Replace($text, '## 本章学习提示[\s\S]*?(?=## 本章小结)', "## 本章学习提示`n`n$tip`n`n")
  $text = [regex]::Replace($text, '## 完整示例代码[\s\S]*?(?=## 代码拆解（小白重点）)', "## 完整示例代码`n`n```swift`n$code`n```" + "`n`n")
  $text = [regex]::Replace($text, '\}\`\`\`', "}`n```")
  $text = $text -replace 'value:\s*,\s*in:', 'value: $progress, in:'
  $text = $text -replace 'text:\s*\)', 'text: $note)'

  Set-Content -LiteralPath $file -Value $text -Encoding utf8
}
