{ delib, ... }:
delib.module {
  name = "firewall";
  # Open ports in the firewall.

  options.firewall = with delib; {
    enable = boolOption host.firewallFeatured;
    allowedTCPPorts = listOptionOf port [
      22
      80
      443
      8000
      8001
    ];
  };

  nixos.ifEnabled.networking.firewall =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      inherit (cfg) allowedTCPPorts;
    };
}
