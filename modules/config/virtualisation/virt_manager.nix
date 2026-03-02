{ delib, ... }:
delib.module {
  name = "virt-manager";

  options.virt-manager = with delib; {
    enable = singleEnableOption true;
  };

  nixos.ifEnabled.programs.virt-manager =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
