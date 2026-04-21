---
name: legacy-crypto-modernization
description: Modernize legacy crypto and steganography protocols into high-performance, cross-platform core libraries.
author: Matt Tierney
version: 1.1.0
---

# Skill: Legacy Crypto Modernization

This skill enables an agent to modernize "black box" legacy crypto and steganography protocols, ensuring bit-perfect parity and platform portability (TypeScript/Rust/Wasm).

## 1. Discovery Phase
Activate this skill when encountering legacy crypto/steganography code (e.g. Reed-Solomon, Bacchant, Aesthete). Performance is measured according to [Evaluation Metrics](eval.yaml).
- Legacy crypto libraries (SJCL, CryptoJS, custom RC4/XOR).
- Steganography code embedded in UI frameworks (Closure, jQuery).
- Logic that must survive lossy transformations (JPEG, network jitter).

## 2. Activation Workflow

> [!TIP]
> Always load the relevant reference from `references/` before starting a phase to ensure methodology alignment.

### Phase A: Truth Extraction (Golden Vectors)
1. **Load Reference**: Read `references/bit_parity.md`.
2. **Identify Critical Paths**: Locate the exact byte-manipulation functions for encoding/decoding.
3. **Generate Fixtures**: Use the legacy environment to produce a `golden_vectors.json` file containing inputs, secret keys, and expected raw output buffers.
4. **Pin Behavior**: Document protocol-specific constants (e.g., block sizes, symbol thresholds, header magic bytes).

### Phase B: Shared Core Engineering
1. **Language Selection**:
   - **TypeScript**: For immediate browser/web integration.
   - **Rust**: For performance-critical path and edge-proxy (Wasm) deployment.
2. **Implementation**: Port logic while strictly adhering to the "Golden Truth."
3. **Parity Testing**: Implement a test harness that runs the same vectors against both the legacy and new implementations.

### Phase C: Robustness & Resilience
1. **Load Reference**: Read `references/robustness_benchmarking.md`.
2. **Transformation Harness**: Create a benchmarking tool to simulate real-world data degradation (e.g., JPEG recompression).
3. **Success Metrics**: Define "Recovery Rate" (symbols recovered vs. symbols sent).
4. **Optimization**: Adjust codec parameters (thresholds, block sizes) to maximize survival rate on modern social networks.

### Phase D: Platform Integration
1. **Load Reference**: Read `references/webcrypto_migration.md`.
2. **Modern Toolchain**: Use Vite/TSup for TS cores and `wasm-bindgen` for Rust.
3. **Extension Modernization**: Migrate from MV2 to MV3, using the shared core as a local workspace dependency.
4. **UI/UX Excellence**: Implement high-end reveal animations (Glassmorphism, blurs) to "wow" the user on first reveal.

## 3. References (Level 3)
- [Bit-Parity Engineering Guide](references/bit_parity.md)
- [Robustness Benchmarking](references/robustness_benchmarking.md)
- [Modern Crypto Migration (WebCrypto)](references/webcrypto_migration.md)

## 4. Scripts (Level 3)
- [Golden Vector Schema](scripts/golden_vector_schema.json)
- [Parity Verifier](scripts/verify_parity.ts)
- [Robustness Sweep](scripts/robustness_sweep.py)
