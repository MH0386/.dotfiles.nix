{ delib, pkgs, ... }:
delib.module {
  name = "termius";

  options.termius = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.termius ];
}
