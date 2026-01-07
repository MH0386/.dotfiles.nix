{ pkgs, lib, ... }:
{
  # Bootloader
  boot = {
    kernelParams = [
      "apparmor=1"
      "security=apparmor"
    ];
    kernelModules = [ "apparmor" ];
    # extraModulePackages = [ pkgs.linuxPackages.nvidia_x11 ];
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
