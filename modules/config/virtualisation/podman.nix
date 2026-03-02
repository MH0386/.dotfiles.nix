{ delib, pkgs, ... }:
delib.module {
  name = "podman";

  options.podman = with delib; {
    enable = boolOption host.containerFeatured;
  };

  nixos.ifEnabled.virtualisation.podman =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };

  home.ifEnabled.home.packages = [ pkgs.podman-desktop ];
}
