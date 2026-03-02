{ delib, pkgs, ... }:
delib.module {
  name = "prek";

  options.prek = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.prek ];
}
