{ delib, pkgs, ... }:
delib.module {
  name = "gdm";

  options.gdm = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      services.displayManager.gdm = {
        inherit (cfg) enable;
      };
    };

  home.ifEnabled.home.packages = [ pkgs.gdm-settings ];
}
