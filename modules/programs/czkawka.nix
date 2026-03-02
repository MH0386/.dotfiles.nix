{ delib, pkgs, ... }:
delib.module {
  name = "czkawka";

  options.czkawka = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.czkawka ];
}
