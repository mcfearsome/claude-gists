---
name: loop
description: Autonomously run the desloppify scan-next-fix cycle up to a configurable limit
argument-hint: "<path> [max-iterations]"
allowed-tools:
  - Bash
  - Read
  - Edit
  - Write
  - Glob
  - Grep
  - Agent
---

# Desloppify Autonomous Loop

Run the full desloppify improvement cycle autonomously: scan, pick the next issue, fix it, repeat — up to a maximum number of iterations.

## Arguments

- `<path>` — Required. The codebase path to improve.
- `[max-iterations]` — Optional. Maximum number of fix iterations. Default: 10.

## Steps

1. The user MUST provide a path argument. If no path was provided, ask for one. Do not default to the current working directory. Parse the optional max-iterations argument (default to 10).

2. Ensure desloppify is installed:
   ```bash
   bash $CLAUDE_PLUGIN_ROOT/scripts/ensure-installed.sh full
   ```

3. Run an initial scan to get the baseline score:
   ```bash
   desloppify scan --path <path>
   ```
   Record the starting score.

4. Launch the deslop-fixer agent to autonomously work through issues:
   - Use the Agent tool with subagent_type `deslop:deslop-fixer`
   - Pass it the path and max-iterations in the prompt
   - The agent will handle the scan→next→fix→resolve cycle

5. After the agent completes, run a final scan:
   ```bash
   desloppify scan --path <path>
   ```

6. Present a summary:
   - Starting score vs. ending score
   - Number of issues fixed
   - Any issues that couldn't be fixed
   - Suggest running another loop if issues remain
