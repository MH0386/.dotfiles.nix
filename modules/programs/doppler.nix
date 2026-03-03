{ delib, pkgs, ... }:
delib.module {
  name = "doppler";

  options.doppler = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.doppler ];
}
