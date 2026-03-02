{ delib, ... }:
delib.module {
  name = "amberol";

  options.amberol = with delib; {
    enable = boolOption host.guiFeatured;
  };

  home.ifEnabled.services.amberol =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
