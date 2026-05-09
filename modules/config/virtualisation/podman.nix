{
  den.default = {
    nixos = {
      virtualisation.podman.enable = true;
      users.users.mohamed.extraGroups = [ "podman" ];
    };
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.podman-desktop ];
      };
  };
}
