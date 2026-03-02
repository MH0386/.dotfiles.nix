{ delib, pkgs, ... }:
delib.module {
  name = "termius";

  options.termius = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.termius ];
}
