{ delib, pkgs, ... }:
delib.module {
  name = "shotwell";

  options.shotwell = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.shotwell ];
}
