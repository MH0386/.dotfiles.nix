{
  delib,
  pkgs,
  pkgsStable,
  ...
}:
delib.host {
  name = "MohamedDesktopNixOS";
  type = "desktop";
  # rice = "dark";

  nixos.always = {
    boot.blacklistedKernelModules = [ "nouveau" ];
    # Enable CUPS to print documents.
    services.printing = {
      enable = true;
      listenAddresses = [ "*:631" ];
      allowFrom = [ "all" ];
      browsing = true;
      defaultShared = true;
      openFirewall = true;
      drivers = [ pkgsStable.hplipWithPlugin ];
    };
    # Enable SANE scanning support.
    hardware.sane = {
      enable = true;
      extraBackends = [ pkgsStable.hplipWithPlugin ];
      openFirewall = true;
      backends-package = pkgsStable.sane-backends;
    };
    environment.systemPackages =
      (with pkgs; [
        ddcui
        ddcutil
      ])
      ++ (with pkgsStable; [
        xsane
        sane-backends
        sane-frontends
      ]);
    nixpkgs.config.cudaCapabilities = [ "8.0" ];
  };
}
