{ pkgs, ... }:
{
  # Bootloader
  boot = {
    kernelParams = [
      "apparmor=1"
      "security=apparmor"
    ];
    kernelModules = [ "apparmor" ];
    # extraModulePackages = [ pkgs.linuxPackages.nvidia_x11 ];
    kernelPackages = pkgs.linuxKernel.packages.linux_6_11;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
