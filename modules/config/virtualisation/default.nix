{ delib, ... }:
delib.module {
  name = "container";

  options.container = with delib; {
    enable = boolOption host.containerFeatured;
  };

  nixos.ifEnabled.virtualisation.containers =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
