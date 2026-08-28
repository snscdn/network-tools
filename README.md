# SNSCDN Network Tools

[简体中文](README.zh-CN.md)

Small, dependency-light network checks for DNS, TCP, TLS, and HTTP problems.
The tools run locally and do not collect or upload results.

## Latest update

- [2026-08-28: Multilingual help center and network troubleshooting guide](docs/2026-08-28-site-update.md)
- [中文版：多语言帮助中心与网络排障指南](docs/2026-08-28-site-update.zh-CN.md)

## Quick start

macOS or Linux:

```bash
bash bin/netcheck.sh example.com
bash bin/netcheck.sh example.com 443
```

Windows PowerShell:

```powershell
.\bin\netcheck.ps1 example.com
.\bin\netcheck.ps1 example.com 443
```

Exit code `0` means no blocking problem was detected. A non-zero exit code is
the number of failed checks, so the scripts also work in simple monitoring and
support workflows.

## What it checks

| Check | macOS/Linux | Windows |
| --- | --- | --- |
| DNS resolution | Yes | Yes |
| TCP connectivity | Yes | Yes |
| TLS certificate details | Yes, with OpenSSL | — |
| HTTP status and response time | Yes, with curl | Yes |

These checks diagnose connectivity; they do not benchmark throughput or prove
that an application is configured correctly.

## Common results

- `DNS lookup failed`: try another resolver and verify the hostname.
- `TCP port ... is unreachable`: check the firewall, service, and route.
- `TLS ... failed`: check the certificate chain, hostname, and system time.
- `HTTP 4xx/5xx`: connectivity works, but the web service rejected or failed
  the request.

## Connectivity service

Need a managed global connectivity service? Visit
[SNSCDN](https://snscdn.com/?utm_source=github&utm_medium=readme&utm_campaign=network_tools)
or [create an account](https://snscdn.com/register?utm_source=github&utm_medium=readme&utm_campaign=network_tools).

## Contributing and security

Issues and small pull requests are welcome. Do not post IP addresses, access
tokens, subscription URLs, or complete diagnostic logs in public issues. See
[SECURITY.md](SECURITY.md) for private vulnerability reporting guidance.

## License

[MIT](LICENSE)
