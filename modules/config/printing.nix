{
  den.default = {
    # Enable CUPS to print documents.
    nixos.services.printing.enable = true;
  };

  den.aspects.MohamedDesktopNixOS = {
    nixos =
      { pkgsStable, ... }:
      {
        # Enable CUPS to print documents.
        services.printing = {
          listenAddresses = [ "*:631" ];
          allowFrom = [ "all" ];
          browsing = true;
          defaultShared = true;
          openFirewall = true;
          drivers = [ pkgsStable.hplipWithPlugin ];
        };
        # Enable SANE scanning support.
        hardware.sane = {
          enable = false;
          extraBackends = [ pkgsStable.hplipWithPlugin ];
          openFirewall = true;
          backends-package = pkgsStable.sane-backends;
        };
      };
  };
}
