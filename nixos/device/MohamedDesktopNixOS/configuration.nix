{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  # Define your hostname.
  networking.hostName = "MohamedDesktopNixOS";
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    listenAddresses = [ "*:631" ];
    allowFrom = [ "all" ];
    browsing = true;
    defaultShared = true;
    openFirewall = true;
    drivers = [ pkgs.stablePackages.hplipWithPlugin ];
  };
  # Enable SANE scanning support.
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.stablePackages.hplipWithPlugin ];
    openFirewall = true;
    backends-package = pkgs.stablePackages.sane-backends;
  };
  environment.systemPackages =
    (with pkgs; [
      ddcui
      ddcutil
    ])
    ++ (with pkgs.stablePackages; [
      xsane
      sane-backends
      sane-frontends
    ]);
  nixpkgs.config.cudaCapabilities = [ "8.0" ];
}
