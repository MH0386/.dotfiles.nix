{ delib, ... }:
delib.module {
  name = "firewall";
  # Open ports in the firewall.

  options.firewall = with delib; {
    enable = boolOption true;
    allowedTCPPorts = listOfOption port [
      22
      80
      443
      8000
      8001
    ];
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      networking.firewall = {
        inherit (cfg) enable;
        inherit (cfg) allowedTCPPorts;
      };
    };
}
