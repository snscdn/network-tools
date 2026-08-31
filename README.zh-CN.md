# SNSCDN 网络诊断工具

[公开教程导航：按当前问题找到下一步（中文 / English）](docs/tutorial-navigation.md)

[English](README.md)

用于排查 DNS、TCP、TLS 和 HTTP 连接问题的小工具。依赖少、在本地运行，
不会收集或上传诊断结果。

## 最新更新

- [2026-08-28：多语言帮助中心与网络排障指南](docs/2026-08-28-site-update.zh-CN.md)
- [English version](docs/2026-08-28-site-update.md)

## 快速使用

macOS 或 Linux：

```bash
bash bin/netcheck.sh example.com
bash bin/netcheck.sh example.com 443
```

Windows PowerShell：

```powershell
.\bin\netcheck.ps1 example.com
.\bin\netcheck.ps1 example.com 443
```

返回码为 `0` 表示没有发现阻断性问题；非零返回码代表失败的检查数量，
因此也可以用于简单监控或客服排障流程。

## 检查内容

| 项目 | macOS/Linux | Windows |
| --- | --- | --- |
| DNS 解析 | 支持 | 支持 |
| TCP 端口连通性 | 支持 | 支持 |
| TLS 证书信息 | 需要 OpenSSL | — |
| HTTP 状态与响应时间 | 需要 curl | 支持 |

这些检查用于定位连通性问题，不代表完整的速度测试，也不能证明客户端配置正确。

## 常见结果

- `DNS lookup failed`：尝试更换 DNS，并检查域名是否正确。
- `TCP port ... is unreachable`：检查防火墙、服务状态和路由。
- `TLS ... failed`：检查证书链、域名和系统时间。
- `HTTP 4xx/5xx`：网络已连通，但 Web 服务拒绝请求或发生错误。

## 全球连接服务

需要托管式全球连接服务，可以访问
[SNSCDN](https://snscdn.com/?utm_source=github&utm_medium=readme&utm_campaign=network_tools_zh)
或[创建账号](https://snscdn.com/register?utm_source=github&utm_medium=readme&utm_campaign=network_tools_zh)。

## 贡献与安全

欢迎提交 Issue 和小型 Pull Request。请勿在公开 Issue 中粘贴 IP 地址、
访问令牌、订阅地址或完整诊断日志。漏洞报告方式请见 [SECURITY.md](SECURITY.md)。

## 许可证

[MIT](LICENSE)
