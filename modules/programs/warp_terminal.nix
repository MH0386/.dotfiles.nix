{ delib, pkgs, ... }:
delib.module {
  name = "warp-terminal";

  options.warp-terminal = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.warp-terminal ];
}
