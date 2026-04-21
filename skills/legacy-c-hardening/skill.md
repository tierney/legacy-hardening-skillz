---
name: legacy-c-hardening
description: Audit, harden, and document legacy iperf2-era C/C++ repositories.
author: Michael Tierney
version: 1.0.0
---

# Skill: Legacy C Hardening

This skill enables an agent to perform "repository archaeology" and "hardening" on 1990s/2000s-era C codebases using Autotools.

## 1. Discovery Phase
When an agent encounters a repository with a `configure.ac` and multiple `.c`/`.cpp` files with legacy headers, it should activate this skill to ensure behavioral preservation.

## 2. Activation Workflow

### Phase A: Repository Archaeology
1. **Repo Map**: Create a logical map of the source tree.
2. **Build Map**: Trace the Autotools flow and identify critical generated files.
3. **Patch Map**: Locate and document any historical patches (e.g., the reverse-NAT patch).

### Phase B: Hardening
1. **Security Audit**: Scan for and fix `-Wformat-security` (printf/fprintf calls using variables directly).
2. **Build Audit**: Ensure `make distcheck` passes. Fix missing headers or distributed files.
3. **Hygiene**: Fix `bool` macro conflicts and modern C++ toolchain incompatibilities.

### Phase C: Verification
1. **Comparison Matrix**: Build a `.tsv` of cases comparing legacy behavior against a modern upstream (e.g., `iperf3`).
2. **Harness**: Create a script to run both binaries and verify parity.

## 3. References (Level 3)
- [Archaeology Guide](docs/archaeology.md)
- [Autotools Hardening](docs/autotools_hardening.md)
- [Security Patterns](docs/security_patterns.md)

## 4. Tools (Level 3)
- [Distribution Checker](tools/check_dist.sh)
- [Matrix Runner](tools/matrix_harness.py)
