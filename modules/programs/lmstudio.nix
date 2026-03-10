{ delib, pkgs, ... }:
delib.module {
  name = "lmstudio";

  options.lmstudio = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.lmstudio ];
}
