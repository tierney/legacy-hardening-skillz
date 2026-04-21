# Autotools Hardening

Modernizing the build system is critical for CI and distribution.

## 1. Clean Distribution (`make distcheck`)
`make distcheck` is the ultimate test of an Autotools repo.
- **Problem**: Missing headers in `EXTRA_DIST` or `iperf_SOURCES`.
- **Symptom**: `fatal error: 'Dataxfer.hpp' file not found` during out-of-tree build.
- **Fix**: Audit all `Makefile.am` files. Ensure all `.h`, `.hpp`, `.sh`, and `.tsv` files are included.

## 2. Robust Testing
- Use `check-local` in the top-level `Makefile.am`.
- Use `$(srcdir)` to refer to test scripts.
- Use `$(top_builddir)` to find the compiled binary.
- This ensures tests run correctly during `make distcheck`.

## 3. Configuration Modernization
- Audit `configure.ac` for obsolete macros (e.g., `AC_TRY_COMPILE`).
- Replace with `AC_COMPILE_IFELSE`.
- Ensure `PTHREAD_CFLAGS` and `PTHREAD_LIBS` are correctly handled via `ACX_PTHREAD`.
