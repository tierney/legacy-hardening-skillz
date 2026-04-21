---
name: legacy-c-hardening
description: Audit, harden, and document legacy C/C++ network tools using Autotools.
author: Matt Tierney
version: 1.1.0
---

# Skill: Legacy C Hardening

This skill enables an agent to perform "repository archaeology" and "hardening" on 1990s/2000s-era C codebases using Autotools.

## 1. Discovery Phase
When an agent encounters a repository with a `configure.ac` and multiple `.c`/`.cpp` files with legacy headers, it should activate this skill to ensure behavioral preservation.

## 2. Activation Workflow

> [!TIP]
> Always load the relevant reference from `references/` before starting a phase to ensure methodology alignment.

### Phase A: Repository Archaeology
1. **Load Reference**: Read `references/archaeology.md` for mapping patterns.
2. **Repo Map**: Create a logical map of the source tree.
3. **Build Map**: Trace the Autotools flow and identify critical generated files.
4. **Patch Map**: Locate and document any historical patches (e.g., the reverse-NAT patch).

### Phase B: Hardening
1. **Load Reference**: Read `references/autotools_hardening.md` and `references/security_patterns.md`.
2. **Security Audit**: Scan for and fix `-Wformat-security` (printf/fprintf calls using variables directly).
3. **Build Audit**: Ensure `make distcheck` passes. Fix missing headers or distributed files.
4. **Hygiene**: Fix `bool` macro conflicts and modern C++ toolchain incompatibilities.

### Phase C: Verification
1. **Load Reference**: Read `references/characterization_testing.md`.
2. **Characterization**: Create a suite of deterministic "Golden Vectors" (hex-level input/output pairs) to pin down the existing logic.
3. **Property Testing**: Implement randomized stress tests to explore the algorithm's state space (e.g., error injection up to correction capacity).
4. **Comparison Matrix**: Build a `.tsv` of cases comparing legacy behavior against a modern upstream.

### Phase D: Upstream Synchronization
1. **Load Reference**: Read `references/kernel_port_provenance.md`.
2. **Source Mapping**: Identify the historical upstream version/commit (e.g., Linux 2.6.14) to confirm provenance.
3. **Safety Backports**: Review modern versions of the upstream for targeted robustness fixes (e.g., syndrome verification, NULL checks) that preserve the legacy API signature.
4. **Legal Audit**: Align `COPYING` and SPDX-License-Identifier headers with the legally required upstream license.

## 3. References (Level 3)
- [Archaeology Guide](references/archaeology.md)
- [Kernel Port Provenance](references/kernel_port_provenance.md)
- [Characterization Testing](references/characterization_testing.md)
- [Autotools Hardening](references/autotools_hardening.md)
- [Security Patterns](references/security_patterns.md)

## 4. Scripts (Level 3)
- [Distribution Checker](scripts/check_dist.sh)
- [Golden Vector Generator](scripts/gen_golden_vector.py)
- [Matrix Runner](scripts/matrix_harness.py)
