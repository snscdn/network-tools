# SNSCDN update for 2026-08-28: multilingual help and network troubleshooting

This update improves onboarding, client imports, and connection troubleshooting.
The interface and help content now cover English, Simplified Chinese,
Traditional Chinese, Japanese, Korean, Vietnamese, Persian, and Russian.

## What changed

Each language now includes four practical guides:

1. registration, purchase, and the first connection;
2. choosing a plan, paying, and confirming activation;
3. importing a subscription into a compatible client;
4. troubleshooting connections, protecting the account, and requesting support.

We also released local, open-source diagnostics for DNS, TCP, TLS, and HTTP.
The scripts do not collect or upload results.

## Recommended steps

### 1. Select your language

Sign in to SNSCDN, select a language at the top of the page, and open the
**Knowledge Base**. Start with the quick-start guide.

### 2. Complete the first connection in order

1. [Create an account](https://snscdn.com/register?utm_source=github&utm_medium=article&utm_campaign=site_update_20260828_en) and verify the email address.
2. Choose one plan on the [Plans page](https://snscdn.com/plan?utm_source=github&utm_medium=article&utm_campaign=site_update_20260828_en) and submit one order.
3. Wait for the order to show as completed under **My Orders**.
4. Return to the [Dashboard](https://snscdn.com/dashboard?utm_source=github&utm_medium=article&utm_campaign=site_update_20260828_en) and select **One-click subscription**.
5. Update the subscription in the client, select an available node, and connect.

Activation can take a short time. Repeated imports before the order is complete
will not make activation faster.

### 3. Run a local check if the connection fails

macOS or Linux:

```bash
./bin/netcheck.sh snscdn.com
```

Windows PowerShell:

```powershell
.\bin\netcheck.ps1 snscdn.com
```

- DNS failure: verify the hostname and local resolver.
- TCP failure: check the firewall, route, and service status.
- TLS failure: check system time, the certificate chain, and hostname.
- HTTP 4xx/5xx: the network works, but the web service rejected or failed the request.

### 4. Request support safely

Include the device OS, client name, approximate time, and failed check. Never
post a subscription URL, password, verification code, access token, complete IP
address, or unredacted diagnostic log.

A subscription URL is an access credential. Reset it in the user center only
if exposure is suspected, then import the replacement into your own clients.

## Feedback

Open an issue in this repository for problems with the diagnostic scripts. For
account, order, or subscription help, use the support channel on
[SNSCDN](https://snscdn.com/?utm_source=github&utm_medium=article&utm_campaign=site_update_20260828_en).
