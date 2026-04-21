{
  den.default = {
    nixos = {
      virtualisation.docker = {
        enable = true;
        rootless.enable = true;
      };
      users.users.mohamed.extraGroups = [ "docker" ];
    };
  };
}
