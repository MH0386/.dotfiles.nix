{ delib, pkgs, ... }:
delib.module {
  name = "shotwell";

  options.shotwell = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.shotwell ];
}
