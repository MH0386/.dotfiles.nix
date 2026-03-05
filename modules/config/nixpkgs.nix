{ delib, ... }:
delib.module {
  name = "nixpkgs";

  nixos.always.nixpkgs.config.allowUnfree = true;
  home.always.home.sessionVariables."NIXPKGS_ALLOW_UNFREE" = 1;
}
