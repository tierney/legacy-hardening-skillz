# Modern Crypto Migration (WebCrypto)

When moving from legacy libraries (CryptoJS, SJCL) to modern browser standards, use the WebCrypto API for hardware-accelerated, secure operations.

## 1. Algorithm Mapping
- **AES-CBC**: Use `SubtleCrypto.decrypt` with `AES-CBC` params.
- **SHA-256**: Use `SubtleCrypto.digest`.
- **PBKDF2**: Use `SubtleCrypto.importKey` then `deriveKey`.

## 2. Browser Extensions (MV3)
Manifest V3 requires all crypto logic to be local. The shared core should be bundled into the background service worker.

## 3. Performance
For high-throughput requirements (e.g., real-time video decoding), consider using **Rust + Wasm** for the core loop while keeping the key management in WebCrypto.
