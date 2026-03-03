{
  delib,
  pkgs,
  ...
}:
let
  shared = {
    nix = {
      # package = lib.mkForce pkgs.nixVersions.latest;
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        substituters = [
          "https://cuda-maintainers.cachix.org"
          "https://nix-community.cachix.org"
          "https://devenv.cachix.org"
          "https://cache.flox.dev"
          "https://cache.nixos-cuda.org"
        ];
        trusted-public-keys = [
          "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
          "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
          "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
        ];
        trusted-users = [
          "root"
          "mohamed"
        ];
      };
    };
  };
in
delib.module {
  name = "nix";

  nixos.always = shared // {
    programs.nix-ld.enable = true;
    environment.systemPackages = with pkgs; [
      nixpkgs-reviewFull
      nixfmt
      nixd
      nil
      nix-diff
    ];
  };
  home.always = shared;
}
