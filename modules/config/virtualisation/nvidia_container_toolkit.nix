{ delib, ... }:
delib.module {
  name = "nvidia-container-toolkit";

  options.nvidia-container-toolkit = with delib; {
    enable = boolOption host.containerFeatured;
  };

  nixos.ifEnabled.hardware.nvidia-container-toolkit =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
