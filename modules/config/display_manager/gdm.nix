{ delib, pkgs, ... }:
delib.module {
  name = "gdm";

  options.gdm = with delib; {
    enable = boolOption false;
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
