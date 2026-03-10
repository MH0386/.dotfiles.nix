{ delib, ... }:
delib.module {
  name = "docker";

  options.docker = with delib; {
    enable = boolOption true;
    rootless.enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      virtualisation.docker = {
        inherit (cfg) enable;
        rootless.enable = cfg.rootless.enable;
      };
    };
}
