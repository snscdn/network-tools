# Plan selection worksheet / 套餐选择工作表

This worksheet turns seven days of real traffic into a plan estimate. It does
not upload or store any data, and it does not replace the amount and terms
shown at checkout.

这份工作表把 7 天真实用量换算成套餐需求。它不会上传或保存数据，也不能
替代结账页显示的金额与条款。

## English

### 1. Measure by multiplier

Record download and upload traffic separately for each multiplier you actually
used. A multiplier changes traffic deduction, not connection speed.

| Node multiplier | Download (GB) | Upload (GB) | Charged traffic |
| --- | ---: | ---: | ---: |
| 1× |  |  | `(download + upload) × 1` |
| 2× |  |  | `(download + upload) × 2` |
| 3× |  |  | `(download + upload) × 3` |

Add the three charged-traffic values, then estimate a month:

```text
monthly estimate = observed charged traffic ÷ observed days × 30
safe allowance   = monthly estimate × 1.25
```

The 25% margin covers normal variation, background updates, cloud sync, and
video buffering. Increase it only when your use is unusually volatile.

### 2. Check the plan rules

Before paying, verify all six items on the live plan page or checkout:

1. traffic allowance and whether both directions are counted;
2. reset schedule and total validity;
3. available billing period and final amount due;
4. speed and device limits;
5. whether you are renewing the same plan or replacing it;
6. support, refund, privacy, and credential-safety boundaries.

For uncertain usage, a smaller monthly option provides a cleaner first
measurement. A longer-duration bundle can fit uneven usage only when its total
allowance, expiry, and reset rule match your calculation.

### 3. After a completed order

- Confirm the order is completed before changing the client.
- Update the existing remote subscription first; re-import only when needed.
- Never paste a complete subscription URL, QR code, password, or verification
  code into a public issue or calculator.

Use the [live plan comparison](https://snscdn.com/pricing?utm_source=github&utm_medium=referral&utm_campaign=20260920_plan_selection_checklist),
the [browser-local traffic calculator](https://snscdn.com/tools/traffic-calculator?utm_source=github&utm_medium=referral&utm_campaign=20260920_plan_selection_checklist),
or the [purchase and activation guide](https://snscdn.com/docs/purchase?utm_source=github&utm_medium=referral&utm_campaign=20260920_plan_selection_checklist).

## 简体中文

### 1. 按倍率记录用量

把实际使用过的不同倍率分别记录下载和上传流量。倍率只改变流量扣除，
不代表连接速度。

| 节点倍率 | 下载（GB） | 上传（GB） | 账户扣量 |
| --- | ---: | ---: | ---: |
| 1× |  |  | `（下载 + 上传）× 1` |
| 2× |  |  | `（下载 + 上传）× 2` |
| 3× |  |  | `（下载 + 上传）× 3` |

先把三档扣量相加，再换算一个月：

```text
月度估算 = 观察期扣量 ÷ 观察天数 × 30
建议额度 = 月度估算 × 1.25
```

25% 余量用于覆盖正常波动、系统更新、云同步和视频缓冲。只有在用量波动
明显更大时，才需要继续提高余量。

### 2. 核对套餐规则

付款前，在实时套餐页或结账页核对六项：

1. 流量额度以及是否双向计费；
2. 重置规则和总有效期；
3. 可选付款周期和最终应付金额；
4. 速率与设备数限制；
5. 当前操作属于同套餐续费还是换套餐；
6. 客服、退款、隐私和凭据安全边界。

用量还不确定时，较小的月付套餐更便于完成第一轮真实测量。用量不均匀时，
只有长期流量包的总额度、有效期和重置规则都符合计算结果，才适合选择。

### 3. 订单完成之后

- 先确认订单已经完成，再处理客户端。
- 优先更新现有远程订阅；确有需要时再重新导入。
- 不要把完整订阅地址、二维码、密码或验证码粘贴到公开 Issue 或计算器。

可继续查看[实时套餐对比](https://snscdn.com/zh-cn/pricing?utm_source=github&utm_medium=referral&utm_campaign=20260920_plan_selection_checklist)、
[浏览器本地流量计算器](https://snscdn.com/zh-cn/tools/traffic-calculator?utm_source=github&utm_medium=referral&utm_campaign=20260920_plan_selection_checklist)
和[购买及开通指南](https://snscdn.com/zh-cn/docs/purchase?utm_source=github&utm_medium=referral&utm_campaign=20260920_plan_selection_checklist)。
