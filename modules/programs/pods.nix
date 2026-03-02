{ delib, pkgs, ... }:
delib.module {
  name = "pods";

  options.pods = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.pods ];
}
