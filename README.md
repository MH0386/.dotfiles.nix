# MH0386's NixOS Configuration

[![CI](https://github.com/MH0386/.dotfiles.nix/actions/workflows/ci.yaml/badge.svg)](https://github.com/MH0386/.dotfiles.nix/actions/workflows/ci.yaml)

## Steps

- Add the following to your `/etc/nixos/configuration.nix` file:

  ```nix
  programs.nh = {
    enable = true;
    flake = "/home/mohamed/.dotfiles";
    clean = {
        enable = true;
        extraArgs = "--keep 5";
    };
  };
  nix.settings = {
    experimental-features = [
      "flakes"
      "nix-command"
    ];
    substituters = [
      "https://cuda-maintainers.cachix.org"
      "https://nix-community.cachix.org"
      "https://devenv.cachix.org"
      "https://cache.flox.dev"
      "https://cache.nixos-cuda.org"
      "https://cache.garnix.io"
    ];
    trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
    trusted-users = [
      "root"
      "mohamed"
    ];
  };
  # Make sure to change the hostname
  networking.hostName = "MohamedLaptopNixOS"; # or "MohamedDesktopNixOS";
  ```

- Switch to the new configuration:

  ```bash
  nixos-rebuild switch
  ```

- Download the dotfiles repository:

  ```bash
  nix-shell -p git --run "git clone https://github.com/MH0386/.dotfiles.nix.git ~/.dotfiles"
  ```

- Switch to apply the dotfiles:

  ```bash
  nh os switch ~/.dotfiles
  ```
