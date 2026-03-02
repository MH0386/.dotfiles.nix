{ delib, pkgs, ... }:
delib.module {
  name = "antigravity";

  options.antigravity = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.antigravity ];
}
