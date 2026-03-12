---
description: Get the next prioritized desloppify issue and optionally fix it
argument-hint: "<path>"
allowed-tools:
  - Bash
  - Read
  - Edit
  - Write
  - Glob
  - Grep
---

# Desloppify Next Issue

Retrieve the next prioritized issue from the desloppify queue and offer to fix it.

## Steps

1. The user MUST provide a path argument. If no path was provided, ask for one. Do not default to the current working directory.

2. Ensure desloppify is installed:
   ```bash
   bash $CLAUDE_PLUGIN_ROOT/scripts/ensure-installed.sh full
   ```

3. Get the next issue:
   ```bash
   desloppify next --path <path>
   ```

4. Present the issue clearly:
   - What the issue is
   - Where it is (file and location)
   - Why it matters
   - Suggested approach to fix

5. Ask the user: **"Would you like me to fix this now?"**

6. If the user says yes:
   - Read the relevant file(s)
   - Implement the fix using Edit/Write tools
   - Show what you changed and why
   - Run `desloppify scan --path <path>` again to verify the score improved

7. If the user says no, let them know they can come back with `/deslop:next <path>` anytime.
