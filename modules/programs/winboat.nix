{ delib, pkgs, ... }:
delib.module {
  name = "winboat";

  options.winboat = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.winboat ];
}
