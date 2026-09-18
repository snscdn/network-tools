# Bidirectional traffic planning / 双向流量估算

[简体中文](#简体中文) · [English](#english)

## 简体中文

节点倍率用于计算套餐流量扣除量，不代表连接速度。估算公式是：

```text
（上传量 + 下载量）× 节点倍率 = 预计扣除流量
```

例如上传 1GB、下载 9GB：

| 节点倍率 | 预计扣除量 |
| --- | ---: |
| 1× | 10GB |
| 2× | 20GB |
| 3× | 30GB |

计算前以当前仪表盘显示的套餐余量和节点倍率为准。比较线路时保持设备、接入网络、目标服务和测试时段尽量一致，一次只改变一个变量。

- [阅读全球网络接入指南](https://snscdn.com/zh-cn/docs/global-network-access?utm_source=github&utm_medium=referral)
- [使用浏览器本地流量计算器](https://snscdn.com/zh-cn/tools/traffic-calculator?utm_source=github&utm_medium=referral)

计算器不会上传或保存输入。不要把订阅地址、二维码、令牌或账户资料填入任何公开工具或 GitHub Issue。

## English

A node multiplier changes estimated quota deduction; it is not a speed rating. Use this formula:

```text
(upload GB + download GB) × node multiplier = estimated deducted GB
```

For 1GB uploaded and 9GB downloaded:

| Node multiplier | Estimated deduction |
| --- | ---: |
| 1× | 10GB |
| 2× | 20GB |
| 3× | 30GB |

Use the current dashboard for the plan balance and node multiplier. When comparing routes, keep the device, access network, destination, and time window consistent, changing one variable at a time.

- [Read the global network access guide](https://snscdn.com/docs/global-network-access?utm_source=github&utm_medium=referral)
- [Use the browser-local traffic calculator](https://snscdn.com/tools/traffic-calculator?utm_source=github&utm_medium=referral)

The calculator does not upload or save entries. Never put a subscription URL, QR code, token, or account data in a public tool or GitHub issue.
