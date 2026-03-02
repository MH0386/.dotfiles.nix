{ delib, pkgs, ... }:
delib.module {
  name = "warp-terminal";

  options.warp-terminal = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.warp-terminal ];
}
