{
  den.default = {
    nixos.virtualisation.podman.enable = true;
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.podman-desktop ];
      };
  };
}
