{ inputs, lib, ... }:
let
  mkPkgsStable =
    pkgs:
    import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      config.allowUnfree = true;
    };
in
{
  imports = [ inputs.den.flakeModule ];
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  # Add pkgsStable and allowUnfree for home-manager and NixOS
  den.default = {
    nixos =
      { pkgs, ... }:
      {
        _module.args.pkgsStable = mkPkgsStable pkgs;
        nixpkgs.config.allowUnfree = true;
      };
    homeManager =
      { pkgs, ... }:
      {
        _module.args.pkgsStable = mkPkgsStable pkgs;
        nixpkgs.config.allowUnfree = true;
      };
  };
}
