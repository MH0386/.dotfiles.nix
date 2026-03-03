{ delib, ... }:
delib.host {
  name = "MohamedLaptopNixOS";
  type = "laptop";
  # rice = "dark";

  nixos = {
    boot.loader.grub.devices = [ "nodev" ];
    boot.blacklistedKernelModules = [
      "nouveau"
      "nvidia_drm"
      "nvidia_modeset"
      "nvidia"
    ];
    hardware.nvidia.prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    nixpkgs.config.cudaCapabilities = [ "7.5" ];
  };
}
