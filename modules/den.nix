{ inputs, lib, ... }:
let
  mkPkgsStable =
    pkgs:
    import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      config.allowUnfree = true;
    };

  # Provide the stable package set and allow unfree software for both NixOS and Home Manager
  mkDefaultConfig =
    pkgs:
    {
      _module.args.pkgsStable = mkPkgsStable pkgs;
      nixpkgs.config.allowUnfree = true;
    };
in
{
  imports = [ inputs.den.flakeModule ];
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  den.default = {
    nixos = { pkgs, ... }: mkDefaultConfig pkgs;
    homeManager = { pkgs, ... }: mkDefaultConfig pkgs;
  };
}
