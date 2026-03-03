{ delib, pkgs, ... }:
delib.module {
  name = "prek";

  options.prek = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.prek ];
}
