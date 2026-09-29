{ inputs, lib, ... }:
let
  mkPkgsStable =
    pkgs:
    import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      config.allowUnfree = true;
    };

  # NixOS and Home Manager need the same stable package set and the same unfree
  # policy, so share a single module body between both classes.
  withPkgsStable =
    { pkgs, ... }:
    {
      _module.args.pkgsStable = mkPkgsStable pkgs;
      nixpkgs.config.allowUnfree = true;
    };
in
{
  imports = [ inputs.den.flakeModule ];
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  # Add pkgsStable and allowUnfree for home-manager and NixOS
  den.default = {
    nixos = withPkgsStable;
    homeManager = withPkgsStable;
  };
}
