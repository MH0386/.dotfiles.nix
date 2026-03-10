{ delib, pkgs, ... }:
delib.module {
  name = "jan";

  options.jan = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.jan ];
}
