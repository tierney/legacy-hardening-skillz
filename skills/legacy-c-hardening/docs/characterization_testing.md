# Characterization Testing
 
When modernizing an algorithmic engine (FEC, Crypto, Math), "just passing tests" is insufficient. You must ensure bit-for-bit parity with the legacy behavior before applying fixes.

## 1. Golden Vectors (Deterministic Pinning)
Golden vectors are static hex-level representations of input and the corresponding correct output.

### Why use them?
- **Regression Guard**: They ensure that build system changes or compiler updates don't change the algorithm.
- **Independence**: They don't rely on the current codebase's logic (which might be what you're trying to fix).
- **Auditability**: Hex data is easy to compare across different implementations (e.g., C vs. Python vs. Verilog).

### How to generate:
Use the `gen_golden_vector.py` tool or a simple C harness to output hex data:
```c
/* Example of a golden vector check */
uint8_t input[] = { 0x00, 0x01, 0x02 ... };
uint8_t expected[] = { 0xAA, 0xBB, 0xCC ... };
// ... run logic ...
assert(memcmp(output, expected, size) == 0);
```

## 2. Property-Based Randomized Testing
Once deterministic vectors pass, use randomized tests to explore the boundaries.

### The Methodology:
1. **Identify Invariants**: For Reed-Solomon, the invariant is that any error pattern $\le T$ errors must be corrected to the original payload.
2. **Inject Randomness**: Generate random payloads and inject random errors/erasures within known limits.
3. **Scale**: Run thousands of iterations (10k+) to find edge cases in the logic (e.g., Berlekamp-Massey corner cases).
4. **Failure Analysis**: Log the seed and input data for any failure to enable deterministic reproduction.

## 3. Verification Matrix
Maintain a matrix of "Historical vs. Modern" behavior:
| Case | Legacy Result | Modern Result | Status |
|------|---------------|---------------|--------|
| Correctable Error | Corrected | Corrected | PASS |
| Uncorrectable | False Positive | -EBADMSG | IMPROVED |

By following this approach, the agent provides proof of "High Quality" modernization.
