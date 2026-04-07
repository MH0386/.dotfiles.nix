{
  den.default = {
    nixos.networking.firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        8000
        8001
      ];
    };
  };
}
