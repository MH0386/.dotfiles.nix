{ delib, pkgs, ... }:
delib.module {
  name = "devenv";

  options.devenv = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.devenv ];
}
