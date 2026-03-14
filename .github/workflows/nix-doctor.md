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
  cache-memory: true
  web-fetch:
  add-comment: true
  add-label: true
  create-issue: true
  create-pull-request: true
  commit-files: true
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
timeout-minutes: 30
network:
  firewall:
    log-level: info
  allowed:
    - defaults
    - github
    - "denix.ynf.sh"
    - "nix-community.github.io"
    - "nixos.org"
    - "nixos.wiki"
    - "opencode.ai"
engine:
  id: codex
  model: "opencode/nemotron-3-super-free"
  env:
    OPENAI_BASE_URL: "https://opencode.ai/zen/v1/chat/completions"
    OPENAI_API_KEY: ${{ secrets.OPENCODE_API_KEY }}
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

### Resources

- **Denix Documentation**: <https://denix.ynf.sh>
- **Denix GitHub**: <https://github.com/yunfachi/denix>
- **Home Manager Documentation**: <https://nix-community.github.io/home-manager/>
- **NixOS Official Wiki**: <https://wiki.nixos.org/wiki/NixOS_Wiki>
- **NixOS Unofficial Wiki**: <https://nixos.wiki/wiki/Main_Page>
