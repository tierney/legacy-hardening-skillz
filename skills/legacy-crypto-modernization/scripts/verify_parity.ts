/**
 * verify_parity.ts
 * Utility to compare modern implementation results against legacy golden vectors.
 */

import * as fs from 'fs';

interface GoldenVector {
  id: string;
  input: string; // Base64
  key?: string;  // Base64
  expected_output: string; // Base64
  metadata?: any;
}

/**
 * Base64 to Uint8Array helper
 */
function base64ToBytes(base64: string): Uint8Array {
  const binaryString = atob(base64);
  const bytes = new Uint8Array(binaryString.length);
  for (let i = 0; i < binaryString.length; i++) {
    bytes[i] = binaryString.charCodeAt(i);
  }
  return bytes;
}

/**
 * Main parity check function
 * @param vectorPath Path to the golden_vectors.json
 * @param modernImpl Function that takes input/key and returns result
 */
export async function verifyParity(
  vectorPath: string,
  modernImpl: (input: Uint8Array, key?: Uint8Array, metadata?: any) => Promise<Uint8Array>
) {
  const vectors: GoldenVector[] = JSON.parse(fs.readFileSync(vectorPath, 'utf-8'));

  for (const vector of vectors) {
    console.log(`Checking case: ${vector.id}...`);
    
    const input = base64ToBytes(vector.input);
    const key = vector.key ? base64ToBytes(vector.key) : undefined;
    const expected = base64ToBytes(vector.expected_output);
    
    const result = await modernImpl(input, key, vector.metadata);
    
    if (result.length !== expected.length) {
      throw new Error(`Length mismatch for ${vector.id}: Expected ${expected.length}, got ${result.length}`);
    }
    
    for (let i = 0; i < result.length; i++) {
      if (result[i] !== expected[i]) {
        throw new Error(`Bit mismatch at index ${i} for ${vector.id}: Expected 0x${expected[i].toString(16)}, got 0x${result[i].toString(16)}`);
      }
    }
    
    console.log(`[PASS] ${vector.id}`);
  }
  
  console.log("All parity checks PASSED.");
}
