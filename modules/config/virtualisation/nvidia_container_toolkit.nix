{ delib, ... }:
delib.module {
  name = "nvidia-container-toolkit";

  options.nvidia-container-toolkit = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      hardware.nvidia-container-toolkit = {
        inherit (cfg) enable;
      };
    };
}
