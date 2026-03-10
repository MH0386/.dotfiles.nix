{
  delib,
  config,
  lib,
  modulesPath,
  ...
}:
let
  systemArch = "x86_64-linux";
  stateVersion = "26.05";
in
delib.host {
  name = "MohamedLaptopNixOS";

  # myconfig.boot.mode = "uefi";
  system = systemArch;
  homeManagerSystem = systemArch;
  home.home.stateVersion = stateVersion;

  nixos = {
    nixpkgs.hostPlatform = systemArch;
    system.stateVersion = stateVersion;

    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot = {
      initrd = {
        luks.devices."luks-150fee35-912f-4aed-adee-bfea9571d38e".device =
          "/dev/disk/by-uuid/150fee35-912f-4aed-adee-bfea9571d38e";
        availableKernelModules = [
          "xhci_pci"
          "nvme"
          "usbhid"
          "usb_storage"
          "sd_mod"
          "rtsx_pci_sdmmc"
        ];
        kernelModules = [ ];
      };
      kernelModules = [ "kvm-intel" ];
      extraModulePackages = [ ];
    };

    fileSystems."/" = {
      device = "/dev/mapper/luks-150fee35-912f-4aed-adee-bfea9571d38e";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/45E6-8028";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    swapDevices = [
      { device = "/dev/mapper/luks-4aba3580-cf82-4b77-b7bc-a396118939ad"; }
    ];

    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  };
}
