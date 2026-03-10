{ delib, pkgs, ... }:
delib.module {
  name = "rustscan";

  options.rustscan = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.rustscan ];
}
