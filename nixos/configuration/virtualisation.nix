{ pkgs, ... }:
{
  # Enable common container config files in /etc/containers
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu_kvm;
    };
    containers.enable = true;
  podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
      extraPackages = with pkgs; [
        gvisor
        gvproxy
      ];
    };
  };
}
