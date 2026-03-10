{ delib, ... }:
delib.module {
  name = "container";

  options.container = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      virtualisation.containers = {
        inherit (cfg) enable;
      };
    };
}
