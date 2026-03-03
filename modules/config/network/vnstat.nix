{ delib, ... }:
delib.module {
  name = "vnstat";
  # Whether to enable update of network usage statistics via vnstatd.

  options.vnstat = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      services.vnstat = {
        inherit (cfg) enable;
      };
    };
}
