---
name: deslop:setup
description: Install or upgrade desloppify and configure it for Claude Code
argument-hint: "[extras]"
allowed-tools:
  - Bash
  - Read
---

# Desloppify Setup

Install or upgrade the desloppify code quality tool and configure it for use with Claude Code.

## Steps

1. Ask the user which extras they want to install. Present these options:
   - `full` — All optional dependencies (recommended)
   - `treesitter` — Language parsing via tree-sitter
   - `python-security` — Bandit integration for Python vulnerability scanning
   - `scorecard` — Image generation for scorecard badges
   - `plan-yaml` — YAML support for plans
   - *none* — Base package only

2. Run the install script:
   ```bash
   bash $CLAUDE_PLUGIN_ROOT/scripts/ensure-installed.sh <chosen-extras>
   ```
   If the user chose no extras, omit the argument.

3. Confirm the installation succeeded by running:
   ```bash
   desloppify --version
   ```

4. Let the user know desloppify is ready and suggest running `/deslop:scan <path>` to analyze their codebase.
