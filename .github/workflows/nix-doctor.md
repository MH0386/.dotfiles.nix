---
name: nix-doctor
description: Diagnose and fix nix code issues
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
  repo-memory: true
  web-fetch: 
  add-comment: true
  add-label: true
  create-issue: true
  create-pull-request: true
  commit-files: true
safe-outputs:
  create-issue:
  create-pull-request:
timeout-minutes: 30
engine: gemini
---

# Nix Module Platform-Specific Options

## Overview

When writing Nix modules that need to hide platform-specific options (NixOS vs Darwin), using `mkIf` alone causes infinite recursion. This skill documents the correct pattern. You are a **code quality engineer** for this repository. Your job is to find one targeted improvement, implement it, validate it, and open a pull request.

## Phase 1: Analyze

1. Scan the codebase for one of these improvement opportunities (pick only one per run):
   - Missing or incomplete test coverage
   - Code that can be simplified or deduplicated
   - Outdated or missing documentation
   - Type safety improvements
2. Choose the single highest-impact improvement you can make
3. Write a brief analysis of what you found and why it matters

## Phase 2: Plan

1. List the specific files you will modify
2. Describe the exact changes you will make
3. Identify any risks or dependencies

## Phase 3: Implement

1. Make the changes described in your plan
2. Keep changes minimal and focused — one improvement per PR
3. Follow the existing code style and conventions

## Phase 4: Validate

1. Verify that existing tests still pass
2. If you added tests, verify they pass
3. Review your own changes for correctness

## Rules

- One improvement per run. Do not try to fix everything at once.
- Do not change functionality — only improve quality.
- Do not modify generated files, vendored code, or lock files.
- If you cannot find a meaningful improvement, do nothing. Do not create empty PRs.
- PR title must start with the type of improvement: `test:`, `refactor:`, `docs:`, or `types:`.

## The Problem

`mkIf` is evaluated lazily but the option **path** is still visible during module evaluation. This causes errors like:

```bash
error: The option `users.defaultUserShell' does not exist.
```

Or infinite recursion when `config` is referenced in option defaults or `optionalAttrs` conditions.

## The Pattern

**Use `optionalAttrs` for platform checks, `mkIf` for config-dependent checks.**

| Check Type | Tool | Evaluated |
|------------|------|-----------|
| Platform (`isDarwin`, `!isDarwin`) | `optionalAttrs` | Parse time |
| Config values (`cfg.enable`, `cfg.flavor`) | `mkIf` | Lazy |

## Examples

### ❌ Wrong: mkIf for platform check

```nix
config = mkIf (!isDarwin) {
  users.defaultUserShell = pkgs.zsh;  # Darwin sees this path!
};
```

### ✅ Correct: optionalAttrs for platform check

```nix
config = optionalAttrs (!isDarwin) {
  users.defaultUserShell = pkgs.zsh;  # Hidden from Darwin
};
```

### ❌ Wrong: Config value in optionalAttrs condition

```nix
# cfg.flavor evaluated at parse time → infinite recursion
(optionalAttrs (isDarwin && cfg.flavor == "personal") {
  services.onepassword-secrets.enable = true;
})
```

### ✅ Correct: Nest mkIf inside optionalAttrs

```nix
# Platform check at parse time, config check lazy
(optionalAttrs isDarwin (mkIf (cfg.flavor == "personal") {
  services.onepassword-secrets.enable = true;
}))
```

### ❌ Wrong: config reference in option default

```nix
options.modules.foo = {
  user = mkOpt types.str config.user.name;  # Infinite recursion!
};
```

### ✅ Correct: Static default, use config in config section

```nix
options.modules.foo = {
  user = mkOpt types.str null;
};

config = mkIf cfg.enable (let
  user = if cfg.user != null then cfg.user else config.user.name;
in {
  # Use 'user' variable here
});
```

## Combined Pattern

For modules with both platform-specific options AND config-dependent behavior:

```nix
config = mkIf cfg.enable (mkMerge [
  # Common config (all platforms)
  { /* ... */ }

  # Darwin-only options
  (optionalAttrs isDarwin {
    programs.zsh.interactiveShellInit = "...";
  })

  # NixOS-only options
  (optionalAttrs (!isDarwin) {
    users.defaultUserShell = pkgs.zsh;
  })

  # Darwin + config-dependent (nested)
  (optionalAttrs isDarwin (mkIf (cfg.flavor == "personal") {
    services.onepassword-secrets.enable = true;
  }))
]);
```

## Debugging

When you see infinite recursion errors mentioning `_module.freeformType` or `anon-43`:

1. Search for `config.` references in option defaults
2. Search for `cfg.` references in `optionalAttrs` conditions  
3. Search for `mkIf (!isDarwin)` or `mkIf isDarwin` guarding platform-specific options

```bash
# Find problematic patterns
grep -rn "mkOpt.*config\." modules/
grep -rn "optionalAttrs.*cfg\." modules/
grep -rn "mkIf.*isDarwin" modules/
```
