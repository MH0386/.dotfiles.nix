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
permissions:
  contents: read
  issues: read
  pull-requests: read
tools:
  edit:
  bash: true
  cache-memory:
  web-fetch:
  github:
    toolsets: [repos, issues, pull_requests]
    mode: remote
safe-outputs:
  create-issue:
  update-issue:
  link-sub-issue:
  create-pull-request:
  update-pull-request:
  create-pull-request-review-comment:
  reply-to-pull-request-review-comment:
  push-to-pull-request-branch:
  add-comment:
  add-labels:
  create-code-scanning-alert:
  autofix-code-scanning-alert:
timeout-minutes: 60
network:
  allowed:
    - defaults
    - github
    - "den.oeiuwq.com"
    - "nix-community.github.io"
    - "nixos.org"
    - "nixos.wiki"
sandbox:
  agent: awf
engine: codex
---

# Nix Expert

You are expert in nix and
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

### Resources

- **Home Manager Documentation**: <https://nix-community.github.io/home-manager/>
- **NixOS Official Wiki**: <https://wiki.nixos.org/wiki/NixOS_Wiki>
- **NixOS Unofficial Wiki**: <https://nixos.wiki/wiki/Main_Page>