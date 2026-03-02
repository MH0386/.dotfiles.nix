{ delib, pkgs, ... }:
delib.module {
  name = "jan";

  options.jan = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.jan ];
}
