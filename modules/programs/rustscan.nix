{ delib, pkgs, ... }:
delib.module {
  name = "rustscan";

  options.rustscan = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.rustscan ];
}
