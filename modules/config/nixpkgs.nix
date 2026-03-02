{ delib, ... }:
let
  shared.nixpkgs.config.allowUnfree = true;
  variables."NIXPKGS_ALLOW_UNFREE" = 1;
in
delib.module {
  name = "nixpkgs";

  nixos.always = shared // {
    environment.variables = variables;
  };
  home.always = shared // {
    home.sessionVariables = variables;
  };
}
