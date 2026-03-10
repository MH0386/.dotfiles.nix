{ delib, pkgs, ... }:
delib.module {
  name = "antigravity";

  options.antigravity = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.antigravity ];
}
