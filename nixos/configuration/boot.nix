{ pkgs, lib, ... }:
{
  # Bootloader
  boot = {
    # extraModulePackages = [ pkgs.linuxPackages.nvidia_x11 ];
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
    initrd.systemd.enable = true;
  };
}
