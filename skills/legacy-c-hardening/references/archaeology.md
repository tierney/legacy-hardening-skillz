# Repository Archaeology

When modernizing a legacy fork, documentation is the first line of defense against breaking benchmark semantics.

## 1. Mapping the Repository (Generic Pattern)
Create a `references/archaeology/repo_map.md`.
- **Core Logic**: Identify the "engine" that performs the primary data processing.
- **Control Path**: Identify how settings are parsed, resources are initialized, and execution is launched.
- **Protocols/Data Structures**: Map how binary headers or core state structures are defined.

> [!NOTE]
> **Example (iperf2)**:
> - **Core Logic**: `src/Dataxfer.cpp` (The transfer loop).
> - **Control Path**: `src/Settings.cpp` (CLI parsing) and `src/Launch.cpp` (Thread management).
> - **Protocols**: `client_hdr` and `UDP_datagram` structures in `headers.h`.

## 2. Tracing Patches
Identify the "Delta" that makes this fork unique.
- Search for specific CLI flags added by the fork.
- Trace those flags to the core data loops.
- Document the functional changes (e.g., role swapping, extra logging).

## 3. Toolchain Context
Legacy codebases often assume older standards:
- `bool` might be a macro or `int`.
- `snprintf` or `stdint.h` might be missing.
- Non-standard `Pthreads` or `WinSock` behavior.

Verify that modern compilers don't conflict with these legacy definitions in your global headers.
