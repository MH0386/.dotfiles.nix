{ delib, pkgs, ... }:
delib.module {
  name = "czkawka";

  options.czkawka = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.czkawka ];
}
