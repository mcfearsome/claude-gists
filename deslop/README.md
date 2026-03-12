# deslop

Claude Code plugin for [desloppify](https://github.com/peteromallet/desloppify) — AI-powered codebase quality scoring and iterative improvement.

## What it does

Wraps the `desloppify` CLI into Claude Code commands, an autonomous agent, and a post-task hook so you can scan, score, and fix code quality issues without leaving your conversation.

## Prerequisites

- Python 3.11+
- `pip3` available on your system PATH

The plugin will install/upgrade desloppify automatically when needed.

## Installation

### From marketplace

```
claude install-plugin mcfearsome/cc-marketplace --name deslop
```

### Local development

```
claude --plugin-dir /path/to/claude-gists/deslop
```

## Commands

| Command | Description |
|---------|-------------|
| `/deslop:setup` | Install or upgrade desloppify, choose extras, configure for Claude |
| `/deslop:scan <path>` | Scan a codebase and get a quality score |
| `/deslop:next <path>` | Get the next prioritized issue and optionally fix it |
| `/deslop:loop <path> [N]` | Autonomously fix up to N issues (default: 10) |

### Examples

```
/deslop:scan ~/projects/my-app
/deslop:next ~/projects/my-app
/deslop:loop ~/projects/my-app 5
```

**Note:** Path is always required — the plugin does not default to the current working directory.

## Agent

**deslop-fixer** triggers proactively when:
- You've just written a lot of code and mention it's rough or needs cleanup
- You ask Claude to clean up or improve code quality
- You mention desloppify directly

It runs THE LOOP autonomously: scan → next issue → fix → repeat, up to the iteration limit.

## Hook

A `Stop` hook suggests running `/deslop:scan` after tasks where significant code was written or modified. It stays quiet for minor changes like config tweaks or docs.

## Extras

When running `/deslop:setup`, you can choose which desloppify extras to install:

| Extra | What it adds |
|-------|-------------|
| `full` | Everything below (recommended) |
| `treesitter` | Language parsing via tree-sitter |
| `python-security` | Bandit vulnerability scanning |
| `scorecard` | Image generation for score badges |
| `plan-yaml` | YAML support for plans |
