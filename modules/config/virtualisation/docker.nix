{ delib, ... }:
delib.module {
  name = "docker";

  options.docker = with delib; {
    enable = boolOption host.containerFeatured;
    rootless.enable = boolOption true;
  };

  nixos.ifEnabled.virtualisation.docker =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      rootless.enable = cfg.rootless.enable;
    };
}
