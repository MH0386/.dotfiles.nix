{ delib, pkgs, ... }:
delib.module {
  name = "szyszka";

  options.szyszka = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.szyszka ];
}
