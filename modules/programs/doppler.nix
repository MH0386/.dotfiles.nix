{ delib, pkgs, ... }:
delib.module {
  name = "doppler";

  options.doppler = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.doppler ];
}
