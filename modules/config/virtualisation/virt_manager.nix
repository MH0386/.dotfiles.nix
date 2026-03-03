{ delib, ... }:
delib.module {
  name = "virt-manager";

  options.virt-manager = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.virt-manager = {
        inherit (cfg) enable;
      };
    };
}
