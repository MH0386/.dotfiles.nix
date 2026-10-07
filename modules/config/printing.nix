{
  den.default = {
    nixos.services.printing.enable = true;
  };

  den.aspects.MohamedDesktopNixOS = {
    nixos =
      { pkgsStable, ... }:
      {
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
        environment.systemPackages = with pkgsStable; [
          xsane
          sane-backends
          sane-frontends
        ];
      };
  };
}
