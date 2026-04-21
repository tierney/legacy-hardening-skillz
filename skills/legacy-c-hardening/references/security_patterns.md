# Security Patterns for Legacy C

Common patterns for hardening 1990s-era C code against modern compiler warnings and vulnerabilities.

## 1. `-Wformat-security`
Legacy code often passes variables directly to `printf` or `fprintf`.

**Unsafe**:
```c
fprintf(stderr, mSettings->mHost);
```

**Safe**:
```c
fprintf(stderr, "%s", mSettings->mHost);
```

**Why**: If `mSettings->mHost` contains `%x %x %x`, it can leak stack data or trigger a crash.

## 2. Integer Overflows
Check bandwidth and byte count calculations.
- Ensure `int` is not used for byte counts exceeding 2GB.
- Use `max_size_t` or `long long`.
- Audit `ntohl`/`htonl` for correct byte order on all packet headers.

## 3. Buffer Audits
- Check `inet_ntop` calls.
- Destination buffer should be `REPORT_ADDRLEN` or `INET6_ADDRSTRLEN`.
- Ensure no `sprintf` usage on untrusted strings; use `snprintf` if available.
- If `snprintf` is missing in the OS but provided by the `compat` layer, ensure the `compat` header is included.
