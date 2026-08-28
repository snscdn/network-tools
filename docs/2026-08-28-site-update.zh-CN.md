# SNSCDN 2026-08-28 更新：多语言帮助中心与网络排障指南

本次更新重点改善新用户上手、客户端导入和连接故障排查。界面与帮助内容
现在覆盖 English、简体中文、繁體中文、日本語、한국어、Tiếng Việt、
فارسی 和 Русский。

## 更新内容

每种语言均提供以下四类指南：

1. 从注册、购买到首次连接的完整顺序；
2. 选择套餐、支付和确认开通状态；
3. 使用一键订阅或手动方式导入兼容客户端；
4. 排查连接问题、保护账户并正确提交工单。

我们同时发布了开源网络诊断脚本，可在不上传数据的情况下检查 DNS、TCP、
TLS 和 HTTP 状态。

## 更新后建议怎样操作

### 1. 选择界面语言

登录 SNSCDN 后，在页面顶部的语言选项中选择常用语言。随后进入
**Knowledge Base（知识库）**，先阅读“从注册到首次连接”。

### 2. 按正确顺序完成首次连接

1. [创建账号](https://snscdn.com/register?utm_source=github&utm_medium=article&utm_campaign=site_update_20260828_zh)并完成邮箱验证；
2. 在[套餐页面](https://snscdn.com/plan?utm_source=github&utm_medium=article&utm_campaign=site_update_20260828_zh)选择套餐并只提交一次订单；
3. 在“我的订单”确认订单已经完成；
4. 返回[仪表盘](https://snscdn.com/dashboard?utm_source=github&utm_medium=article&utm_campaign=site_update_20260828_zh)，选择“一键订阅”；
5. 在客户端内更新订阅、选择可用节点并开启连接。

系统开通通常需要短暂处理时间。订单完成前反复导入，不会让订阅更快生效。

### 3. 连接失败时先做本地检查

macOS 或 Linux：

```bash
bash bin/netcheck.sh snscdn.com
```

Windows PowerShell：

```powershell
.\bin\netcheck.ps1 snscdn.com
```

结果含义：

- DNS 失败：检查域名和本机 DNS；
- TCP 失败：检查防火墙、网络路由或服务状态；
- TLS 失败：检查系统时间、证书链和域名；
- HTTP 4xx/5xx：网络已连通，但 Web 服务拒绝请求或发生错误。

### 4. 仍未解决时提交工单

请说明设备系统、客户端名称、问题发生时间和失败的检查项目。不要公开或粘贴：

- 订阅地址；
- 密码、验证码或访问令牌；
- 完整 IP 地址；
- 未脱敏的完整诊断日志。

订阅地址相当于访问凭证。只有怀疑泄露时才应在用户中心重置，重置后需要在
所有自己的客户端中重新导入。

## 反馈

诊断脚本的问题可在本仓库提交 Issue。账户、订单或订阅问题请通过
[SNSCDN](https://snscdn.com/?utm_source=github&utm_medium=article&utm_campaign=site_update_20260828_zh)
站内工单联系支持。
