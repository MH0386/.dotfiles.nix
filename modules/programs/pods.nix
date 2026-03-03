{ delib, pkgs, ... }:
delib.module {
  name = "pods";

  options.pods = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.pods ];
}
