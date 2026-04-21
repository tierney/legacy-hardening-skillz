# Bit-Parity Engineering Guide

When modernizing cryptography or steganography, the "black box" behavior of the legacy system is your only source of truth. You must ensure bit-identical results before optimizing.

## 1. Creating the Golden Vector
A "Golden Vector" is a snapshot of legacy state. It should include:
- `id`: Unique case identifier.
- `input`: The raw data/image before transformation.
- `key`: The password/salt/iv used.
- `expected_output`: The exact byte-buffer produced by the legacy system.
- `metadata`: Dimensions, codec versions, and timestamps.

## 2. Parity Testing Strategy
1. **The Baseline**: Run the legacy code (e.g., using a Python wrapper or a headless browser) to populate the vector.
2. **The Modern implementation**: Implement the same logic in your target language (TS/Rust).
3. **The Validator**:
   - Convert both outputs to Hex or Base64 for comparison.
   - Use specialized test matchers to show the exact index of the first differing bit.

## 3. Common Pitfalls
- **Endianness**: Verify if the legacy system was little-endian vs big-endian.
- **Encoding Differences**: Legacy JS often uses UTF-16 strings for binary data; modern TS should use `Uint8Array`.
- **Rounding Errors**: Steganography often involves floats; ensure the rounding logic (e.g., `Math.round` vs `Math.floor`) matches exactly.
