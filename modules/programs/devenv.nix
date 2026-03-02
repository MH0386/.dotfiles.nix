{ delib, pkgs, ... }:
delib.module {
  name = "devenv";

  options.devenv = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.devenv ];
}
