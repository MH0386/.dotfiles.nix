{ delib, pkgs, ... }:
delib.module {
  name = "podman";

  options.podman = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      virtualisation.podman = {
        inherit (cfg) enable;
      };
    };

  home.ifEnabled.home.packages = [ pkgs.podman-desktop ];
}
