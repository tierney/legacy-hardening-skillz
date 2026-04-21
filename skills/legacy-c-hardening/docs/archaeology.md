# Repository Archaeology

When modernizing a legacy fork, documentation is the first line of defense against breaking benchmark semantics.

## 1. Mapping the Repository
Create a `docs/archaeology/repo_map.md`.
- **Core Logic**: Identify the "engine" (e.g., `src/Dataxfer.cpp`).
- **Control Path**: Identify how settings are parsed and threads are launched (e.g., `src/Settings.cpp`, `src/Launch.cpp`).
- **Protocols**: Map how headers are defined (e.g., `client_hdr`, `UDP_datagram`).

## 2. Tracing Patches
Identify the "Delta" that makes this fork unique.
- Search for specific CLI flags added (e.g., `--reverse`).
- Trace those flags to the core data loops.
- Document the role swap logic (e.g., swapping `data_send` and `data_recv`).

## 3. Toolchain Context
Legacy codebases often assume:
- `bool` is a macro or `int`.
- `snprintf` is missing (providing their own implementation).
- Non-standard `Pthreads` behavior.
Verify that modern C++ compilers don't conflict with these legacy definitions in `headers.h`.
