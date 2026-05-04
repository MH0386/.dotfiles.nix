{ inputs, ... }:
{
  den.default = {
    nixos =
      { pkgs, ... }:
      {
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
            "https://nixpkgs-python.cachix.org"
            "https://vicinae.cachix.org"
          ];
          trusted-public-keys = [
            "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
            "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
            "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
            "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
            "nixpkgs-python.cachix.org-1:hxjI7pFxTyuTHn2NkvWCrAUcNZLNS3ZAvfYNuYifcEU="
            "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
          ];
          trusted-users = [
            "root"
            "mohamed"
          ];
        };
        programs.nix-ld = {
          enable = true;
          libraries = with pkgs; [
            libcap
            openssl
            wayland
            libxkbcommon
            zlib
          ];
        };
      };
    homeManager =
      { pkgs, pkgsStable, ... }:
      {
        home.packages =
          (with pkgs; [
            nil
            nixd
            nix-diff
            nixfmt
            nixpkgs-review
            nixpkgs-vet
            nixpkgs-lint
            nixpkgs-track
            nix-update
            nixpkgs-hammering
          ])
          ++ (with pkgsStable; [ mcp-nixos ]);
        programs.nix-index = {
          enable = true;
          package = inputs.nix-index.packages.${pkgs.stdenv.hostPlatform.system}.default;
          enableBashIntegration = true;
          enableFishIntegration = true;
          enableNushellIntegration = true;
          enableZshIntegration = true;
        };
      };
  };
}
