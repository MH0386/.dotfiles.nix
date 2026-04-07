{
  den.default = {
    nixos =
      { pkgs, ... }:
      {
        virtualisation = {
          containers.enable = true;
          libvirtd = {
            enable = true;
            qemu.package = pkgs.qemu_kvm;
          };
        };
        hardware.nvidia-container-toolkit.enable = true;
      };
  };
}
