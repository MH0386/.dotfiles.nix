{ delib, pkgs, ... }:
delib.module {
  name = "lmstudio";

  options.lmstudio = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.lmstudio ];
}
