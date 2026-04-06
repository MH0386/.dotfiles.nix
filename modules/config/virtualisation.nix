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
          hardware.nvidia-container-toolkit.enable = true;
        };
      };

    provides = {
      docker = {
        nixos.virtualisation.docker = {
          enable = true;
          rootless.enable = true;
        };
      };
      podman = {
        nixos.virtualisation.podman.enable = true;
        homeManager =
          { pkgs, ... }:
          {
            home.packages = [ pkgs.podman-desktop ];
          };
      };
      virtManager = {
        nixos.programs.virt-manager.enable = true;
      };
      gnomeBoxes = {
        homeManager =
          { pkgs, ... }:
          {
            home.packages = [ pkgs.gnome-boxes ];
          };
      };
    };
  };
}
