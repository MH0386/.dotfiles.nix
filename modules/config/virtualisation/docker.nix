{
  den.default = {
    nixos = {
      virtualisation.docker = {
        enable = true;
      };
      users.users.mohamed.extraGroups = [ "docker" ];
    };
  };
}
