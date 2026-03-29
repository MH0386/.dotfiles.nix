# AGENTS.md

## Project Overview

NixOS dotfiles configuration using the `vic/den` flake framework with flake-parts, home-manager, and devenv.sh for development environment management.

## Repository Structure

```text
.
├── flake.nix          # Auto-generated via `nix run .#write-flake` (DO NOT EDIT manually)
├── devenv.nix         # Development environment config (pre-commit hooks, treefmt, language support)
├── devenv.yaml        # devenv inputs
├── modules/
│   ├── den.nix        # Den flake module integration
│   ├── dendritic.nix  # Flake-file inputs (auto-generated)
│   ├── defaults.nix   # Default config for all hosts/users
│   ├── mohamed.nix    # User-specific aspect configuration
│   ├── hosts.nix      # Host/user declarations
│   ├── hosts/         # Per-host NixOS/Home Manager overrides
│   ├── config/        # System config modules (nix, boot, audio, etc.)
│   └── programs/      # Program-specific modules
└── hardware/          # Hardware-specific configurations (per hostname)
```

## Build & Deploy Commands

```bash
# Apply full system configuration (requires sudo)
nixos-rebuild switch --flake .#nixos

# Test flake validity
nix flake check

# Run devenv tests (CI command)
devenv test

# Enter development shell
devenv shell

# Regenerate flake.nix (only if using flake-file)
nix run .#write-flake

# Update flake inputs
nix flake update

# Update devenv lockfile
devenv update
```

## Code Formatting & Linting

Formatting is managed via **treefmt** configured in `devenv.nix`. Pre-commit hooks run automatically through devenv.

### Running Formatters

```bash
# Format all files (run from project root)
devenv shell treefmt

# Check formatting without applying
devenv shell treefmt -- --dry-run
```

### Active Formatters/Linters

| Tool         | Scope                    |
| ------------ | ------------------------ |
| nixfmt       | Nix files (`*.nix`)      |
| deadnix      | Dead code detection      |
| statix       | Nix static analysis      |
| yamlfmt      | YAML files               |
| yamllint     | YAML linting             |
| actionlint   | GitHub Actions workflows |
| jsonfmt      | JSON files               |
| taplo        | TOML files               |
| xmllint      | XML files                |
| markdownlint | Markdown files           |

## Nix Code Conventions

### Module Structure

Each module should be a single `.nix` file with a focused concern. Use the `den` module pattern:

```nix
{
  den.schema.conf = {
    nixos = { ... }: {
      # NixOS configuration
    };
    homeManager = { ... }: {
      # Home Manager configuration
    };
  };
}
```

Don't remove a module. Keep nix options modular as much as possible.

### Formatting Rules

- **2-space indentation** (enforced by nixfmt)
- **No trailing whitespace** (pre-commit hook)
- **Trailing newline** at end of file
- **LF line endings** only (no CRLF)
- Use **recursed attribute sets** sparingly; prefer `let...in` or explicit references

### Import Style

```nix
# Good: Destructure at function level
{ pkgs, lib, ... }: { ... }

# Avoid: Importing everything
args: with args; { ... }
```

### Package References

```nix
# Good: Use lib.getExe for executable paths
"${lib.getExe pkgs.treefmt}"

# Avoid: Hardcoded paths or nix store references
```

## YAML Conventions

Per `devenv.nix` and `.github/lint/.yamlfix.toml`:

- **Max line length**: 120 characters (yamllint) / 140 characters (yamlfmt)
- **No document-start markers** (`---`)
- **Block-style sequences** (not flow)
- **1 space minimum** between comments and content
- **No truthy value restrictions** (disabled)
- **Trim trailing whitespace**

## Git Workflow

### Branch Strategy

- `main` branch is protected
- Use descriptive branch names (e.g., `feature/add-helix`, `fix/boot-config`)
- PRs auto-merge via Mergify when CI passes (for Renovate PRs)

### Commit Style

Follow conventional commits:

```bash
# Format
<type>: <description>

# Examples
feat: add helix editor module
fix: correct nvidia bus ID for laptop
chore: update flake.lock
ci: adjust workflow permissions
```

### Pre-commit Hooks

All hooks run via devenv. Key hooks that may auto-fix files:

- `nixfmt` — auto-formats Nix
- `deadnix` — detects unused variables
- `statix` — suggests Nix improvements
- `yamlfmt` — auto-formats YAML

**Important**: If pre-commit hooks modify files, CI will auto-commit fixes.

## Key Tools

| Tool        | Purpose                            |
| ----------- | ---------------------------------- |
| devenv      | Development environment management |
| direnv      | Automatic environment activation   |
| treefmt     | Multi-language formatter           |
| nixfmt      | Nix formatter                      |
| deadnix     | Nix dead code detector             |
| statix      | Nix linter                         |
| nh          | NixOS helper (for rebuilds)        |
| flake-file  | Auto-generate flake.nix            |
| import-tree | Import Nix modules from directory  |

## Testing Changes

```bash
# Validate flake structure
nix flake check

# Dry-run rebuild (doesn't apply changes)
nixos-rebuild dry-build --flake .#nixos

# Test in CI mode (runs pre-commit hooks)
devenv test

# Build specific host configuration
nixos-rebuild build --flake .#MohamedLaptopNixOS
```

## Common Gotchas

1. **flake.nix is auto-generated** — Edit module files, then run `nix run .#write-flake` to regenerate
2. **devenv.local.nix is gitignored** — Use for local overrides that shouldn't be committed
3. **Hardware configs are host-specific** — Place in `hardware/<hostname>-configuration.nix`
4. **Nixpkgs unstable** — The flake tracks `nixpkgs-unstable` channel
5. **Lix package set** — Uses Lix (Nix fork) via `pkgs.lixPackageSets.stable.lix`

## CI/CD

GitHub Actions runs:

- `devenv test` — Lint and format checks
- `flake-checker` — Validates flake inputs
- Auto-commit hook fixes if they pass

## No Existing Rules Files

No `.cursorrules`, `.cursor/rules/`, or `.github/copilot-instructions.md` found in this repository. This AGENTS.md serves as the primary guidance for coding agents.
