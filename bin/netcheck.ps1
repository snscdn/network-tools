param(
  [Parameter(Position = 0)][string]$Target = "snscdn.com",
  [Parameter(Position = 1)][ValidateRange(1, 65535)][int]$Port = 443
)

$ErrorActionPreference = "Stop"
$HostName = ($Target -replace '^https?://', '').Split('/')[0].Split(':')[0]
if ($HostName -notmatch '^[A-Za-z0-9.-]+$') {
  throw "Target must be a hostname or an HTTP(S) URL."
}

$Failures = 0
function Pass($Message) { Write-Host "[PASS] $Message" -ForegroundColor Green }
function Fail($Message) { Write-Host "[FAIL] $Message" -ForegroundColor Red; $script:Failures++ }

Write-Host "Network check for ${HostName}:$Port`n"

try {
  $Address = [System.Net.Dns]::GetHostAddresses($HostName)[0].IPAddressToString
  Pass "DNS resolved to $Address"
} catch {
  Fail "DNS lookup failed"
}

$Tcp = [System.Net.Sockets.TcpClient]::new()
try {
  $Connection = $Tcp.ConnectAsync($HostName, $Port)
  if (-not $Connection.Wait(5000) -or -not $Tcp.Connected) { throw "timeout" }
  Pass "TCP port $Port is reachable"
} catch {
  Fail "TCP port $Port is unreachable"
} finally {
  $Tcp.Dispose()
}

$Scheme = if ($Port -eq 443) { "https" } else { "http" }
$Uri = "${Scheme}://${HostName}"
if ($Port -notin 80, 443) { $Uri += ":$Port" }

try {
  $Timer = [System.Diagnostics.Stopwatch]::StartNew()
  $Response = Invoke-WebRequest -Uri $Uri -Method Head -TimeoutSec 15 -UseBasicParsing
  $Timer.Stop()
  Pass "HTTP $([int]$Response.StatusCode) in $([math]::Round($Timer.Elapsed.TotalSeconds, 2))s"
} catch {
  Fail "HTTP request failed: $($_.Exception.Message)"
}

Write-Host
if ($Failures -eq 0) {
  Pass "No blocking problem detected"
} else {
  Write-Host "[FAIL] $Failures check(s) need attention" -ForegroundColor Red
}
exit $Failures
