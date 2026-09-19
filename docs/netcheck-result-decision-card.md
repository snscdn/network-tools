# SNSCDN netcheck result decision card / 结果判断卡

[简体中文](#简体中文) · [English](#english)

## 简体中文

这张判断卡用于配合仓库中的 `netcheck.sh` 与 `netcheck.ps1`，快速确定应先处理哪一层。它不是测速结果，也不能验证订阅或客户端配置。

| 最早出现的结果 | 先检查 | 不要直接下结论 |
| --- | --- | --- |
| `DNS lookup failed` | 主机名、当前网络、DNS 路径 | 服务器一定离线 |
| `TCP port ... is unreachable` | 本机防火墙、接入网络、路由、端口服务 | 后面的 HTTP 失败是另一个独立故障 |
| `TLS ... failed` | 主机名、设备时间、TLS 配置、证书链 | 证书一定过期 |
| 明确的 `HTTP 4xx/5xx` | 端点是否接受该请求、服务端状态 | 网络完全不通 |
| 通用 `HTTP request failed` | 回看上方最早的 DNS/TCP/TLS 异常 | 已经到达 HTTP 服务 |
| `[SKIP]` | 该项所需命令或端口条件 | 该项已经通过 |

Windows 使用 `HEAD` 请求；macOS/Linux 的 Bash 版本使用普通 `GET`，并且只有在端口为 443 且安装 OpenSSL 时单独检查 TLS。因此两个平台的行数或 HTTP 结果可能不同。

分享结果时只保留系统版本、网络类型、测试时间、公开主机名/端口和 PASS/FAIL/SKIP 摘要。删除解析出的 IP、完整 URL、证书详情、邮箱、订单资料、订阅地址、二维码和令牌。

完整逐行说明见主站：[如何阅读 SNSCDN 网络检查结果](https://snscdn.com/zh-cn/docs/network-check-results?utm_source=github&utm_medium=referral)。

## English

Use this card with `netcheck.sh` and `netcheck.ps1` to identify the first layer that deserves attention. It is not a speed test and does not validate a subscription or client configuration.

| Earliest result | Check first | Do not assume |
| --- | --- | --- |
| `DNS lookup failed` | Hostname, current network, resolver path | The server must be offline |
| `TCP port ... is unreachable` | Local firewall, access network, route, listening service | Every later HTTP failure is independent |
| `TLS ... failed` | Hostname, device clock, TLS setup, certificate chain | The certificate must be expired |
| Explicit `HTTP 4xx/5xx` | Endpoint request rules and service state | The network is completely unreachable |
| Generic `HTTP request failed` | The earliest DNS/TCP/TLS abnormality above | An HTTP response was received |
| `[SKIP]` | Required command or port condition | The skipped check passed |

Windows sends `HEAD`; the Bash version sends a normal `GET` and shows a separate TLS line only for port 443 when OpenSSL is available. The two platforms can therefore produce different line counts or HTTP results.

Before sharing a result, keep only the OS version, network type, test time, public hostname/port, and PASS/FAIL/SKIP summary. Remove resolved IPs, full URLs, certificate details, email, order data, subscription URLs, QR codes, and tokens.

For the complete line-by-line guide, see [How to read SNSCDN network check results](https://snscdn.com/docs/network-check-results?utm_source=github&utm_medium=referral).
