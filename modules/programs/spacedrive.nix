{ delib, pkgs, ... }:
delib.module {
  name = "spacedrive";

  options.spacedrive = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.spacedrive ];
}
