{ delib, pkgs, ... }:
delib.module {
  name = "gdm";

  options.gdm = with delib; {
    enable = boolOption host.gdmFeatured;
  };

  nixos.ifEnabled.services.displayManager.gdm =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };

  home.ifEnabled.home.packages = [ pkgs.gdm-settings ];
}
