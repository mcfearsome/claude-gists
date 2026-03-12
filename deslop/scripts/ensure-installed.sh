#!/usr/bin/env bash
set -euo pipefail

# Ensure desloppify is installed and up-to-date.
# Usage: ensure-installed.sh [extras]
# Examples:
#   ensure-installed.sh          # installs desloppify (no extras)
#   ensure-installed.sh full     # installs desloppify[full]
#   ensure-installed.sh treesitter,python-security

EXTRAS="${1:-}"

if command -v desloppify &>/dev/null; then
  echo "desloppify is already installed: $(desloppify --version 2>/dev/null || echo 'unknown version')"
  echo "Upgrading..."
else
  echo "desloppify not found. Installing..."
fi

if [ -n "$EXTRAS" ]; then
  pip3 install --upgrade "desloppify[$EXTRAS]"
else
  pip3 install --upgrade desloppify
fi

echo "Running update-skill for claude..."
desloppify update-skill claude

echo "Done."
