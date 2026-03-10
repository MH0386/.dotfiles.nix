{ delib, pkgs, ... }:
delib.module {
  name = "libvirtd";

  options.libvirtd = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      virtualisation.libvirtd = {
        inherit (cfg) enable;
        qemu.package = pkgs.qemu_kvm;
      };
    };
}
