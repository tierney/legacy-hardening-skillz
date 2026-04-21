# Robustness Benchmarking

Steganography and legacy crypto protocols often fail when data is subjected to lossy transformations. This guide defines how to benchmark recovery limits.

## 1. Defining the Threat Model
- **Lossy Compression**: JPEG, WebP, AVIF.
- **Resizing**: Downscaling/upscaling artifacts.
- **Noise**: Gaussian noise, salt-and-pepper noise.
- **Protocol Jitter**: Dropped packets, out-of-order delivery.

## 2. The Sweep Methodology
Use `scripts/robustness_sweep.py` to automate the testing of a codec across a range of degradation levels.

## 3. Success Metrics
- **Bit Error Rate (BER)**: Number of incorrect bits / Total bits.
- **Symbol Recovery Rate**: Percentage of protocol symbols correctly decoded.
- **Visual Transparency**: PSNR or SSIM metrics for the carrier medium.
