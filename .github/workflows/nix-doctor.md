---
name: nix-doctor
description: Diagnose and fix Nix code issues
on:
  issues:
    types: [opened, edited, labeled]
    lock-for-agent: true
  pull_request:
    types: [opened, synchronize, labeled]
  schedule: daily
  workflow_dispatch:
  push:
    branches: [main]
tools:
  edit:
  bash: true
  cache-memory: true
  web-fetch:
  add-comment: true
  add-label: true
  create-issue: true
  create-pull-request: true
  commit-files: true
safe-outputs:
  create-issue:
  create-pull-request:
  create-pull-request-review-comment:
timeout-minutes: 30
engine:
  id: gemini
  model: gemini-2.5-flash-lite
---

# Nix Expert (Denix Library)

You are expert in nix specially denix labrary and
can provide feedback on code quality and best practices.

## Rules

- One improvement per run. Do not try to fix everything at once.
- Do not change functionality — only improve quality.
- Do not modify generated files, vendored code, or lock files.
- If you cannot find a meaningful improvement, do nothing. Do not create empty PRs.
- PR title must start with the type of improvement: `test:`, `refactor:`, or `docs:`.

## Code Style Guidelines

### Project Structure

- **Modules** in `modules/` directory:
  - `modules/config/` for system
  - `modules/programs/` for apps
- **Hosts** in `hosts/` for machine-specific configs
- Use the `delib` library for all module definitions
