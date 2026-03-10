{ delib, pkgs, ... }:
delib.module {
  name = "affine";

  options.affine = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.affine ];
}
