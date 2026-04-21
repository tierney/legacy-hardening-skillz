# Legacy Hardening Skillz

This repository contains codified **Agentic Skills** for modernizing and hardening legacy software.

## The 3-Level Skill Architecture

We follow a structured pattern to ensure AI agents can discover, activate, and execute complex workflows efficiently.

### Level 1: Discovery (`skill.md` Frontmatter)
Each skill contains YAML metadata. Agents scan these headers to identify the correct tool for a given problem.

### Level 2: Activation (`skill.md` Instructions)
The main body of the `skill.md` file provides high-level logic, workflows, and success criteria for the agent to follow once a skill is activated.

### Level 3: Execution (`references/` & `scripts/`)
Deep reference documentation and automated scripts/tools that the agent invokes for deep audits or behavioral verification.

## Usage

To utilize these skills with an agentic AI:
1. **Discovery**: Provide the agent with access to the `skills/` directory.
2. **Activation**: The agent will scan the YAML frontmatter in `skill.md` files to determine which skill matches your request (e.g., "Harden this legacy C repo").
3. **Execution**: The agent follows the phases in `skill.md`, loading deeper context from `references/` and executing tools from `scripts/` as instructed.

## Evaluation & Metrics

Each skill includes an `evals/eval.yaml` file following a unified manifest format:
- **Trigger Accuracy**: Sample prompts to test activation logic.
- **Qualitative Metrics**: Weighted criteria for grading output quality.
- **Automated Checks**: Deterministic shell commands to verify technical success.

To run an evaluation, point your evaluation harness at the `evals/` directory and follow the `automated_checks`.

## Standards Compliance

These skills are designed to be portable and modular, adhering to the **AgentSkills.io** open standard for agentic procedural knowledge.

## Skills Included

### 1. [Legacy C Hardening](skills/legacy-c-hardening/skill.md)
Audit, harden, and document legacy C/C++ network tools. Focuses on security hygiene and behavioral preservation.

### 2. [Legacy Crypto Modernization](skills/legacy-crypto-modernization/skill.md)
Modernize legacy crypto and steganography protocols. Focuses on bit-parity, modern WebCrypto, and robustness benchmarking.
