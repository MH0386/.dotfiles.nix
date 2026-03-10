{ delib, pkgs, ... }:
delib.module {
  name = "szyszka";

  options.szyszka = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.szyszka ];
}
