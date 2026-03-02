{ delib, pkgs, ... }:
delib.module {
  name = "winboat";

  options.winboat = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.winboat ];
}
