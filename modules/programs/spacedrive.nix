{ delib, pkgs, ... }:
delib.module {
  name = "spacedrive";

  options.spacedrive = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.spacedrive ];
}
