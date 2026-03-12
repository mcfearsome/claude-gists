---
name: scan
description: Run desloppify scan on a codebase to get a quality score and identify issues
argument-hint: "<path>"
allowed-tools:
  - Bash
  - Read
---

# Desloppify Scan

Run a desloppify scan on the specified path to analyze code quality.

## Steps

1. The user MUST provide a path argument. If no path was provided, ask for one. Do not default to the current working directory.

2. Ensure desloppify is installed:
   ```bash
   bash $CLAUDE_PLUGIN_ROOT/scripts/ensure-installed.sh full
   ```

3. Run the scan:
   ```bash
   desloppify scan --path <path>
   ```

4. Present the results to the user:
   - Overall quality score
   - Summary of issues found (grouped by category if possible)
   - Suggest running `/deslop:next <path>` to start fixing issues
