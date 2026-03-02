{ delib, pkgs, ... }:
delib.module {
  name = "affine";

  options.affine = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.affine ];
}
