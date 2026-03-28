{ pkgs, ... }:
{
  # Enable common container config files in /etc/containers
  virtualisation = {
    containers.enable = true;
    docker = {
      enable = true;
      rootless = {
        enable = true;
      };
    };
    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu_kvm;
    };
    podman = {
      enable = true;
    };
  };
}
