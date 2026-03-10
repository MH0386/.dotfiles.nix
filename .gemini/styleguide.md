# Gemini Code Assist Guide: MH0386's NixOS Dotfiles

This guide outlines the standards and workflows for assisting with this NixOS configuration project, which uses the **denix** library for modularity and host management.

## 1. Project Architecture

The project is structured around **Nix Flakes**, **Home Manager**, and the **denix** framework.

- **Hosts**: Located in `hosts/`.
  - `hosts/<hostname>/default.nix`: Main host configuration using `delib.host`.
  - `hosts/<hostname>/hardware.nix`: Hardware-specific configurations (e.g., file systems, kernel modules).
- **Modules**: Located in `modules/`.
  - `modules/config/`: System and user-level configuration modules (e.g., `nix.nix`, `locale.nix`, `desktop_environment/`).
  - `modules/programs/`: Application-specific modules (e.g., `git.nix`, `firefox.nix`, `shell/`).
- **Development**: Managed by `devenv` (`devenv.nix`, `devenv.yaml`).

## 2. Nix Coding Standards

### Module Structure (denix)

Always use the `delib.module` syntax. Access global configuration through `myconfig` and module-specific configuration through `cfg`.

```nix
{ delib, pkgs, lib, ... }:

delib.module {
  name = "category.module_name";

  options.category.module_name = with delib; {
    enable = boolOption true;
    # Other options using delib helpers like strOption, listOption, etc.
  };

  # Configuration applied if the module is enabled
  nixos.ifEnabled = { myconfig, cfg, ... }: {
    # NixOS-specific configuration
  };

  home.ifEnabled = { myconfig, cfg, ... }: {
    # Home Manager-specific configuration
  };

  # Configuration always applied
  nixos.always = { ... };
  home.always = { ... };
}
```

### Host Structure (denix)

Hosts are defined using `delib.host`.

```nix
{ delib, ... }:

delib.host {
  name = "hostname";
  type = "laptop"; # or "desktop", "server"

  nixos = {
    # Host-specific NixOS configuration
  };

  home = {
    # Host-specific Home Manager configuration
  };
}
```

### Formatting & Linting

- **Formatter**: `nixfmt` (enforced via `treefmt`).
- **Linters**: `statix` and `deadnix`.
- **Action**: Always run `treefmt` after making changes.

## 3. Workflow & Best Practices

### Adding New Features

1. **Identify Module Location**: Programs go to `modules/programs/`, core configurations to `modules/config/`.
2. **Create/Update Module**: Use the `delib.module` structure.
3. **Automatic Registration**: `denix` automatically discovers modules in the `modules/` directory as specified in `flake.nix`.
4. **Host-Specific Overrides**: Place machine-specific settings in `hosts/<hostname>/default.nix`.

### Handling Secrets

- **NEVER** hardcode secrets.
- Use environment variables or specialized Nix secret managers if integrated.

### Special Arguments

The following are passed to all modules:

- `delib`: The denix library helper.
- `inputs`: All flake inputs.
- `pkgsStable`: Stable nixpkgs.
- `myconfig`: The global evaluated configuration.

## 4. Verification & Deployment

### Local Testing

Before applying changes, test the configuration:

```bash
# Using 'nh' (Nix Helper)
nh os test .
```

### Applying Changes

```bash
# Apply to current system
nh os switch .
```

### Development Shell

Use `devenv shell` to access `treefmt`, `nh`, and other tools.

### Resources

- **Denix Documentation**: https://denix.ynf.sh
- **Denix GitHub**: https://github.com/yunfachi/denix
