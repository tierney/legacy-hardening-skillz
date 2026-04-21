# Kernel Port Provenance

Many high-performance C libraries in userspace are historical "grubs" or "ports" from the Linux kernel (e.g., Reed-Solomon, CRC32, Lists, Red-Black Trees). Hardening these requires careful archaeology to respect licensing and authorship.

## 1. Upstream Identification
The goal is to find the exact historical upstream base.

### Patterns to look for:
- **File Headers**: Look for `Copyright (C) ... Thomas Gleixner` or similar kernel maintainers.
- **IDs**: Look for CVS/Git tags like `$Id: rslib.c,v 1.7 2005/11/07 ... $`.
- **Logic Patterns**: Compare the core loops against `lib/` and `include/linux/` in the kernel tree.

### Tools:
- Use web search for specific function names + "kernel".
- Browse [git.kernel.org](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/) to match versions by date.

## 2. Licensing (The "GPL Trap")
Code derived from the Linux kernel is almost always **GPL-2.0-only**.

### Actions:
1. **Audit `COPYING`**: Ensure it doesn't mistakenly claim GPL-3.0 or MIT if it contains kernel logic.
2. **SPDX Headers**: Add `/* SPDX-License-Identifier: GPL-2.0-only */` to all derived files.
3. **Attribution**: Do NOT remove original author names. Add your name as a "Userspace Port Maintainer" instead.

## 3. The Backporting Methodology
Once the upstream version is identified (e.g., 2.6.14), compare it against modern HEAD.

### What to backport:
- **Safety**: Added NULL checks in `free()` or `init()` functions.
- **Robustness**: Improved sanity checks (e.g., syndrome verification).
- **Toolchain fixes**: Modernized `container_of` macros using `__extension__` to suppress warnings.

### What NOT to backport:
- **Architectural Changes**: Don't change the API signature if it breaks downstream users (like Cryptagram).
- **Kernel-only APIs**: Don't import `kmalloc` or `printk`. Use `malloc` and `fprintf`.

By formalizing provenance, the library becomes a first-class citizen of the open-source ecosystem again.
