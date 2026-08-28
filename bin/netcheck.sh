#!/usr/bin/env bash

set -u

target="${1:-snscdn.com}"
port="${2:-443}"
host="${target#*://}"
host="${host%%/*}"
host="${host%%:*}"

if ! [[ "$host" =~ ^[A-Za-z0-9.-]+$ && "$port" =~ ^[0-9]+$ ]] ||
  [ "$port" -lt 1 ] || [ "$port" -gt 65535 ]; then
  echo "Usage: $0 <hostname-or-url> [port]" >&2
  exit 2
fi

failures=0

pass() { printf '[PASS] %s\n' "$*"; }
fail() { printf '[FAIL] %s\n' "$*"; failures=$((failures + 1)); }
skip() { printf '[SKIP] %s\n' "$*"; }

printf 'Network check for %s:%s\n\n' "$host" "$port"

if command -v getent >/dev/null 2>&1; then
  dns="$(getent ahosts "$host" 2>/dev/null | awk 'NR == 1 { print $1 }')"
elif command -v dscacheutil >/dev/null 2>&1; then
  dns="$(dscacheutil -q host -a name "$host" 2>/dev/null | awk '/ip_address:/ { print $2; exit }')"
elif command -v nslookup >/dev/null 2>&1; then
  dns="$(nslookup "$host" 2>/dev/null | awk '/^Address: / { print $2; exit }')"
else
  dns=""
  skip "DNS check: no supported resolver command found"
fi

if [ -n "${dns:-}" ]; then
  pass "DNS resolved to $dns"
elif [ -n "${dns+x}" ]; then
  fail "DNS lookup failed"
fi

if command -v nc >/dev/null 2>&1; then
  if nc -z -w 5 "$host" "$port" >/dev/null 2>&1; then
    pass "TCP port $port is reachable"
  else
    fail "TCP port $port is unreachable"
  fi
else
  skip "TCP check: nc is not installed"
fi

if [ "$port" = "443" ] && command -v openssl >/dev/null 2>&1; then
  certificate="$(openssl s_client -connect "$host:$port" -servername "$host" </dev/null 2>/dev/null | openssl x509 -noout -subject -issuer -dates 2>/dev/null)"
  if [ -n "$certificate" ]; then
    pass "TLS certificate received"
    printf '%s\n' "$certificate" | sed 's/^/       /'
  else
    fail "TLS handshake or certificate check failed"
  fi
else
  skip "TLS check: requires port 443 and openssl"
fi

if command -v curl >/dev/null 2>&1; then
  scheme="http"
  [ "$port" = "443" ] && scheme="https"
  url="$scheme://$host"
  [ "$port" != "80" ] && [ "$port" != "443" ] && url="$url:$port"
  http="$(curl -sS -o /dev/null -w '%{http_code} in %{time_total}s' --connect-timeout 5 --max-time 15 "$url" 2>/dev/null)"
  case "$http" in
    2*|3*) pass "HTTP $http" ;;
    000*) fail "HTTP request failed" ;;
    *) fail "HTTP $http" ;;
  esac
else
  skip "HTTP check: curl is not installed"
fi

printf '\n'
if [ "$failures" -eq 0 ]; then
  pass "No blocking problem detected"
else
  printf '[FAIL] %s check(s) need attention\n' "$failures"
fi

exit "$failures"
