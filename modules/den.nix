{ inputs, lib, ... }:
let
  mkPkgsStable =
    pkgs:
    import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      config.allowUnfree = true;
    };

  # Add pkgsStable and allowUnfree for both NixOS and home-manager
  common = pkgs: {
    _module.args.pkgsStable = mkPkgsStable pkgs;
    nixpkgs.config.allowUnfree = true;
  };
in
{
  imports = [ inputs.den.flakeModule ];
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  den.default = {
    nixos = { pkgs, ... }: common pkgs;
    homeManager = { pkgs, ... }: common pkgs;
  };
}
