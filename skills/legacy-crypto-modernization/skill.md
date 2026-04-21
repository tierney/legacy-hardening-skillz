---
name: legacy-crypto-modernization
description: Modernize legacy crypto and steganography protocols into high-performance, cross-platform core libraries.
author: Michael Tierney
version: 1.0.0
---

# Skill: Legacy Crypto Modernization

This skill enables an agent to modernize "black box" legacy crypto and steganography protocols, ensuring bit-perfect parity and platform portability (TypeScript/Rust/Wasm).

## 1. Discovery Phase
Activate this skill when encountering:
- Legacy crypto libraries (SJCL, CryptoJS, custom RC4/XOR).
- Steganography code embedded in UI frameworks (Closure, jQuery).
- Logic that must survive lossy transformations (JPEG, network jitter).

## 2. Activation Workflow

### Phase A: Truth Extraction (Golden Vectors)
1. **Identify Critical Paths**: Locate the exact byte-manipulation functions for encoding/decoding.
2. **Generate Fixtures**: Use the legacy environment to produce a `golden_vectors.json` file containing inputs, secret keys, and expected raw output buffers.
3. **Pin Behavior**: Document protocol-specific constants (e.g., block sizes, symbol thresholds, header magic bytes).

### Phase B: Shared Core Engineering
1. **Language Selection**:
   - **TypeScript**: For immediate browser/web integration.
   - **Rust**: For performance-critical path and edge-proxy (Wasm) deployment.
2. **Implementation**: Port logic while strictly adhering to the "Golden Truth."
3. **Parity Testing**: Implement a test harness that runs the same vectors against both the legacy and new implementations.

### Phase C: Robustness & Resilience
1. **Transformation Harness**: Create a benchmarking tool to simulate real-world data degradation (e.g., JPEG recompression).
2. **Success Metrics**: Define "Recovery Rate" (symbols recovered vs. symbols sent).
3. **Optimization**: Adjust codec parameters (thresholds, block sizes) to maximize survival rate on modern social networks.

### Phase D: Platform Integration
1. **Modern Toolchain**: Use Vite/TSup for TS cores and `wasm-bindgen` for Rust.
2. **Extension Modernization**: Migrate from MV2 to MV3, using the shared core as a local workspace dependency.
3. **UI/UX Excellence**: Implement high-end reveal animations (Glassmorphism, blurs) to "wow" the user on first reveal.

## 3. References (Level 3)
- [Bit-Parity Engineering Guide](docs/bit_parity.md)
- [Robustness Benchmarking](docs/robustness_benchmarking.md)
- [Modern Crypto Migration (WebCrypto)](docs/webcrypto_migration.md)

## 4. Tools (Level 3)
- [Golden Vector Schema](tools/golden_vector_schema.json)
- [Parity Verifier](tools/verify_parity.ts)
- [Robustness Sweep](tools/robustness_sweep.py)
