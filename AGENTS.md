# Agent Coding Guidelines for AGENTS.md - MH0386's NixOS Dotfiles

## Overview

This is a NixOS dotfiles repository using Nix flakes with the denix module system, home-manager, and devenv. Configuration defines both NixOS system and home-manager user configurations.

## Build/Lint/Test Commands

### Running Tests

```bash
# Run full devenv test suite (includes all linters)
devenv test

# Run individual linters
nixfmt --check .
deadnix --check .
statix check .
taplo check .
yamlfmt --check .
```

### Formatting/Code Fixes

```bash
# Format all files using treefmt
devenv fmt

# Run individual formatters
nixfmt -w .
deadnix -w .
taplo format -w .
```

### Nix Evaluation

```bash
# Evaluate flake to check for errors
nix eval .#nixosConfigurations.MohamedLaptopNixOS.config.system.build.toplevel

# Check flake outputs
nix flake show
```

### Updating Dependencies

```bash
nix flake update      # Update flake lock
devenv update        # Update devenv lockfile
```

---

## Code Style Guidelines

### Project Structure

- **Modules** in `modules/` directory: `modules/config/` for system, `modules/programs/` for apps
- **Hosts** in `hosts/` for machine-specific configs
- Use the `delib` library for all module definitions

### Module Structure

```nix
{ delib, pkgs, ... }:
delib.module {
  name = "module-name";

  options.optionName = with delib; {
    enable = boolOption true;
    someOption = strOption "default";
  };

  nixos.ifEnabled = { cfg, ... }: {
    # NixOS configuration
  };

  home.ifEnabled = { cfg, ... }: {
    # Home-manager configuration
  };
}
```

### Imports

- Import `delib` as the first parameter
- Use `pkgs` for unstable nixpkgs, `pkgsStable` for stable
- Use `lib` from nixpkgs for Nix lib functions (`lib.mkIf`, `lib.mkForce`, etc.)
- Import flake inputs via `inputs` parameter when needed

### Formatting (nixfmt)

- Use **2-space indentation** for Nix expressions
- Use `//` for merging attribute sets
- Use trailing commas in attribute sets and lists

### Naming Conventions

- **Module names**: kebab-case (e.g., `nvidia.nix`, `firefox.nix`)
- **Options**: camelCase (e.g., `enableLFS`, `powerManagement`)
- **Directories**: kebab-case
- **NixOS options**: Follow NixOS naming (e.g., `hardware.nvidia.package`)

### Types and Options

- Define options using `delib` helpers:
  - `boolOption true/false` - Booleans
  - `strOption "default"` - Strings
  - `packageOption pkgs.something` - Packages
  - `listOption []` - Lists
- Always set a sensible default value
- Use `lib.mkIf cfg.enable` for conditional configuration
- Use `lib.mkForce` to override defaults

### Error Handling

- Nix is declarative; errors manifest at evaluation time
- Use `lib.mkIf` or `lib.asserts` for conditional evaluation
- Test changes with `nix eval` before committing
- Run `devenv test` to catch issues before pushing

### Attribute Sets

- Prefer `=` over `:` for definitions
- Use shorthand: `inherit (cfg) enable;`
- Use `//` for merging: `defaults // { extraConfig = true; }`

### Lists

- Use block style for long lists:
  ```nix
  (with pkgs; [
    package1
    package2
    package3
  ])
  ```
- Use `++` to concatenate lists

### Packages

- Use `(with pkgs; [...])` for grouping packages
- Use `pkgs` for unstable, `pkgsStable` for stable
- Use `lib.optionals cfg.condition [packages]` for conditional packages

---

## Additional Tools

### Pre-commit Hooks

Enabled hooks: `nixfmt`, `deadnix`, `statix`, `taplo`, `yamlfmt`, `yamllint`, `actionlint`, `detect-private-keys`

```bash
nix develop -c pre-commit install
nix develop -c pre-commit run -a
```

### Development Shell

```bash
devenv shell   # Enter with all tools
direnv allow  # Or use direnv (already configured)
```

---

## CI/CD

- CI runs on push to `main` and all PRs
- Three jobs: `test` (devenv test), `flake_checker`, scheduled flake/devenv updates
- Do not commit directly to `main`; use PRs
