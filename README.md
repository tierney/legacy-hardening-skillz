# Legacy Hardening Skillz

This repository contains codified **Agentic Skills** for modernizing and hardening legacy software.

## The 3-Level Skill Architecture

We follow a structured pattern to ensure AI agents can discover, activate, and execute complex workflows efficiently.

### Level 1: Discovery (`skill.md` Frontmatter)
Each skill contains YAML metadata. Agents scan these headers to identify the correct tool for a given problem.

### Level 2: Activation (`skill.md` Instructions)
The main body of the `skill.md` file provides high-level logic, workflows, and success criteria for the agent to follow once a skill is activated.

### Level 3: Execution (`docs/` & `tools/`)
Deep reference documentation and automated scripts/tools that the agent invokes for deep audits or behavioral verification.

## Skills Included

### 1. [Legacy C Hardening](skills/legacy-c-hardening/skill.md)
Audit, harden, and document legacy C/C++ network tools. Focuses on security hygiene and behavioral preservation.

### 2. [Legacy Crypto Modernization](skills/legacy-crypto-modernization/skill.md)
Modernize legacy crypto and steganography protocols. Focuses on bit-parity, modern WebCrypto, and robustness benchmarking.
