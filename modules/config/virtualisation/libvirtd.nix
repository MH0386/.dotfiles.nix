{ delib, pkgs, ... }:
delib.module {
  name = "libvirtd";

  options.libvirtd = with delib; {
    enable = boolOption host.containerFeatured;
  };

  nixos.ifEnabled.virtualisation.libvirtd =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      qemu.package = pkgs.qemu_kvm;
    };
}
