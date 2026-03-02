{ delib, ... }:
delib.module {
  name = "vnstat";
  # Whether to enable update of network usage statistics via vnstatd.

  options.vnstat = with delib; {
    enable = boolOption host.vnstatFeatured;
  };

  nixos.ifEnabled.services.vnstat =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
