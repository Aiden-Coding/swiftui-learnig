# 38. 推送通知基础

## 学习目标

- 理解推送通知的核心价值
- 认识注册权限与消息处理流程
- 能设计基础通知落地页逻辑

## 中文讲解

推送是提升回访和提醒完成率的重要方式，但前提是内容有价值且频率可控。技术上要先处理授权、接收和点击后的跳转。

入门阶段重点是流程完整：申请权限、接收消息、点击后进入目标页面。

## English Notes

Push notifications can improve engagement when they are relevant and timely. The technical basics are permission, delivery handling, and tap routing.

Focus on end-to-end flow first.

## 示例代码

```swift
import UserNotifications

final class NotificationManager {
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
    }
}
```

## 常见错误

- 没有解释为什么要授权
- 推送文案与页面不一致
- 点击推送后无法落地到具体内容

## 本章小结

你学会了推送通知入门流程和产品侧注意点。

What you learned: you understand the basic push permission and handling flow.
